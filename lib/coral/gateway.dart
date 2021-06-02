import 'dart:convert';
import 'dart:io';

import 'package:coral_demo_app/config/constants.dart';
import 'package:coral_demo_app/coral/message.dart';



class CoralGatewayClient {
  WebSocket _webSocket;
  bool _isConnected;
  String sessionId;
  String authToken;
  CoralGatewayClient._privateConstructor();

  static final CoralGatewayClient _instance = CoralGatewayClient._privateConstructor();

  static CoralGatewayClient getInstance() {
    return _instance;
  }


  bool isConnected() {
    if(this._webSocket != null) {
      return this._isConnected;
    }
    return false;
  }

  void connect() {
    print("Connecting a new connection: ");
    Future<WebSocket> future = WebSocket.connect(GATEWAY_URL);
    future.then(setWebsocket);
  }

  void setWebsocket(WebSocket value) {
    print("Socket connected:::");
    this._webSocket = value;
    this._webSocket.listen(receiveData);
  }

  void receiveData(dynamic data) {
    this._isConnected = true;
    print("Data: " + data.toString());
    var serverMsg = ServerMsg.fromJson(jsonDecode(data));
    print("Session ID: " + serverMsg.SessionId);
    this.sessionId = serverMsg.SessionId;
    switch(serverMsg.Command) {
      case "ReceiveSessionId" : {
        ClientMsg msg = new ClientMsg(Command: "StartOrderStream", Data: "",  AuthToken: this.authToken, SessionId:this.sessionId);
        sendMessage(jsonEncode(msg.toJson()));

      } break;

    }
  }


  void sendMessage(dynamic data) {
    print("Sending data: " + data.toString());
    _webSocket.add(data);
  }
}