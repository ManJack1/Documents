#include <iostream>
#include <limits>

using namespace std;
extern void main8();
// Class Scope
/* class Myclass { */
/* public: */
/*   static int class_var; */
/* }; */

/* int Myclass::class_var = 30; */

int main() {
  /*NOTE:enum class example:
   * enum color { red, green, blue } c; */
  /* c = blue; */
  /* cout << c << endl; */

  /*NOTE: Type exchange example
   * int i = 10; */
  /* float f = static_cast<float>(i); */
  /* cout << f << endl; */

  /* NOTE: The Scope in C++ *
   * int a = 10; */
  /* { */
  /*   int a = 20; */
  /*   cout << "internal a:" << a << endl; */
  /* } */
  /* cout << "external a:" << a << endl; */
  /* return 0; */

  /* cout << "Class Scope:" << Myclass::class_var << endl; */
  /* return 0; */
  /* main1(); */
  /* main2(); */
  main8();
  return 0;
}
