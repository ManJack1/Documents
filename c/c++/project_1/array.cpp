#include "iostream"
using namespace std;
void main6() {
  int size;
  cout << "Please input the size of array :" << endl;
  cin >> size;
  double balance[size];
  for (int i = 0; i < size; i++) {
    cout << "Please input the " << i + 1 << " num:" << endl;
    cin >> balance[i];
  }
}
