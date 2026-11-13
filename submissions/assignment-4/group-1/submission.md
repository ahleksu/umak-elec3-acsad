# Assignment 4 Submission

## About us

- Group number: 1
- Section: IV-ACSAD
## Estimate 1: the Lab 4 endpoint

Asia Pacific (Singapore), 1 million requests a month: 800,000 GET and 200,000 POST.

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon API Gateway | HTTP API, 1 million requests, 1 KB each | 1.25 |
| AWS Lambda | Without Free Tier, x86, 1,000,000 requests, 100 ms, 128 MB | 0.41 |
| Amazon DynamoDB | On-demand, Standard, 1 GB, 1 KB items, 0.2 million writes, 0.8 million eventually consistent reads | 0.48 |
| **Total** | | 2.14 |

## Estimate 2: the Lab 2 setup

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon EC2 | 1 `t3.micro`, Linux, On-Demand, 100% utilization, 8 GB gp3, detailed monitoring on | 12.51 |

Share link of our estimate: https://calculator.aws/#/estimate?id=da75bc2a3cccd05279351f7436b0448a3d8f9bb9

## Question

In a month with no requests at all, which costs remain in each setup, and why?

With no requests, API Gateway and Lambda have little to no usage-based charges because no requests are processed or functions executed. DynamoDB may still incur storage charges and costs for any enabled additional features. In Lab 2, EC2 continues to incur compute costs while the instance is running, and EBS storage remains chargeable even when the instance is stopped. Therefore, the serverless setup can be cheaper during periods of inactivity, while EC2 requires payment for maintaining the running server.

## Recommendation

I recommend the Lab 4 serverless setup for our message API handling 1 million requests per month because it is cheaper and easier to maintain. Its estimated monthly cost is $2.14, compared to $12.51 for the Lab 2 EC2 setup. When there are no requests, API Gateway and Lambda have little to no usage-based charges, while DynamoDB may still incur storage costs; EC2 continues to incur compute costs while running. The serverless setup also handles sudden increases in traffic automatically, while EC2 requires our group to manage server capacity, updates, and security patches. Overall, Lab 4 is the better choice because it costs less, reduces maintenance work, and can scale more easily with changing traffic.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| cess-O | Verified AWS estimates and prepared the submission and PR. |
| Jerothegreat | Configured and calculated AWS service costs. |
| saintschalice | Reviewed pricing assumptions and estimate details. |
| Vnslv | Coordinated the group and reviewed the final recommendation. |
