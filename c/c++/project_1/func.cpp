#include "iostream"

int max(int num1, int num2);

void main4() {
  int a, b;
  std::cout << "please input a, b" << std::endl;
  std::cin >> a >> b;

  std::cout << "The max num: " << max(a, b) << std::endl;
}

int max(int num1, int num2) {
  int result;
  if (num1 > num2) {
    result = num1;
  } else {
    result = num2;
  }
  return result;
}

// NOTE: The func needs declare before main func, or the compiler will not find
// it.
//  1.The formattion of declare func is:
//  type func_name(type1 arg1, type2 arg2, ...) {
//   body of func
//   return result;
//   }
//   The calling of func is like this:
//   func_name(arg1, arg2, ...);
//   or
//   type result = func_name(arg1, arg2, ...);
//   2.The func can be called in the main func or other func.
//   3.The function need to be declare before the main func. and it's formmater
//   is: type func_name(type1 arg1, type2 arg2, ...); The args is no need  or
//   type func_name(); if the func has no args.

// point call func

void swap(int *x, int *y) {
  int temp;
  temp = *x; /* save the value at address x */
  *x = *y;   /* put y into x */
  *y = temp; /* put x into y */
}
