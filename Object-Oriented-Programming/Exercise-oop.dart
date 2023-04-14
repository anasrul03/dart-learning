import 'dart:io';

class BankAccount {
  String _accNum;
  double _balance;

  BankAccount(this._accNum, this._balance);

  void deposit(num amount) {
    amount += _balance;
  }

  void withDraw(num amount) {
    amount -= _balance;
  }

  double getBalance() {
    return _balance;
  }

  String toString() {
    return "Account #${_accNum}, Balance: ${_balance}";
  }
}

class SavingsAccount extends BankAccount {
  double interestRate;
  SavingsAccount(super._accNum, super._balance, this.interestRate);

  void addInterest() {
    _balance = (_balance * interestRate) + _balance;
    // double monthlyInterest = interestCost / 12;
  }
}

class CheckingAccount extends BankAccount {
  double overDraftLimit;
  CheckingAccount(super.accNum, super.balance, this.overDraftLimit);

  // @override
  void withDraw(num amount) {
    if (_balance < overDraftLimit && _balance < 0) {
      _balance = _balance - amount - 10;
    } else {
      // print("You are not allowed to With Draw");
      _balance = _balance - amount;
    }
  }
}

void main() {
  var account1 = new SavingsAccount("1234", 1000.0, 0.02);
  account1.addInterest();
  print(account1); // should print "Account #1234, Balance: 1020.0"

  var account2 = new CheckingAccount("5678", 500.0, -100.0);
  account2.withDraw(200.0);
  print(account2); // should print "Account #5678, Balance: 290.0"
  account2.withDraw(200.0);
  print(account2); // should print "Account #5678, Balance: -20.0"
  account2.withDraw(10.0);
  print(account2); // should print "Account #5678, Balance: -30.0"
  print(-2);
}
