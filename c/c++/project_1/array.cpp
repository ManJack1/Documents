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

  int sum = 0;
  for (int i = 0; i < size; i++) {
    sum += balance[i];
    cout << "The " << i + 1 << " num is :" << balance[i] << endl;
  }
  cout << "The sum is :" << sum << endl;
}
