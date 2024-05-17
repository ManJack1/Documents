#include "string"
#include <iostream>
using namespace std;

int main1(int argc, char *argv[]) {
  int a;
  cin >> a;
  switch (a) {
  case 1:
    cout << "1"
         << "\n";
    break;
  case 2:
    cout << "2" << endl;
    break;
  case 3:
    cout << "3" << endl;
    break;
  default:
    cout << ">3 or <3";
    break;
  }
}
