import boto3
import json
import os
import uuid

def lambda_handler(event, context):
    print(event)

    acctNum = event["Details"]["Parameters"]["AccountNumber"]
    amount = event["Details"]["Parameters"]["Amount"]
    date = event["Details"]["Parameters"]["Date"]

    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(os.environ['DDB_TABLE_NAME'])

    #Generate random payment ID
    paymentID = uuid.uuid1()

    #Write payment to DDB
    item = {
        'paymentID': {'S': paymentID},
        'accountNumber': {'S': acctNum},
        'paymentDate': {'S': date},
        'paymentAmount': {'N': amount}
    }

    response = table.put_item(Item=item)

    return {
        "statusCode" : 200
    }
