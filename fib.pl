sub fib {
    my $n = shift;
    return $n < 2 ? $n : fib($n - 1) + fib($n - 2);
}

print fib($ARGV[0]), "\n";
