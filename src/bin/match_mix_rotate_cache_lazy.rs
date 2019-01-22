use lazy_static::lazy_static;
lazy_static! {
    static ref LOOKUP: [u64; 256] = {
        let mut l = [0; 256];

        l[b'A' as usize] = 1;
        l[b'B' as usize] = 2;
        l[b'C' as usize] = 3;
        l[b'D' as usize] = 4;
        l[b'E' as usize] = 5;
        l[b'F' as usize] = 6;
        l[b'G' as usize] = 7;
        l[b'H' as usize] = 8;

        l
    };
}

#[inline(always)]
fn lookup4(x: u8) -> u64 {
    LOOKUP[x as usize]
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

pub fn match_mix_4(s: &str) -> u64 {
    let mut out: u64 = 0;
    for idx in 0..1000 {
        for x in s.as_bytes().iter().skip(idx).take(32) {
            out ^= match4(*x).rotate_left(idx as u32)
        }
    }
    out
}

pub fn main() {
    let mut rng: rand::rngs::SmallRng = rand::SeedableRng::seed_from_u64(1);
    use rand::seq::SliceRandom;
    let xs4 = vec!['A', 'B', 'C', 'D'];
    let s4: String = (0..10000).map(|_| xs4.choose(&mut rng).unwrap()).collect();

    println!("{}", lookup4(b'A'));

    let mut res = 0;
    for _ in 0..1000 {
        res += match_mix_4(&s4);
    }
    println!("{}", res);
}
