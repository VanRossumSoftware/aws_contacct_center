import boto3
import json
import os

def lambda_handler(event, context):
    # TODO implement
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(os.environ['DYNAMODB_TABLE_NAME'])
    response = table.get_item(Key={'id': '1'})
    return {
        'statusCode': 200,
        'body': json.dumps(response['Items'])
    }
