//Write a fibonacci sequence
// output: 0, 1, 1, 2, 3, 4, 5, 8, 13, 21, 34...

import 'dart:async';
import 'dart:io';

void main() {
  StreamSequence streamSequence = StreamSequence();
  // stdout.write("0,1,");
  streamSequence.generateFibonacci();
  streamSequence.printFibonacci();
}

class StreamSequence {
  StreamController _streamController = StreamController();
  late StreamSubscription _streamSubscription;

  void generateFibonacci() {
    DateTime currentTime = DateTime.now();
    DateTime endTime = currentTime.add(Duration(seconds: 10));

    int n1 = 0, n2 = 1, n3;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (DateTime.now().isBefore(endTime)) {
        n3 = n1 + n2;
        // stdout.write("$n3,");
        if (n1 == 0) {
          _streamController.add(0);
        } else if (n1 == 1) {
          _streamController.add(1);
        } else if (n2 == 3) {
          // print(n2);
          _streamController.add(2);
        } else {
          _streamController.add(n3 - n2);
        }
        n1 = n2;
        n2 = n3;
      } else {
        print("jobs done");
        exit(99);
      }
    });
  }

  void printFibonacci() {
    _streamSubscription = _streamController.stream.listen((n3) {
      stdout.write("$n3,");
    });
  }
}
