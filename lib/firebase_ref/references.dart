import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:takequiz/models/question_paper_model.dart';

final fireStore = FirebaseFirestore.instance;

Reference get firebaseStorage => FirebaseStorage.instance.ref();

final QuestionPaperRF = fireStore.collection('questionPapers');

DocumentReference questionRF(
        {required String paperID, required String questionId}) =>
    QuestionPaperRF.doc(paperID).collection("questions").doc(questionId);
