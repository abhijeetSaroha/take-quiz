import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:takequiz/models/question_paper_model.dart';

final fireStore = FirebaseFirestore.instance;

final QuestionPaperRF = fireStore.collection('questionPapers');

DocumentReference questionRF(
        {required String paperID, required String questionId}) =>
    QuestionPaperRF.doc(paperID).collection("questions").doc(questionId);
