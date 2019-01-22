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

pub fn match_mix_4(s: &str) -> u64 {
    let mut out: u64 = 0;
    for idx in 0..1000 {
        for x in s.as_bytes().iter().skip(idx).take(32) {
            out ^= match4(*x)
        }
    }
    out
}

pub fn main() {
    let mut rng: rand::rngs::SmallRng = rand::SeedableRng::seed_from_u64(1);
    use rand::seq::SliceRandom;
    let xs4 = vec!['A', 'B', 'C', 'D'];
    let s4: String = (0..10000).map(|_| xs4.choose(&mut rng).unwrap()).collect();

    let mut res = 0;
    for _ in 0..100000 {
        res += match_mix_4(&s4);
    }
    println!("{}", res);
}
