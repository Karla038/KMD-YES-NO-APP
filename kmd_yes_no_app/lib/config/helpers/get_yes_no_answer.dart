import 'package:dio/dio.dart';
import 'package:kmd_yes_no_app/domain/entities/message.dart';
import 'package:kmd_yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final Dio _dio = Dio();

  Future<Message> getAnswer() async{
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonToMap(response.data);

    return yesNoModel.toMessageEntity();

  }
}