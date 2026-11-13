# Assignment 4 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-4/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 2
- Section: 4-ACSAD

## Estimate 1: the Lab 4 endpoint

Asia Pacific (Singapore), 1 million requests a month: 800,000 GET and 200,000 POST.

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon API Gateway | HTTP API, 1 million requests, 1 KB each | 1.25 USD |
| AWS Lambda | Without Free Tier, x86, 1,000,000 requests, 100 ms, 128 MB | 0.41 USD |
| Amazon DynamoDB | On-demand, Standard, 1 GB, 1 KB items, 0.2 million writes, 0.8 million eventually consistent reads | 	0.48 USD |
| **Total** | | 2.14 USD |

## Estimate 2: the Lab 2 setup

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon EC2 | 1 `t3.micro`, Linux, On-Demand, 100% utilization, 8 GB gp3, detailed monitoring on | 12.51 USD |

Share link of our estimate: https://calculator.aws/#/estimate?id=e6063221603d9c6311fce4c610d0344664896a77

## Question

In a month with no requests at all, which costs remain in each setup, and why?

In Estimate 1 (Lab 4 endpoint setup), a month with no requests would generally incur no request-related charges because API Gateway and AWS Lambda charge based on usage. However, Amazon DynamoDB may still incur storage charges only if there is data stored in the database.

On the other hand, Estimate 2 (Lab 2 setup) will continue to incur hourly charges as long as the EC2 instance is running, even if there are no requests or users accessing the application. This is because EC2 charges for the instance's running time rather than the number of requests it receives.

## Recommendation

Five sentences. Which setup fits the Lab 4 message API at 1 million requests a month, and why? Use our two totals, our answer to the question, and the work that each setup needs from our group.

We as a group believe that Estimate 1 (Lab 4 setup) is the best choice. Not only does it have the cheapest monthly cost of only $2.14 compared to $12.51, but it is also more cost-effective overall because API Gateway and Lambda charge primarily based on usage, while DynamoDB mainly adds storage and request-related costs. Even during months with no requests, Estimate 1 can still incur DynamoDB storage charges, whereas Estimate 2 continues accumulating EC2 instance costs as long as the instance remains running.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| shinu-syr | navigated the process, in aws calculator and vscode |
| carlcawas | directed the process and contributed in answering the question |
| eyakmwamwa | supported carl with directing the process and contributed in answering the question |
| mik4rin | supported carl with directing the process and contributed in answering the question |