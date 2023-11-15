import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:shelf_router/shelf_router.dart';

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/up', _getUpHandler)
  ..get('/getAllergiesList', _getListHandler)
  ..get('/canCauseAllergy', _getJsonHandler);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Response _getUpHandler(Request request) {
  return Response.ok('I am up');
}

Response _getListHandler(Request request) {
  final List<String> commonAllergies = [
    'Peanuts',
    'Tree Nuts',
    'Milk',
    'Eggs',
    'Wheat',
    'Soy',
    'Fish',
    'Shellfish'
  ];
  return Response.ok(jsonEncode(commonAllergies),
      headers: {'Content-Type': 'application/json'});
}

Response _getJsonHandler(Request request) {
  final bool causesAllergy = Random().nextBool();
  final String allergyName = _getRandomAllergy();

  final Map<String, dynamic> jsonData = {
    'causesAllergy': causesAllergy,
    'allergyName': allergyName,
  };
  return Response.ok(jsonEncode(jsonData),
      headers: {'Content-Type': 'application/json'});
}

String _getRandomAllergy() {
  final List<String> commonAllergies = [
    'Peanuts',
    'Tree Nuts',
    'Milk',
    'Eggs',
    'Wheat',
    'Soy',
    'Fish',
    'Shellfish'
  ];
  final int randomIndex = Random().nextInt(commonAllergies.length);
  return commonAllergies[randomIndex];
}

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsHeaders())
      .addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
