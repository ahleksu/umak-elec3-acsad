1. Both routes call the same function. How does your code know which route a request came through?1. Both routes call the same function. How does your code know which route a request came through?
API Gateway sends the function an event for every request. The event has a
routeKey field that holds the route that matched, such as "GET /messages" or
"POST /messages". Our handler reads event["routeKey"] and uses if statements
to run the read code (Scan) for GET /messages and the store code (PutItem)
for POST /messages. Any other value returns a 404 "Route not found".

2. What answer do you get when you open the invoke URL without /messages? Why does API Gateway answer this way, and not your function?
We get {"message":"Not Found"} with status 404. Our API only has two routes,
GET /messages and POST /messages, and no route for the path "/". API Gateway
checks each request against its routes first. When nothing matches, it
answers 404 itself and never calls the Lambda function, so our code does not
run and we are not billed for a Lambda run.

3. Your GET /messages route uses Scan. What happens to the cost of each GET request as the table grows to thousands of messages? Why?
The cost of each GET request grows as the table grows. Scan reads every item
in the table on every request, so with thousands of messages each GET reads
thousands of items. DynamoDB charges for the data it reads, so each request
costs more, and it also gets slower. Scan is fine for a small table like
ours, but it does not scale.
