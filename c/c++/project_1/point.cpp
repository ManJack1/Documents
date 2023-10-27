#include <iostream>

using namespace std;

const int MAX = 3;

void main8() {
  // NOTE: The point's Address
  /* int var1; */
  /* char var2[10]; */
  /**/
  /* cout << "Address of var1 variable: "; */
  /* cout << &var1 << endl; */
  /**/
  /* cout << "Address of var2 variable: "; */
  /* cout << &var2 << endl; */

  // NOTE: The point's operation

  int var[MAX] = {10, 100, 200};
  int *ptr;

  ptr = var;

  for (int i = 0; i < MAX; i++) {
    cout << "Address of var[" << i << "] = ";
    cout << ptr << endl;

    cout << "Value of var[" << i << "] = ";
    cout << *ptr << endl;

    ptr++;
  }
}
