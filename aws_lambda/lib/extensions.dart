import 'package:aws_dynamodb_api/dynamodb-2011-12-05.dart';
import 'package:aws_lambda_dart_runtime_ns/aws_lambda_dart_runtime_ns.dart';

extension ContextExtensions on RuntimeContext {
  DynamoDB get dynamoDb => DynamoDB(
        region: region,
        credentials: AwsClientCredentials(
          accessKey: accessKey,
          secretKey: secretAccessKey,
          sessionToken: sessionToken,
        ),
      );
}
