import 'dart:io';
import 'dart:math';

void main() {
  print("Please input decimal number ; ");

  double? input = double.parse(stdin.readLineSync()!);

  double square = sqrt(input);

  num cubee = pow(input, 2);

  num rD = input.floor();
  num rU = input.ceil();
  print("The square root number is $square ");
  print("The cube root is $cubee ");
  print("Round up: $rU and Round Down: $rD ");
}
