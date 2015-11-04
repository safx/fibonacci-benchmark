use std::env;

fn fib(n: isize) -> isize {
    if n < 2 {
        n
    } else {
        fib(n - 1)  + fib(n - 2)
    }
}

fn main() {
    if let Some(s) = env::args().nth(1) {
        if let Ok(n) = s.parse::<isize>() {
            println!("{}", fib(n));
        }
    }
}
