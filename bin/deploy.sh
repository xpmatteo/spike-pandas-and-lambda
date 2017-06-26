# see https://alestic.com/2014/11/aws-lambda-cli/

function get_execution_role_arn() {
  aws iam get-role --role-name $lambda_execution_role_name --output text   --query 'Role.Arn' 2> /dev/null
}

function create_execution_role() {
  aws iam create-role \
    --role-name "$lambda_execution_role_name" \
    --assume-role-policy-document '{
        "Version": "2012-10-17",
        "Statement": [
          {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
              "Service": "lambda.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
          }
        ]
      }' \
    --output text \
    --query 'Role.Arn'
}

function function_exists() {
  aws lambda get-function --function-name "$function" > /dev/null 2> /dev/null
}

function create_function() {
  aws lambda create-function \
    --function-name "$function" \
    --zip-file "fileb://$function.zip" \
    --role "$lambda_execution_role_arn" \
    --handler "hello.main.hello_handler" \
    --timeout 30 \
    --runtime python3.6 \
    --publish
}

function update_function() {
  aws lambda update-function-code \
    --function-name "$function" \
    --zip-file "fileb://$function.zip" \
    --publish
}

function=DemoPandas
lambda_execution_role_name=lambda-$function-execution
lambda_execution_access_policy_name=lambda-$function-execution-access
lambda_invocation_role_name=lambda-$function-invocation
lambda_invocation_access_policy_name=lambda-$function-invocation-access
log_group_name=/aws/lambda/$function

lambda_execution_role_arn=`get_execution_role_arn` || lambda_execution_role_arn=`create_execution_role`
echo lambda_execution_role_arn=$lambda_execution_role_arn

echo "put policy"
aws iam put-role-policy \
  --role-name "$lambda_execution_role_name" \
  --policy-name "$lambda_execution_access_policy_name" \
  --policy-document '{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "logs:*"
        ],
        "Resource": "arn:aws:logs:*:*:*"
      }
    ]
  }'

echo "check if function exists"
if ! function_exists; then
  echo "$function does not exist; creating it"
  create_function
else
  echo "$function exists; updating it"
  update_function
fi

echo "checking"
aws lambda invoke --function-name $function --invocation-type DryRun /dev/stdout
