# AWS Dart Lambda Example

This is an example of how to create a Dart AWS Lambda function using the [AWS Lambda Dart Runtime]() that reacts to DynamoDB trigger.

## Prerequisites
- Create a DynamoDB table `todos` with the following schema:
  - `id` (String) - Primary key
- Add stream to the table and set it to `NEW_AND_OLD_IMAGE`.

## Deploying the function
Deployment checklist:

- [ ] Create a .zip file by running `build.sh` script.
- [ ] Create a new Lambda function using the AWS Console.
- [ ] Upload the .zip file to the Lambda function.
- [ ] Set the handler to `on-create-todo`.
- [ ] Add the necessary permissions to the function.
- [ ] Add a trigger to the Lambda function using the DynamoDB table.

## Testing

Test the function by adding a new item to the DynamoDB table.
