func fib(n: Int) -> Int {
    return n < 2 ? n : fib(n - 1)  + fib(n - 2)
}

print(fib(Int(Process.arguments[1])!))
