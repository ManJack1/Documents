
#include <iostream>

void hanoi(int n, char A, char B, char C) {
  if (n == 1) {
    std::cout << "Move disk 1 from " << A << " to " << C << std::endl;
  } else {
    hanoi(n - 1, A, C, B);
    std::cout << "Move disk " << n << " from " << A << " to " << C << std::endl;
    hanoi(n - 1, B, A, C);
  }
}

int main() {
  int disks;
  std::cout << "Enter the number of disks: ";
  std::cin >> disks;
  hanoi(disks, 'A', 'B', 'C');
  return 0;
}
