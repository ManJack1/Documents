// 写一个斐多数列
public class Main {
  public static void main(String[] args) {
    System.out.println("Hello World!");
    int i = 0;
    int j = 1;
    int k = 0;
    System.out.println(i);
    System.out.println(j);
    while (k < 100) {
      k = i + j;
      System.out.println(k);
      i = j;
      j = k;
    }
  }
}
