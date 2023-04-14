import 'dart:io';

void main() {
  String name = "ANasakdnkjandwwankj";
  int age = 25;
  age = 45;
  //NULL able data tyoes
  double? weight;

  print("Enter the first number");
  int? number = int.parse(stdin.readLineSync()!);

  print("Enter the second number");
  int? number2 = int.parse(stdin.readLineSync()!);

  int sum = number + number2;
  print("The sum of the numbers is $sum");

  int diff = number - number2;
  int prod = number * number2;
  double quo = number / number2;

  print("the difference between the number is $diff");
  print("the product of the numbers is $prod");
  print("the quotieont of the numbers is $quo");
}
