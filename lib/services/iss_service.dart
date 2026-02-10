import 'dart:convert';
import 'package:http/http.dart' as http;

class IssService {
  static const _url = 'http://api.open-notify.org/iss-now.json';

  static Future<({double lat, double lon})> fetchPosition() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch ISS position');
    }

    final data = jsonDecode(response.body);
    final position = data['iss_position'];

    return (
      lat: double.parse(position['latitude']),
      lon: double.parse(position['longitude']),
    );
  }
}
