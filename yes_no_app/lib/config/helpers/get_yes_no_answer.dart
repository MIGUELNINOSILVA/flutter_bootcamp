import 'package:yes_no_app/config/infrastructure/models/yes_no_model.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {
  final dio = Dio();
  Future<Message> getAnswer() async {
  
    final response = await dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromJsonMap(response.data);
  
    return yesNoModel.toMessageEntity();
  }
}
