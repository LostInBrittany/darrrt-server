/// Use the http Pub package, and create a VirtualDirectory to serve the
/// request. Register an error handler using the `errorHandler` property.
///
import 'dart:async';
import 'dart:io';

import 'package:http_server/http_server.dart' as http_server;

void main() {
  var directoryToList = Platform.script.resolve('./web').toFilePath();

  var virtualDirectory = new http_server.VirtualDirectory(directoryToList)
    ..allowDirectoryListing = true
    ..errorPageHandler = errorPageHandler;

  HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080).then((server) {
    print(server);
    server.listen((request) {
      virtualDirectory.serveRequest(request);
    });
  });
}

void errorPageHandler(HttpRequest request) {
  request.response
      ..statusCode = HttpStatus.NOT_FOUND
      ..write("These aren't the pages you're looking for")
      ..close();
}