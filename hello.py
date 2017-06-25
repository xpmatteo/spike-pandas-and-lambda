
def hello_handler(event, context):
    print(event)
    print("Hello,,, hello!!")
    return {
        'message': 'the medium is the message'
    }
