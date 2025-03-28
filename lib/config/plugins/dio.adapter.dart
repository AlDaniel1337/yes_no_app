//^ Implementacion del paquete [Dio]
//========================[ ADAPTER ]========================
//*     ADAPTACION DEL PAQUETE [Dio]
//?     Manejar peticiones HTTP
//LINK: https://pub.dev/packages/dio
//==========================================================

import 'package:dio/dio.dart';

class HttpAdapter{

  final Dio dio;
  final String baseUrl;
  final Map<String, dynamic>? queryParameters;

  HttpAdapter({
    required this.baseUrl,
    this.queryParameters, 
  }): dio = Dio( 
    BaseOptions(
      baseUrl: baseUrl,
      queryParameters: queryParameters
    ) 
  );

  /// Peticion Get
  Future<Response> get({required String path, Map<String, dynamic>? queryParameters}) async {
    try {
      Response res = await dio.get(path, queryParameters: queryParameters );
      return res;
    } catch (e) {
      throw ("ERROR: $e");
    }
  }
  

}

/* ----- Ejemplo de uso -----
  final HttpAdapter _httpAdapter = HttpAdapter(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': EnvVariablesManager.getEnvVariable(value: EnvKeys.movieDbKey),
      'language': 'es-MX',
    }
  );
*/