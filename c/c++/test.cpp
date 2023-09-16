#include <iostream>
#include <string>

using namespace std;
int main() {
  const int line_size = 8;
  int cnt = 1;
  int a = 1, b = 2, c = 3;
  cout << (cnt % line_size ? "name" : "sad") << "\n";
  cout << (a == c or b == a);
  return 0;
}
