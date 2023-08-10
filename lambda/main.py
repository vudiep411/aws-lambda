import json

def lambda_handler(event, context):
    print(event)
    message = 'Hello from Lambda!'
    response = {
        "statuscode": 200,
        "headers" : {
            'Content-Type': 'application/json'
        },
        "body": json.dumps(message)
    }
    return response