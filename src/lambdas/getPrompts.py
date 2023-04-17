import boto3
import json
import os
from boto3.dynamodb.conditions import Key

def lambda_handler(event, context):
    print(event)

    print(event["Details"]["Parameters"]["Language"])

    language = event["Details"]["Parameters"]["Language"]
    contactFlowName = event["Details"]["Parameters"]["ContactFlowName"]

    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(os.environ['DDB_TABLE_NAME'])

    response = table.query(KeyConditionExpression=Key('contactFlowName').eq(contactFlowName))
    print(response['Items'])

    returnObject = {}
    returnObject["statusCode"] = 200
    for item in response['Items']:
        if (language == "English"):
            returnObject[item["promptId"]] = item["englishPrompt"]
        else:
            returnObject[item["promptId"]] = item["spanishPrompt"]

    return returnObject
