#include "iostream"

using namespace std;

int main3() {
  int a, b;
  std::cout << "Pleace input a, b:" << std::endl;
  cin >> a;
  cin >> b;
  a > b ? cout << "a>b" : cout << "a<b";
  return 0;
}
