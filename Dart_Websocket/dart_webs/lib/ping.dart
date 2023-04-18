// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class PingRequest {
  final int ping;

  PingRequest({required this.ping});

  String toJson() {
    final Map<String, dynamic> dict = {'ping': ping};

    return jsonEncode(dict);
  }
}

class PingResponse {
  final String msg_type;
  final String pingResult;
  PingResponse({required this.msg_type, required this.pingResult});

  static PingResponse fromJson(String serverRes) {
    final Map<String, dynamic> decodedRes = jsonDecode(serverRes);

    return PingResponse(
        msg_type: decodedRes['msg_type'], pingResult: decodedRes['ping']);
  }
}
