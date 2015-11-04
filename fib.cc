#include <iostream>
#include <string>

int fib(int n) {
  return n < 2 ? n : fib(n - 1) + fib(n - 2);
}

int main(int argc, char** argv) {
  std::cout << fib(std::stoi(argv[1])) << std::endl;
  return 0;
}
