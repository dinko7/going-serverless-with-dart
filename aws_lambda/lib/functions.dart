import 'package:aws_lambda_dart_runtime_ns/aws_lambda_dart_runtime_ns.dart';

FunctionHandler get sayHelloWorld {
  return FunctionHandler(
    name: 'hello-world',
    action: (context, event) {
      return InvocationResult(
        requestId: context.requestId,
        body: {
          'message': 'Hello, World!',
        },
      );
    },
  );
}
