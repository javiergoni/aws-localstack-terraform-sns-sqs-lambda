import json
def my_handler(event, context):
    sns = json.loads(json.loads(event['Records'][0]['body'])['Message'])
    message = 'Hello {} {}!'.format(sns['first_name'], sns['last_name'])
    print(message)
    return {
        'message': message
    }
