import json
from confluent_kafka import Producer

def lambda_handler(event, context):
    print(event)
    response = {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json"
         },
        "body": json.dumps(event)
    }
    return response