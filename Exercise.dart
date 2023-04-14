import 'dart:io';
import 'dart:math';

void main() {
// Exercise1();

// typedef OperationFunctionType = int Function(int,int);
  // print("inset num 1 :");
  // int input1 = int.parse(stdin.readLineSync()!);
  // print("inset num 2 :");
  // int input2 = int.parse(stdin.readLineSync()!);

  // Exercise2(
  //   a: input1,
  //   b: input2,
  // );

  // Exercise3();
  // Exercise4();

  Exercise5();
}

//Condition
void Exercise1() {
  print("Please enter your name: ");
  final name = stdin.readLineSync();

  print("Please enter your age: ");
  final age = int.parse(stdin.readLineSync()!);

  print("Please enter your job title: ");
  final job = stdin.readLineSync();

  print("Please enter your salary: ");
  final salary = double.parse(stdin.readLineSync()!);

  print("Are you married ? Y/N ");
  final isMarried = stdin.readLineSync()!.toUpperCase();

  final String checkFit = age >= 18 &&
          job == "Software Engineer" &&
          salary >= 60000 &&
          isMarried == "N"
      ? "Candidate does FITS the criteria"
      : "Candidate DOES NOT FITS the criteria";
  print(checkFit);
}

//Function
void Exercise2({
  required int a,
  required int b,
}) {
  print("which calc do u want?");
  print("1. add");
  print("2. subtract");
  print("3. multiply");
  print("4. divide");

  int input3 = int.parse(stdin.readLineSync()!);
  while (input3 < 5) {
    var add = (a, b) {
      return a + b;
    };
    var subtract = (a, b) {
      return a - b;
    };
    var multiply = (a, b) {
      return a * b;
    };
    var divide = (a, b) {
      return a / b;
    };
    try {
      switch (input3) {
        case 1:
          print("$a + $b result is: ${add(a, b)}");
          break;
        case 2:
          print("$a - $b: ${subtract(a, b)}");
          break;
        case 3:
          print("$a * $b: ${multiply(a, b)}");
          break;
        case 4:
          print("$a / $b: ${divide(a, b)}");
          break;
        default:
      }
      break;
    } catch (e) {
      print('Invalid input. Please enter a valid number.');
    }
  }
}

// Loop
void Exercise3() {
  int days = 1;

  for (int i = days; i < 8; i++) {
    switch (i) {
      case 1:
        stdout.write("$i Monday");
        break;
      case 2:
        stdout.write("$i Tuesday");
        break;
      case 3:
        stdout.write("$i Wednesday");
        break;
      case 4:
        stdout.write("$i Thursday");
        break;
      case 5:
        stdout.write("$i Friday");
        break;
      case 6:
        stdout.write("$i Saturday");
        break;
      case 7:
        stdout.write("$i Sunday");
        break;
      default:
    }

    if (i < 6) {
      print("\t \t [Weekday]");
    } else {
      print("\t \t [Weekend]");
    }
    print("**********************************");
  }
}

// NULL check safety
void Exercise4() {
  stdout.write("input numDays:");
  int? numDays = int.parse(stdin.readLineSync()!);
  stdout.write("input numMiles:");
  int? numMiles = int.parse(stdin.readLineSync()!);
  stdout.write("input dailyRates:");
  int? dailyRates = int.parse(stdin.readLineSync()!);
  num? cost;
  if (numDays != null && numMiles != null && dailyRates != null) {
    if (numMiles <= 100) {
      cost = numDays * dailyRates;
    } else {
      cost = numDays * dailyRates + (numMiles - 100) * 0.25;
      print("the Miles is more than 100");
    }
    print("total of the cost is RM${cost.toStringAsFixed(2)}");
  } else {
    print("The data is NULL!, Please insert data:");
  }
}

// Map Array List
void Exercise5() {
  List<Map<String, dynamic>> items = [
    {"name": "Buttermilk", "price": 12.00, "quantity": 3},
    {"name": "Salt", "price": 10.00, "quantity": 7},
    {"name": "Milo", "price": 11.00, "quantity": 10},
    {"name": "Hotdogs", "price": 12.99, "quantity": 23},
  ];

  for (var item in items) {
    print('Item: ${item["name"]}');
    print('Price: RM${item["price"].toStringAsFixed(2)}');
    print('Quantity: ${item["quantity"]}');
    print('-----------------------');
  }
}
