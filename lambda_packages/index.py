import json
import os
import requests

def handler(event, context):
    webhook_url = os.environ.get("SLACK_WEBHOOK_URL")

    # Default message
    message_text = "🚀 Lambda executed successfully!"

    # If triggered by S3 event, include S3 details
    if 'Records' in event:
        for record in event['Records']:
            if 's3' in record:
                s3_bucket = record['s3']['bucket']['name']
                s3_key = record['s3']['object']['key']
                message_text = f":warning: New object created in S3 bucket *{s3_bucket}* with key: `{s3_key}`"

    message = {
        "text": message_text
    }

    try:
        response = requests.post(
            webhook_url,
            data=json.dumps(message),
            headers={'Content-Type': 'application/json'}
        )
        return {
            'statusCode': response.status_code,
            'body': response.text
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': f"Failed to send message to Slack: {e}"
        }
