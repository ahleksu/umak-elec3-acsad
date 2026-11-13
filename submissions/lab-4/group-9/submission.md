# Lab 4 Submission

## About us

- Group number: 9
- Section: IV-ACSAD
- Group IAM user: acsad-g09
- DynamoDB table name: umak-elec3-acsad-g09-messages
- HTTP API name: umak-elec3-acsad-g09-api

## Handler code

```python
import base64
import json
import uuid
from datetime import datetime, timezone

import boto3

GROUP_NAME = "Group 9 of IV-ACSAD"
TABLE_NAME = "umak-elec3-acsad-g09-messages"  # Change acsad-g03 to your group IAM user.

table = boto3.resource("dynamodb").Table(TABLE_NAME)


def respond(status_code, body):
    return {
        "statusCode": status_code,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps(body),
    }


def read_json_body(event):
    body = event.get("body") or "{}"
    if event.get("isBase64Encoded"):
        body = base64.b64decode(body).decode("utf-8")
    return json.loads(body)


def lambda_handler(event, context):
    route = event.get("routeKey")

    if route == "GET /messages":
        items = table.scan()["Items"]
        return respond(200, items)

    if route == "POST /messages":
        try:
            data = read_json_body(event)
        except ValueError:
            data = None
        if not isinstance(data, dict) or not data.get("text"):
            return respond(400, {"error": "Send a JSON body with a text field."})
        if len(str(data["text"])) > 280:
            return respond(400, {"error": "Keep the text at 280 characters or fewer."})
        message = {
            "id": str(uuid.uuid4()),
            "author": str(data.get("author") or GROUP_NAME)[:80],
            "text": str(data["text"]),
            "createdAt": datetime.now(timezone.utc).isoformat(),
        }
        table.put_item(Item=message)
        return respond(201, message)

    return respond(404, {"error": f"No route for {route}"})
## Questions

1. Both routes call the same function. How does your code know which route a request came through?

   API Gateway sends the route name inside the event it passes to Lambda. Our handler reads it with event.get("routeKey") and checks it with if statements. If it’s GET /messages, the code scans the table and returns the items. If it’s POST /messages, it validates the body, builds the message, and saves it with put_item. Anything else falls through to the 404 response at the bottom. That’s how a single function can do both jobs.

2. What answer do you get when you open the invoke URL without /messages? Why does API Gateway answer this way, and not your function?

   We got {"message":"Not Found"}. We only created two routes, GET /messages and POST /messages, and nothing for /. So API Gateway couldn’t match the request to any route and rejected it itself. The request never reached Lambda, which is why we didn’t see our own 404 message (No route for ...) from the code.

3. Your GET /messages route uses Scan. What happens to the cost of each GET request as the table grows to thousands of messages? Why?

   Each GET gets more expensive as the table grows. Scan reads every item in the table every time, even though we only need the messages. With 3 messages that’s tiny, but with thousands, each request reads far more data. That uses more read capacity (so it costs more) and makes the response slower. Also, a single Scan call only returns up to 1 MB of data, so a very large table would need extra paging logic in our code.
