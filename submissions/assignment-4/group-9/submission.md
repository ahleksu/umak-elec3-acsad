# Assignment 4 Submission

## About us

- Group number: 9
- Section: IV-ACSAD

## Estimate 1: the Lab 4 endpoint

Asia Pacific (Singapore), 1 million requests a month: 800,000 GET and 200,000 POST.

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon API Gateway | HTTP API, 1 million requests, 1 KB each | 1.25 |
| AWS Lambda | Without Free Tier, x86, 1,000,000 requests, 100 ms, 128 MB | 0.41 |
| Amazon DynamoDB | On-demand, Standard, 1 GB, 1 KB items, 0.2 million writes, 0.8 million eventually consistent reads | 0.48 |
| **Total** | | **2.14** |

## Estimate 2: the Lab 2 setup

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon EC2 | 1 `t3.micro`, Linux, On-Demand, 100% utilization, 8 GB gp3, detailed monitoring on | 11.74 |

Share link of our estimate: https://calculator.aws/#/estimate?id=87d541aee2d56e76e132bdbcb1a883fa9bc3630d

## Question

In a month with no requests at all, which costs remain in each setup, and why?

In the Lab 4 setup, API Gateway and Lambda request-related charges become zero because there are no requests. However, DynamoDB storage charges remain because the stored messages still occupy space in the table. In the Lab 2 setup, the costs remain almost the same because the t3.micro instance runs all month, even without visitors. We still pay for the instance hours, the 8 GB gp3 volume, and detailed monitoring, which account for the monthly cost of 11.74 USD.

## Recommendation

The Lab 4 serverless setup fits the message API better at 1 million requests a month. It costs 2.14 USD per month, while the Lab 2 EC2 setup costs 11.74 USD, making EC2 more than five times as expensive. EC2 continues charging even when there are no requests, while the serverless setup mainly charges based on actual usage, aside from DynamoDB storage. EC2 also requires more work from our group, such as patching the server and managing Auto Scaling during sudden traffic spikes. With API Gateway, Lambda, and DynamoDB, AWS manages the underlying infrastructure, allowing us to focus more on our application code.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| Azores-Mea | Created the estimates for the Lab 4 endpoint services: Amazon API Gateway, AWS Lambda, and Amazon DynamoDB. |
| WayneyYsrrael | Created the estimate for the Lab 2 setup using Amazon EC2. |
| rdanlogA12345581 | Wrote the recommendation and answered the question. |
| klomol-jo | Finalized the work and prepared the files for submission. |
