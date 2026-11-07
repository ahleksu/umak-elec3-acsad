# Assignment 4 Submission

## About us

- Group number: 5
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

Share link of our estimate: https://calculator.aws/#/estimate?id=b9c90ff219371cd312389c036ae0703913cf557a

## Question

In a month with no requests at all, which costs remain in each setup, and why?

In the Lab 4 setup, almost nothing remains. API Gateway and Lambda charge per request and per run, so with no requests they cost nothing. Only DynamoDB keeps a small cost, because it still charges every month for the data stored in the table. In the Lab 2 setup, the costs stay the same as in a busy month. The EC2 instance is charged for every hour that it runs, the EBS disk is charged every month, and detailed monitoring is charged too, whether or not anyone visits the page. AWS also charges by the hour for the instance's public IPv4 address, which our estimate leaves out.

## Recommendation

Five sentences. Which setup fits the Lab 4 message API at 1 million requests a month, and why? Use our two totals, our answer to the question, and the work that each setup needs from our group.

At 1 million requests a month, the Lab 4 serverless setup costs about USD 2.14 a month, while the Lab 2 EC2 setup costs about USD 12.51, so the serverless setup is almost six times cheaper. With no requests at all, the serverless setup costs almost nothing except the small DynamoDB storage charge, but the EC2 setup keeps charging for instance hours, the EBS disk, and monitoring, so we pay even when nobody visits. With serverless, AWS runs and patches the servers for us, while with EC2 our group has to patch the operating system and keep the instance healthy. API Gateway and Lambda also scale automatically when traffic suddenly spikes, whereas a single t3.micro could be overwhelmed unless we add more instances. For these reasons, we recommend the serverless Lab 4 setup for the message API.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| MrBep | Guided the group through the calculator steps and gave instructions to the groupmate entering the estimate. |
| Rengokunn | Entered the settings in the AWS Pricing Calculator for the Lab 4 endpoint and the Lab 2 EC2 setup, and created the estimate. |
| klienfinity123 | Checked the estimate against the assignment settings and compiled the costs and details needed for the submission. |
| stratterium | Assembled submission.md from the group's estimate, formatted it against the template, and opened the Pull Request. |
