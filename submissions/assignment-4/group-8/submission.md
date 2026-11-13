# Assignment 4 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-4/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: Group 8
- Section: IV-ACSAD

## Estimate 1: the Lab 4 endpoint

Asia Pacific (Singapore), 1 million requests a month: 800,000 GET and 200,000 POST.

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon API Gateway | HTTP API, 1 million requests, 1 KB each | 1.25 USD |
| AWS Lambda | Without Free Tier, x86, 1,000,000 requests, 100 ms, 128 MB | 0.41 USD |
| Amazon DynamoDB | On-demand, Standard, 1 GB, 1 KB items, 0.2 million writes, 0.8 million eventually consistent reads | 0.48 USD |
| **Total** |  2.14 USD |

## Estimate 2: the Lab 2 setup

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon EC2 | 1 `t3.micro`, Linux, On-Demand, 100% utilization, 8 GB gp3, detailed monitoring on | 9.64 USD |

Share link of our estimate: https://docs.google.com/document/d/1ZLWqJnrxOORyI2dGx0--5Wk_fxVZ8QUtNvvLiha2M4s/edit?usp=sharing (Screenshots)

## Question

In a month with no requests at all, which costs remain in each setup, and why?

-In a month with no requests, the serverless setup still incurs costs for DynamoDB data storage, while API Gateway and Lambda have no request-related usage charges. The EC2 setup continues to incur costs for the EC2 instance, EBS storage, and enabled detailed monitoring because the instance runs continuously throughout the month, even without visitors. This means the serverless setup is more cost-efficient during periods of inactivity, while the EC2 setup has ongoing costs regardless of traffic.


## Recommendation

Five sentences. Which setup fits the Lab 4 message API at 1 million requests a month, and why? Use our two totals, our answer to the question, and the work that each setup needs from our group.

-For the Lab 4 message API handling 1 million requests per month, I recommend the serverless setup using Amazon API Gateway, AWS Lambda, and Amazon DynamoDB, which costs $2.14 per month compared to $1.64 per month for the Lab 2 EC2 setup. Although serverless costs $0.50 more per month at the specified usage, it is more flexible because its costs mainly depend on actual usage. The serverless setup also reduces the group's responsibility for server maintenance and operating system patching. AWS Lambda and API Gateway can automatically handle sudden increases in traffic without requiring the group to manually manage server capacity. Overall, serverless is a better fit for the Lab 4 message API because it requires less maintenance and provides flexible scaling based on demand.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |-
| <silverperson> | <Helped review the assignment instructions and check the submitted work.> |
| <szapatak12153026-hash> | <Contributed to reviewing the requirements and checking the group submission.> |
| <JanRodCanlas> | <Handled most of the assignment, including the AWS cost estimates, price comparisons, written explanations, and preparation of the final submission.> |
