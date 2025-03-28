
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/domain/models/yes_no_response.dart';

class YesNoMapper {

  /// Mapear respuesta de [YesNoRepsonse] a [Message]
  static Message yesNoResponseToEntity(YesNoRepsonse model) => Message(
    text: model.answer ?? "no", 
    fromWho: FromWho.hers,
    imageUrl: model.image
  );
}