import 'package:aws_dynamodb_api/dynamodb-2011-12-05.dart';
import 'package:aws_lambda/extensions.dart';
import 'package:aws_lambda_dart_runtime_ns/aws_lambda_dart_runtime_ns.dart';

FunctionHandler get handleTodoCreation {
  return FunctionHandler(
    name: 'on-create-todo',
    action: (context, event) async {
      final dynamoDb = context.dynamoDb;

      try {
        final records = event['Records'] as List<dynamic>;

        await Future.forEach<dynamic>(records, (record) async {
          if (record['eventName'] == 'INSERT') {
            final newImage = record['dynamodb']['NewImage'];
            final todoId = newImage['id']['S'];
            final currentName = newImage['name']['S'];

            final modifiedName = 'Modified: $currentName';

            await dynamoDb.updateItem(
              tableName: 'todos',
              attributeUpdates: {
                'name': AttributeValueUpdate(
                  action: AttributeAction.put,
                  value: AttributeValue(s: modifiedName),
                ),
              },
              key: Key(hashKeyElement: AttributeValue(s: todoId)),
            );
          }
        });
      } catch (e) {
        print('Error processing DynamoDB stream event: $e');
      }
      return InvocationResult(requestId: context.requestId);
    },
  );
}
