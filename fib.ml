let rec fib n =
  if n < 2 then n else fib (n - 1) + fib (n - 2);;

print_int (fib (int_of_string Sys.argv.(1)));
print_newline ()
