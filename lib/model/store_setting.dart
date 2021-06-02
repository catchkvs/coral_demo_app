class StoreSettings {
  String ApiToken;

  StoreSettings(this.ApiToken);

  StoreSettings.fromJson(Map<String, dynamic> json)
      : ApiToken = json['ApiToken'];

  Map<String, dynamic> toJson() =>
      {
        'ApiToken': ApiToken,
      };
}