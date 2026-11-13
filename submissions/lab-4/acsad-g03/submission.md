
# Lab 4 Submission

<!--
How to use this template:

1. Copy this file to submissions/lab-4/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Save routes.png, post.png, get.png, and items.png in the same folder.
4. Crop the AWS console top bar out of routes.png and items.png, and cover every ARN.
5. Cover your API ID, the part between https:// and .execute-api, in routes.png, post.png, and get.png. Your invoke URL goes only in the Google Form, never in this repository.
6. Do not write full names or student numbers in this file.
-->

## About us

- Group number: 3
- Section: ACSAD
- Group IAM user: acsad-g03
- DynamoDB table name: umak-elec3-acsad-g03-messages
- HTTP API name: umak-elec3-acsad-g03-api

## Handler code

<img width="1568" height="760" alt="image" src="https://github.com/user-attachments/assets/76f9277e-ad8b-4bb0-a5f4-e50d26da5376" />
<img width="1583" height="779" alt="image" src="https://github.com/user-attachments/assets/1c081036-e1d6-4920-87de-755ed795e22e" />


## Screenshots

### routes.png
<img width="1920" height="1040" alt="routes" src="https://github.com/user-attachments/assets/6fb18efc-03ca-4ef5-aa1b-d3dec4e000c4" />

### post.png
<img width="1154" height="71" alt="post" src="https://github.com/user-attachments/assets/c2e42ad7-2015-4041-be7f-839901f59c53" />

### get.png
<img width="1920" height="124" alt="get" src="https://github.com/user-attachments/assets/82811203-5af5-4429-926d-c19670ce9a45" />

### items.png
<img width="1911" height="815" alt="items" src="https://github.com/user-attachments/assets/26277f75-fb21-49ca-a491-c5ef69831738" />

## Questions

1. Both routes call the same function. How does your code know which route a request came through?
- The Lambda handler reads event["routeKey"] to tell whether the request matched GET /messages or POST /messages.
2. What answer do you get when you open the invoke URL without `/messages`? Why does API Gateway answer this way, and not your function?
- Opening the base URL returns 404 with {"message":"Not Found"}. API Gateway has no route for GET /, so it returns the error without calling Lambda.
3. Your `GET /messages` route uses Scan. What happens to the cost of each GET request as the table grows to thousands of messages? Why?
- Each GET costs more in DynamoDB reads as the scan reads more data, up to the 1 MB limit per scan. Reading all messages beyond that limit would require more scans and cost more.
