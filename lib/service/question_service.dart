import 'package:flutter_demo/model/request/create_question_model.dart';
import 'package:flutter_demo/model/response/question_model.dart';
import 'package:flutter_demo/service/base_service.dart';

abstract class QuestionService extends BaseService {


 Future<List<QuestionModel>> getAllQuestion();
 Future<QuestionModel> getOneQuestion(String id);
  createNewQuestion(CreateQuestionModel newQestion);
  updateOldQuestion(String id,CreateQuestionModel newQestion);
  deleteQuestion(String id);
}


