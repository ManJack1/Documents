#include "iostream"
#include "string"
// writing a fibonacci series
int main() {
  int n;
  std::cout << "Enter the number of terms you want to print: ";
  std::cin >> n;
  int a = 0, b = 1, c;
  std::cout << a << " " << b << " ";
  for (int i = 0; i < n - 2; i++) {
    c = a + b;
    std::cout << c << " ";
    a = b;
    b = c;
  }
  return 0;
}
