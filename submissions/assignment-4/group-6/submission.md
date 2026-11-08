# Assignment 4 Submission

## About us

- Group number: 6
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

Share link of our estimate: https://calculator.aws/#/estimate?id=1017b9d563e854d9e1ca451a661f1e7fcff5000b

## Question

In a month with no requests at all, which costs remain in each setup, and why?

In the serverless setup, almost nothing remains. API Gateway charges per request and Lambda charges per request and per millisecond of run time, so with no requests both cost 0.00 USD. Only DynamoDB storage remains, about 0.29 USD for the 1 GB that the table holds, because DynamoDB charges for stored data whether anyone reads it or not. In the EC2 setup, the whole 12.51 USD remains. The `t3.micro` instance is billed for every hour that it runs, the 8 GB gp3 volume is billed for the storage that it provisions, and detailed monitoring is billed for its metrics, and none of these depend on how many visitors arrive.

## Recommendation

The serverless setup fits the Lab 4 message API better at 1 million requests a month. It costs about 2.14 USD a month, while the EC2 setup costs about 12.51 USD, so serverless is roughly six times cheaper for the same traffic. In a quiet month it drops to about 0.29 USD for DynamoDB storage, while the EC2 instance still costs the full 12.51 USD because it runs all month with or without visitors. Our group also has less work with serverless, because AWS patches the servers behind Lambda, API Gateway, and DynamoDB, while on EC2 we would have to update the operating system and keep the web server running ourselves. If traffic spikes suddenly, Lambda and on-demand DynamoDB scale up by themselves, while one `t3.micro` could slow down or fail until our Auto Scaling group launches more instances, which would then raise the EC2 cost even more.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| tlswlgus | Built the estimate in the AWS Pricing Calculator and made the share link |
| yellowboeing120 | Checked every setting in the estimate against the brief |
| amagpantaya12345923-gif | Wrote the answer to the question about a month with no requests |
| Bewoop | Wrote the recommendation and filled in submission.md |
