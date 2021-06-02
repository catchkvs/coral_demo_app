class ServerMsg {
  String Command;
  String Data;
  String SessionId;

  ServerMsg({
    this.Command,
    this.Data,
    this.SessionId
  });

  ServerMsg.fromJson(Map<String, dynamic> json)
      : Command = json['Command'],
        Data = json['Data'],
        SessionId = json['SessionId'];

  Map<String, dynamic> toJson() =>
      {
        'Command': Command,
        'Data' : Data,
        'SessionId': SessionId
      };
}

class ClientMsg {
  String Command;
  String SessionId;
  String AuthToken;
  String Data;

  ClientMsg({
    this.Command,
    this.Data,
    this.AuthToken,
    this.SessionId
  });

  ClientMsg.fromJson(Map<String, dynamic> json)
      : Command = json['Command'],
        Data = json['Data'],
        AuthToken = json['AuthToken'],
        SessionId = json['SessionId'];

  Map<String, dynamic> toJson() =>
      {
        'Command': Command,
        'Data' : Data,
        'AuthToken': AuthToken,
        'SessionId': SessionId
      };
}
