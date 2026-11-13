# Assignment 4 Submission

## About us

- Group number: 3
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

Share link of our estimate: https://calculator.aws/#/estimate?id=eb9fb5eab380d1c0af6406c3c5572ad7c43f931f

## Question

In a month with no requests at all, which costs remain in each setup, and why?

In a month with no requests, API Gateway and Lambda have no request charges, and DynamoDB has no read or write charges. The 1 GB DynamoDB table still has a storage charge. The EC2 setup still costs about $12.51 because the instance, 8 GB gp3 storage, and detailed monitoring are billed even when there is no traffic.

## Recommendation

Five sentences. Which setup fits the Lab 4 message API at 1 million requests a month, and why? Use our two totals, our answer to the question, and the work that each setup needs from our group.

The serverless Lab 4 setup fits the message API far better at 1 million requests per month. It costs $2.14 per month compared to $12.51 for the EC2 setup, making EC2 nearly six times more expensive. When traffic drops to zero, the serverless cost drops, but DynamoDB storage still costs money. The serverless setup needs less maintenance because AWS manages the servers and can scale the services when traffic increases. Therefore, serverless is a lower-cost choice that requires less work from our group.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| edjjff | Set the prices for API Gateway, Lambda, and DynamoDB. |
| johnclefordricafranca | Set the prices for EC2, EBS, and monitoring. |
| reymarttskrt | Checked the costs and wrote the answers and recommendation. |
| LUZADA-SARAH | Compiled the answers, checked the work, and uploaded it to GitHub. |