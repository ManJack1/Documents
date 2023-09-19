// writing a fib
#include <iostream>
#include <string>
using namespace std;
int fib(int n) {
  if (n < 2)
    return n;
  return fib(n - 1) + fib(n - 2);
}

int main() {
  int n;
  cout << "Enter a number: ";
  cin >> n;
  cout << "Fibonacci of " << n << " is " << fib(n) << endl;
  return 0;
}
