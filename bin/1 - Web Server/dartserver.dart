/// Use `HttpServer.bind()` method to bind to a port and the HttpServer
/// `listen()` method to listen for connections.  Respond to an `HttpRequest`
/// using the `response` property.
///
import 'dart:io';

void main() {
  HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080).then((server) {
    print(server);
    server.listen((HttpRequest request) {
      print("Request received ${request.uri}\n${request.headers}");
      request.response.write('Hello, world');
      request.response.close();
    });
  });
}