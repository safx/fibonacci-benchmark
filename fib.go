package main

import (
  "fmt"
  "os"
  "strconv"
)

func fib(a int) int {
  if a < 2 {
    return a
  } else {
    return fib(a - 1) + fib(a - 2)
  }
}

func main() {
  n, _ := strconv.Atoi(os.Args[1])
  fmt.Println(fib(n))
}
