import 'package:aws_lambda/functions.dart' as fn;
import 'package:aws_lambda_dart_runtime_ns/aws_lambda_dart_runtime_ns.dart';

Future<void> main(List<String> args) async {
  await invokeAwsLambdaRuntime([
    fn.sayHelloWorld,
  ]);
}
