import 'dart:async';

import 'package:functions_framework/functions_framework.dart';
import 'package:gcp_functions_framework_firestore/src/firebase.dart';
import 'package:gcp_functions_framework_firestore/src/function_types.dart';

@CloudFunction()
FutureOr<void> oncreatetodo(CloudEvent event, RequestContext context) async {
  // Check if document path is available
  final path = event.subject?.replaceFirst('documents/', '');
  if (path == null) {
    context.logger.error('Document path is null');
    return;
  }

  // Update document title
  final documentEventData =
      DocumentEventData.fromBuffer(event.data as List<int>);
  final document = documentEventData.value;
  final title = document.fields['title']?.stringValue;
  await firestore.doc(path).update({'title': '$title from server!'});
}
