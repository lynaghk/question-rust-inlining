#[inline(always)]
fn match2(x: u8) -> u64 {
    match x {
        b'A' => 1,
        b'B' => 2,
        _ => 0,
    }
}

#[inline(always)]
fn match4(x: u8) -> u64 {
    match x {
        b'A' => 1,
        b'B' => 2,
        b'C' => 3,
        b'D' => 4,
        _ => 0,
    }
}

#[inline(always)]
fn match8(x: u8) -> u64 {
    match x {
        b'A' => 1,
        b'B' => 2,
        b'C' => 3,
        b'D' => 4,
        b'E' => 5,
        b'F' => 6,
        b'G' => 7,
        b'H' => 8,
        _ => 0,
    }
}

const LOOKUP: [u64; 256] = [
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    1, 2, 3, 4, 5, 6, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
];

#[inline(always)]
fn lookup2(x: u8) -> u64 {
    LOOKUP[x as usize]
}

#[inline(always)]
fn lookup4(x: u8) -> u64 {
    LOOKUP[x as usize]
}

#[inline(always)]
fn lookup8(x: u8) -> u64 {
    LOOKUP[x as usize]
}

use criterion::{criterion_group, criterion_main, Bencher, Criterion};
fn criterion_benchmark(c: &mut Criterion) {
    let xs2 = vec!['A', 'B'];
    let xs4 = vec!['A', 'B', 'C', 'D'];
    let xs8 = vec!['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
    let mut rng: rand::rngs::SmallRng = rand::SeedableRng::seed_from_u64(1);
    use rand::seq::SliceRandom;
    let s2: String = (0..10000).map(|_| xs2.choose(&mut rng).unwrap()).collect();
    let s4: String = (0..10000).map(|_| xs4.choose(&mut rng).unwrap()).collect();
    let s8: String = (0..10000).map(|_| xs8.choose(&mut rng).unwrap()).collect();

    ////////////////////////////////////////////
    //invoked via fn reference, so not inlined

    for (size, s, f_match, f_lookup) in vec![
        (2, &s2, match2 as fn(u8) -> u64, lookup2 as fn(u8) -> u64),
        (4, &s4, match4 as fn(u8) -> u64, lookup4 as fn(u8) -> u64),
        (8, &s8, match8 as fn(u8) -> u64, lookup8 as fn(u8) -> u64),
    ] {
        for (label, f) in vec![("match", f_match), ("lookup", f_lookup)] {
            {
                let s = s.clone();
                c.bench_function(
                    &format!("sum,{},not inline,{}", label, size),
                    move |b: &mut Bencher| {
                        b.iter(|| {
                            let mut sum = 0;
                            for x in s.as_bytes() {
                                sum += f(*x);
                            }
                            sum
                        })
                    },
                );
            }

            {
                let s = s.clone();
                c.bench_function(
                    &format!("mix,{},not inline,{}", label, size),
                    move |b: &mut Bencher| {
                        b.iter(|| {
                            let mut out: u64 = 0;
                            for idx in 0..1000 {
                                for x in s.as_bytes().iter().skip(idx).take(32) {
                                    out ^= f(*x)
                                }
                            }
                            out
                        })
                    },
                );
            }

            {
                let s = s.clone();
                c.bench_function(
                    &format!("mix with rotate,{},not inline,{}", label, size),
                    move |b: &mut Bencher| {
                        b.iter(|| {
                            let mut out: u64 = 0;
                            for idx in 0..1000 {
                                for x in s.as_bytes().iter().skip(idx).take(32) {
                                    out ^= f(*x).rotate_left(idx as u32)
                                }
                            }
                            out
                        })
                    },
                );
            }
        }
    }

    //////////////////////
    //s2 inline

    {
        {
            let s = s2.clone();
            c.bench_function("sum,lookup,inline,2", move |b: &mut Bencher| {
                b.iter(|| {
                    let mut sum = 0;
                    for x in s.as_bytes() {
                        sum += lookup2(*x);
                    }
                    sum
                })
            });
        }

        {
            let s = s2.clone();
            c.bench_function("sum,match,inline,2", move |b: &mut Bencher| {
                b.iter(|| {
                    let mut sum = 0;
                    for x in s.as_bytes() {
                        sum += match2(*x);
                    }
                    sum
                })
            });
        }

        {
            let s = s2.clone();
            c.bench_function("mix,match,inline,2", move |b: &mut Bencher| {
                b.iter(|| {
                    let mut out: u64 = 0;
                    for idx in 0..1000 {
                        for x in s.as_bytes().iter().skip(idx).take(32) {
                            out ^= match2(*x)
                        }
                    }
                    out
                })
            });
        }

        {
            let s = s2.clone();
            c.bench_function("mix with rotate,match,inline,2", move |b: &mut Bencher| {
                b.iter(|| {
                    let mut out: u64 = 0;
                    for idx in 0..1000 {
                        for x in s.as_bytes().iter().skip(idx).take(32) {
                            out ^= match2(*x).rotate_left(idx as u32)
                        }
                    }
                    out
                })
            });
        }

        {
            let s = s2.clone();
            c.bench_function("mix,lookup,inline,2", move |b: &mut Bencher| {
                b.iter(|| {
                    let mut out: u64 = 0;
                    for idx in 0..1000 {
                        for x in s.as_bytes().iter().skip(idx).take(32) {
                            out ^= lookup2(*x)
                        }
                    }
                    out
                })
            });
        }

        {
            let s = s2.clone();
            c.bench_function("mix with rotate,lookup,inline,2", move |b: &mut Bencher| {
                b.iter(|| {
                    let mut out: u64 = 0;
                    for idx in 0..1000 {
                        for x in s.as_bytes().iter().skip(idx).take(32) {
                            out ^= lookup2(*x).rotate_left(idx as u32)
                        }
                    }
                    out
                })
            });
        }
    }

    //////////////////////
    //s4 inline

    {
        {
            let s = s4.clone();
            c.bench_function("sum,lookup,inline,4", move |b: &mut Bencher| {
                b.iter(|| {
                    let mut sum = 0;
                    for x in s.as_bytes() {
                        sum += lookup4(*x);
                    }
                    sum
                })
            });
        }

        {
            let s = s4.clone();
            c.bench_function("sum,match,inline,4", move |b: &mut Bencher| {
                b.iter(|| {
                    let mut sum = 0;
                    for x in s.as_bytes() {
                        sum += match4(*x);
                    }
                    sum
                })
            });
        }

        {
            let s = s4.clone();
            c.bench_function("mix,match,inline,4", move |b: &mut Bencher| {
                b.iter(|| {
                    let mut out: u64 = 0;
                    for idx in 0..1000 {
                        for x in s.as_bytes().iter().skip(idx).take(32) {
                            out ^= match4(*x)
                        }
                    }
                    out
                })
            });
        }

        {
            let s = s4.clone();
            c.bench_function("mix with rotate,match,inline,4", move |b: &mut Bencher| {
                b.iter(|| {
                    let mut out: u64 = 0;
                    for idx in 0..1000 {
                        for x in s.as_bytes().iter().skip(idx).take(32) {
                            out ^= match4(*x).rotate_left(idx as u32)
                        }
                    }
                    out
                })
            });
        }

        {
            let s = s4.clone();
            c.bench_function("mix,lookup,inline,4", move |b: &mut Bencher| {
                b.iter(|| {
                    let mut out: u64 = 0;
                    for idx in 0..1000 {
                        for x in s.as_bytes().iter().skip(idx).take(32) {
                            out ^= lookup4(*x)
                        }
                    }
                    out
                })
            });
        }

        {
            let s = s4.clone();
            c.bench_function("mix with rotate,lookup,inline,4", move |b: &mut Bencher| {
                b.iter(|| {
                    let mut out: u64 = 0;
                    for idx in 0..1000 {
                        for x in s.as_bytes().iter().skip(idx).take(32) {
                            out ^= lookup4(*x).rotate_left(idx as u32)
                        }
                    }
                    out
                })
            });
        }
    }

    //////////////////////
    //s8 inline
    {
        {
            let s = s8.clone();
            c.bench_function("sum,lookup,inline,8", move |b: &mut Bencher| {
                b.iter(|| {
                    let mut sum = 0;
                    for x in s.as_bytes() {
                        sum += lookup8(*x);
                    }
                    sum
                })
            });
        }

        {
            let s = s8.clone();
            c.bench_function("sum,match,inline,8", move |b: &mut Bencher| {
                b.iter(|| {
                    let mut sum = 0;
                    for x in s.as_bytes() {
                        sum += match8(*x);
                    }
                    sum
                })
            });
        }

        {
            let s = s8.clone();
            c.bench_function("mix,match,inline,8", move |b: &mut Bencher| {
                b.iter(|| {
                    let mut out: u64 = 0;
                    for idx in 0..1000 {
                        for x in s.as_bytes().iter().skip(idx).take(32) {
                            out ^= match8(*x)
                        }
                    }
                    out
                })
            });
        }

        {
            let s = s8.clone();
            c.bench_function("mix with rotate,match,inline,8", move |b: &mut Bencher| {
                b.iter(|| {
                    let mut out: u64 = 0;
                    for idx in 0..1000 {
                        for x in s.as_bytes().iter().skip(idx).take(32) {
                            out ^= match8(*x).rotate_left(idx as u32)
                        }
                    }
                    out
                })
            });
        }

        {
            let s = s8.clone();
            c.bench_function("mix,lookup,inline,8", move |b: &mut Bencher| {
                b.iter(|| {
                    let mut out: u64 = 0;
                    for idx in 0..1000 {
                        for x in s.as_bytes().iter().skip(idx).take(32) {
                            out ^= lookup8(*x)
                        }
                    }
                    out
                })
            });
        }

        {
            let s = s8.clone();
            c.bench_function("mix with rotate,lookup,inline,8", move |b: &mut Bencher| {
                b.iter(|| {
                    let mut out: u64 = 0;
                    for idx in 0..1000 {
                        for x in s.as_bytes().iter().skip(idx).take(32) {
                            out ^= lookup8(*x).rotate_left(idx as u32)
                        }
                    }
                    out
                })
            });
        }
    }
}

criterion_group!(benches, criterion_benchmark);
criterion_main!(benches);
