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

pub fn match_sum_4(s: &str) -> u64 {
    let mut sum = 0;
    for x in s.as_bytes() {
        sum += match4(*x);
    }
    sum
}
