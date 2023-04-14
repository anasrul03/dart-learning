import 'dart:io';
import 'dart:math';

void main() {
  print("Enter the height number:");
  double? h = double.parse(stdin.readLineSync()!);
  print("Enter the width number:");
  double? w = double.parse(stdin.readLineSync()!);

  double sum = h + w;
  double area = h * w;
  double per = sum * 2;
  num diag = sqrt(pow(h, 2) + pow(w, 2));

  print("The area of the rectangle is: $area");
  print("The perimeter of the rectangle is: $per");
  print("The diagonal of the rectangle is: $diag");
}
