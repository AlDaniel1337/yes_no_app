import 'package:yes_no_app/config/plugins/dio.adapter.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/models/yes_no_model_entity.mapper.dart';
import 'package:yes_no_app/domain/models/yes_no_response.dart';

class GetYesNoAnswer{

  final HttpAdapter _http = HttpAdapter(
    baseUrl: "https://yesno.wtf/"
  );
   
  /// Obtener respuesta de 
  Future<Message> getAnswer() async {
    final Response response = await _http.get(path: "api");
    final details = YesNoRepsonse.fromMap( response.data );
    final message = YesNoMapper.yesNoResponseToEntity(details);
    return message;
  }
}