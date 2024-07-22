import 'package:fooddelivery/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders = {
      'Content-type': 'application/json; charset = UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  /// Sends a GET request to the specified [uri] and returns the response.
  ///
  /// The [uri] parameter represents the endpoint to send the request to. It should
  /// not include the base URL, as it is automatically appended.
  ///
  /// Returns a [Future] that completes with a [Response] object containing the
  /// response from the server. If an error occurs during the request, a response
  /// with a status code of 1 and the error message as the status text is returned.
  ///
  /// Throws an [Exception] if an error occurs during the request.
  Future<Response> getData(String uri,) async {
    try {
      //esse get só quer o end point, não a uri inteira ja que estamos passando a baseurl já
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
