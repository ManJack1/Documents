#include "iostream"
#include <cstdio>
void func(void);

static int count = 10;

void main1() {
  while (count--) {
    func();
  }
}

void func(void) {
  static int i = 5;
  i++;
  std::cout << " i is :" << i;
  std::cout << " and count is :" << count << std::endl;
}

// NOTE:static Scope is available only in the file where it is defined.It can
// definded in the global scope or inside the function.

//NOTE:Because "func" is after "main1",So the func needs to definded in before main1


