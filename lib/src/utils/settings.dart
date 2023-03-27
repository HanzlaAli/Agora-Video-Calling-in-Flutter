import 'dart:convert';
import 'package:http/http.dart' as http;

/// Define App ID and Token
const appId = 'f207f8dcb3974dc58a2813f3571fd5ba';
String baseUrl =
    'https://console.agora.io/project/JNst06QrI'; //Add the link to your deployed server here
int uid = 0;
String? token;

Future<void> getToken(String channelName) async {
  final response = await http.get(
    Uri.parse('$baseUrl/rtc/$channelName/publisher/uid/$uid'
        // To add expiry time uncomment the below given line with the time in seconds
        // + '?expiry=45'
        ),
  );

  if (response.statusCode == 200) {
    token = response.body;
    token = jsonDecode(token!)['rtcToken'];
  } else {
    print('Failed to fetch the token');
  }
}

