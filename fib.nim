import os
import strutils

proc fib(n: int): int =
  result = if n < 2: n else: fib(n - 1) + fib(n - 2)

echo(fib(parseInt(paramStr(1))))
