# Assignment 4 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-4/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 10
- Section: IV - ACSAD

## Estimate 1: the Lab 4 endpoint

Asia Pacific (Singapore), 1 million requests a month: 800,000 GET and 200,000 POST.

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon API Gateway | HTTP API, 1 million requests, 1 KB each | `1.25` |
| AWS Lambda | Without Free Tier, x86, 1,000,000 requests, 100 ms, 128 MB | `0.41` |
| Amazon DynamoDB | On-demand, Standard, 1 GB, 1 KB items, 0.2 million writes, 0.8 million eventually consistent reads | `0.48` |
| **Total** | | `2.14` |

## Estimate 2: the Lab 2 setup

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon EC2 | 1 `t3.micro`, Linux, On-Demand, 100% utilization, 8 GB gp3, detailed monitoring on | 12.51 |

Share link of our estimate: https://calculator.aws/#/estimate?id=64566f319b45593400e240c9cffe056981933ef5

## Question

In a month with no requests at all, which costs remain in each setup, and why?

In a month with no requests at all, the serverless setup drop to zero because API Gateway and Lambda charge exclusively for execution and request volume although DynamoDB still incur charges for Data Storage. Conversely, provisioned virtual server setups retain their full $12.51 baseline cost because compute hours, storage, and detailed monitoring are billed continuously regardless of traffic.


## Recommendation

Five sentences. Which setup fits the Lab 4 message API at 1 million requests a month, and why? Use our two totals, our answer to the question, and the work that each setup needs from our group.

We recommend the Lab 4 serverless setup for the message API because its estimated monthly cost of $2.14 is significantly cheaper than the Lab 2 EC2 setup, which costs $12.51 per month. The serverless setup is more cost-efficient at 1 million requests per month, saving the group $10.37 compared to running an EC2 instance. When there are no requests, the serverless setup has almost no usage-based charges aside from DynamoDB storage, while the EC2 setup continues to incur instance and storage costs. Additionally, using serverless services reduces the group's maintenance responsibilities because there is no continuously running server that the group needs to patch or maintain. Finally, the serverless setup is more suitable for sudden traffic spikes because it can handle request-driven workloads without requiring the group to continuously maintain an EC2 instance and manage its capacity.

<answer>

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| silicon-dioxide  | main navigator of the calculation process |
| Kwin-Talattad | helped to answer the question |
| santiagojohncarlop-blip | navigator and answered the question and recommendations |
| jmiranda12345681 | gave answers for recommendations |
