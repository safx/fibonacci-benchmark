proc fib(n): int return if n < 2 then n else fib(n - 1) + fib(n - 2);

config var n = 2;
writeln(fib(n));
