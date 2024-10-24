import 'package:dart_firebase_admin/dart_firebase_admin.dart';
import 'package:dart_firebase_admin/firestore.dart';
import 'package:gcp_functions_framework_firestore/src/environment.dart';

final _adminApp = FirebaseAdminApp.initializeApp(
  Env.projectId,
  Credential.fromApplicationDefaultCredentials(),
);

Firestore get firestore => Firestore(_adminApp);
