#include "iostream"
using namespace std;
int main2() {
  int a = 10;
  bool b = true;
  while (b == true) {
    cout << "a:" << a << endl;
    a++;
    if (a == 20) {
      b = false;
    }
  }

  return 0;
}
