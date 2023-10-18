#include "cstdlib"
#include <ctime>
#include <iostream>

using namespace std;

void main5() {
  int i, j;
  srand((unsigned)time(NULL));

  for (i = 0; i < 10; i++) {
    j = rand();
    cout << "rand num: " << j << endl;
  }
}
