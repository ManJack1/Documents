// TODO:第一章
/* #include <iostream> */
/**/
/* int main() { */
/*   std::cout << "HelloWorld!" << std::endl; */
/*   std::cout << "MotherFucker!" << std::endl; */
/**/
/*   std::cout << 3 + 4; */
/*   return 0; */
/* } */

// NOTE:输入

#include <iostream>
#include <string>
int main() {
  std::cout << "Please enter your first name:";
  std::string name;
  std::cin >> name;

  std::cout << "hellow," << name << "!" << std::endl;
  return 0;
}
