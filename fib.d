import std.stdio;
import std.conv;

int fib(int n) {
    return n < 2 ? n : fib(n - 1) + fib(n - 2);
}

void main(string[] args) {
    writeln(fib(to!int(args[1])));
}
