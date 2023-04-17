import boto3
import json
import os
from boto3.dynamodb.conditions import Attr

def lambda_handler(event, context):
    print(event)

    accountNumber = event["Details"]["Parameters"]["AccountNumber"]

    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(os.environ['DDB_TABLE_NAME'])

    response = table.scan(FilterExpression=Attr('accountNumber').eq(accountNumber))
    print(response['Items'])

    returnObject = {}
    returnObject["statusCode"] = 200
    for item in response['Items']:
        #TODO: Compare dates to only return the most recent payment
        returnObject["isFound"] = "true"
        returnObject["paymentAmount"] = item["paymentAmount"]
        returnObject["paymentDate"] = item["paymentDate"]

    return returnObject
