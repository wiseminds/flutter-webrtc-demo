import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:protoo_client/protoo_client.dart';

class AppWebSocket {
  final String url;
  Peer? _socket;
  Function()? onOpen;
  Function(dynamic msg)? onMessage;
  Function(int? code, String? reaso)? onClose;
  AppWebSocket(this.url);

  connect() async {
    if (kDebugMode) {
      print('connect socket');
    }
    try {
      _socket = Peer(Transport(url, options: ['proto']));

      _socket?.on('open', () {
        if (kDebugMode) {
          print('open: ');
        }
        onOpen?.call();
        // After socket open to send a request.
        // _socket?.request('join', {
        //   'roomId': 'jhdsfgjfdafg',
        //   'peerId': 'wizzy',
        //   'other': {}
        // }).then((data) {
        //   // Handle accept from server.
        //   print('response: ' + data.toString());
        // }).catchError((error) {
        //   // Handle reject from server.
        //   print('response error: ' + error.toString());
        // });
      });

      _socket?.on('close', (val) {
        if (kDebugMode) {
          print('close, $val');
        }
        onClose?.call(1, '');
      });

      _socket?.on('error', (error) {
        if (kDebugMode) {
          print('error  $error');
        }
      });

      // Handle request from server.
      _socket?.on('request', (request, accept, reject) {
        if (kDebugMode) {
          print('request: $request');
        }
        // reject(486, 'Busy Here!!!');
        // onMessage?.call(data);
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      onClose?.call(500, e.toString());
    }
  }

  send(data) async {
    if (_socket != null) {
      // print('send: $data');
      _socket?.emit(data);
    }
  }

  Future<dynamic> request(event, data) async {
    if (_socket != null) {
      return await _socket?.request(event, data);
    }
  }

  close() {
    _socket?.close();
  }
}
