import 'dart:async';
import 'dart:io';
import 'dart:math';

void main() {
  // doAsyncWithoutAwait();
  // doAsyncWithAwait();
  StreamExample streamExample = StreamExample();
  streamExample.generateRandomNumber();
  streamExample.listenStream();
  streamExample.stopTheListen();
}

// Without Await keyword you can try this function
Future<void> doAsyncWithoutAwait() async {
  print("start of the async function");
  Future.delayed(Duration(seconds: 2), () => print("inside async execution"));

  print("End of Async function");
}

// This is how the function happen when u use await. the function won't run until the await is done
Future<void> doAsyncWithAwait() async {
  print("start of the async function");
  await Future.delayed(
      Duration(seconds: 2), () => print("inside async execution"));

  print("End of Async function");
}

// using try catch for error

// Stream function
class StreamExample {
  StreamController _controller = StreamController();
  late StreamSubscription _streamSubscription;

  //generate random number in 15 secs (interval: 1 secs)
  void generateRandomNumber() {
    DateTime currentTime = DateTime.now();
    DateTime endTime = currentTime.add(Duration(seconds: 15));

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (DateTime.now().isBefore(endTime)) {
        int randomNumber = Random().nextInt(10);
        print("The Random Number Generated is : $randomNumber");
        _controller.add(randomNumber);
      }
    });
  }

  void listenStream() {
    _streamSubscription = _controller.stream.listen((randomNumber) {
      print("Listen to the event currently is : $randomNumber");
    });
  }

  Future<void> stopTheListen() async {
    await Future.delayed(
        Duration(seconds: 10), () => _streamSubscription.cancel());
  }
}
