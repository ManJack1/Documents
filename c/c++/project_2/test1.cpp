// writing a fib
#include <iostream>
#include <string>
using namespace std;
int main() {
  int n;
  cin >> n;
  int a = 0;
  int b = 1;
  int c;
  for (int i = 1; i <= n; i++) {
    cout << a << endl;
    c = a + b;
    a = b;
    b = c;
  }
  return 0;
}
