import 'dart:io';

void main() {
  print("Enter the first number");
  int? number = int.parse(stdin.readLineSync()!);

  print("Enter the second number");
  int? number2 = int.parse(stdin.readLineSync()!);

  print("Enter the third number");
  int? number3 = int.parse(stdin.readLineSync()!);

  int sum = (number * number * number) - (number2 * number2) + number3;
  print("The result is $sum");
}
