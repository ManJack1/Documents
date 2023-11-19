#include "iostream"
using namespace std;

class Shape {
public:
  virtual int getArea() = 0;
  void setWidth(int w) { width = w; }
  void setHeight(int h) { height = h; }

protected:
  int width;
  int height;
};

class Rectangle : public Shape {
public:
  int getArea() { return width * height; }
};

class triangle : public Shape {

  int getArea() { return width * height / 2; }
};

int main() {
  Rectangle Rect;
  triangle tri;
  Rect.setHeight(9);
  Rect.setWidth(3);
  cout << Rect.getArea() << endl;
}
