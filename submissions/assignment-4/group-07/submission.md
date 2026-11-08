# Assignment 4 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-4/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 07
- Section: IV - ACSAD

## Estimate 1: the Lab 4 endpoint

Asia Pacific (Singapore), 1 million requests a month: 800,000 GET and 200,000 POST.

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon API Gateway | HTTP API, 1 million requests, 1 KB each | 1.25 |
| AWS Lambda | Without Free Tier, x86, 1,000,000 requests, 100 ms, 128 MB | 0.41 |
| Amazon DynamoDB | On-demand, Standard, 1 GB, 1 KB items, 0.2 million writes, 0.8 million eventually consistent reads | 0.48 |
| **Total** | | 2.14|

## Estimate 2: the Lab 2 setup

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon EC2 | 1 `t3.micro`, Linux, On-Demand, 100% utilization, 8 GB gp3, detailed monitoring on | 12.51 |

Share link of our estimate: [LINK](https://drive.google.com/file/d/1BtJKJpm65K8qCdiauZ2Eq5GO36-15knD/view?usp=sharing)

## Question

In a month with no requests at all, which costs remain in each setup, and why?

In the Lab 4 setup, almost nothing remains. API Gateway charges only per request and Lambda charges only per invocation and run time, so both cost 0.00 USD with no requests. DynamoDB on-demand also charges reads and writes per request, so only the storage of the table remains, about 0.29 USD for 1 GB, and far less than one cent for our few messages. In the Lab 2 setup, almost the whole 12.51 USD remains. EC2 bills the t3.micro instance for every hour it runs (about 9.64 USD), the 8 GB gp3 volume for every GB-month it exists (about 0.77 USD), and detailed monitoring as a monthly CloudWatch charge (about 2.10 USD), whether or not anyone sends a request.

## Recommendation

Five sentences. Which setup fits the Lab 4 message API at 1 million requests a month, and why? Use our two totals, our answer to the question, and the work that each setup needs from our group.

The serverless Lab 4 setup fits the message API better at 1 million requests a month. It costs about 2.14 USD a month, while the EC2 setup costs about 12.51 USD, almost six times as much. Because the serverless services charge per request, the cost drops to nearly zero in a quiet month, while the EC2 instance, its volume, and its monitoring keep billing every hour. The serverless setup also needs less work from our group, since AWS runs and scales API Gateway, Lambda, and DynamoDB, while with EC2 we would have to patch the operating system, install and run the web server, and watch the instance. We would choose EC2 only if the API grew to a steady, very high load where an always-on server becomes cheaper per request, which 1 million requests a month is far from.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| Sdjada | created the AWS calculator |
| N0micon18 | created the document |
| yoonice0393 | submitted the document on Github |
| JCKS003 | helped with the document |
