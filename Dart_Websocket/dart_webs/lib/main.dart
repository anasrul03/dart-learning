// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:io';

import 'package:dart_webs/ping.dart';

const String url =
    'wss://ws.binaryws.com/websockets/v3?app_id=31063&l=EN&brand=deriv';

WebSocket? socket;

Future<void> main() async {
  // Connect to websocket.
  try {
    socket = await WebSocket.connect(url);
    printGreen("Websocket is connected");
  } catch (e) {
    printRed("Cannot connect! why?>>: $e");
  }
  // Listen for messages.
  socket?.listen((message) {
    handleMessage(message);

    handleInput();
  });

  handleInput();
}

void handleMessage(String message) {
  handlePing(message);
  // print(message);
}

void handleInput() {
  printYellow("Enter the command");
  String? command = stdin.readLineSync();

  switch (command) {
    case "ping":
      sendPing();
      break;
    case "symbols":
      sendSymbol();
      break;
    default:
      printRed("Unknown Command");
      handleInput();
  }
}

void sendPing() {
  final PingRequest request = PingRequest(ping: 1);
  printYellow("sendPing is running");

  socket!.add(request.toJson());

  // handleInput();
}

void handlePing(String data) {
  final response = PingResponse.fromJson(data);
  printYellow("handlePing is running");
  // CheckPingResponse.fromJson("data");
  if (response.msg_type == 'ping') {
    // Handle ping response.
    printGreen(response.pingResult);
  }

  // printGreen(data.toString());
}

void sendSymbol() {}

void handleSymbol(Map<String, dynamic> data) {
  // final response = SymbolResponse.fromJson(data);
}

void printGreen(String text) {
  print('\x1B[32m$text\x1B[0m');
}

void printRed(String text) {
  print('\x1B[31m$text\x1B[0m');
}

void printYellow(String text) {
  print('\x1B[33m$text\x1B[0m');
}
