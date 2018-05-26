# Requirements:
# jq awscli
#
# You must set ROLE_ARN and MFA_ARN on your local.rc file
# export ROLE_ARN=???
# export MFA_ARN=???

function aws_assume_role(){
  echo "Assuming Role:" $ROLE_ARN
  if [ -z ${MFA_ARN+x} ]; then
    session_data=$(aws sts assume-role --role-arn $ROLE_ARN --role-session-name "Assumed Role")
  else
    echo "Please, insert your MFA Token Code:"
    read MFA_TOKEN
    session_data=$(aws sts assume-role --role-arn $ROLE_ARN --token-code $MFA_TOKEN --serial-number $MFA_ARN --role-session-name "AssumedRole")
  fi

  if [ ! -z ${session_data+x} ]; then
    echo "Role Assumed, Injecting Credentials Environment Variables"
    export AWS_ACCESS_KEY_ID=`echo $session_data | jq  -r '.Credentials.AccessKeyId'`
    export AWS_SECRET_ACCESS_KEY=`echo $session_data | jq  -r '.Credentials.SecretAccessKey'`
    export AWS_SESSION_TOKEN=`echo $session_data | jq  -r '.Credentials.SessionToken'`
  fi
}

function aws_assume_role_unset() {
  unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
}
