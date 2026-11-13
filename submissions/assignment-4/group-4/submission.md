# Assignment 4 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-4/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 4
- Section: IV-ACSAD

## Estimate 1: the Lab 4 endpoint

Asia Pacific (Singapore), 1 million requests a month: 800,000 GET and 200,000 POST.

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon API Gateway | HTTP API, 1 million requests, 1 KB each | 1.25 |
| AWS Lambda | Without Free Tier, x86, 1,000,000 requests, 100 ms, 128 MB | 0.41 |
| Amazon DynamoDB | On-demand, Standard, 1 GB, 1 KB items, 0.2 million writes, 0.8 million eventually consistent reads | 0.20 |
| **Total** | | 1.86 |

## Estimate 2: the Lab 2 setup

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon EC2 | 1 `t3.micro`, Linux, On-Demand, 100% utilization, 8 GB gp3, detailed monitoring on | 12.51 |

Share link of our estimate: https://calculator.aws/#/estimate?id=0ecbd6817c0cdf0aee7b26bfd14ca443b4927c5c

## Question

In a month with no requests at all, which costs remain in each setup, and why?

In the serverless setup (Lab 4), practically none of the costs remain because all three services charge on a pay-per-request model: Amazon API Gateway charges USD 0.00 for zero API requests, AWS Lambda charges USD 0.00 for zero invocations and runtime duration, and DynamoDB on-demand charges USD 0.00 for zero read/write request units (with the 1 GB stored table data costing USD 0.00 under the 25 GB free storage tier, or at most USD 0.25 without it). In contrast, in the EC2 setup (Lab 2), all costs remain in full (USD 12.51, consisting of USD 9.64 for the `t3.micro` instance running 730 hours, USD 0.77 for the 8 GB gp3 EBS root volume, and USD 2.10 for detailed CloudWatch monitoring metrics) because AWS charges for provisioned virtual servers, allocated block storage volumes, and metric monitoring on an hourly and monthly basis regardless of whether any visitor sends traffic.

## Recommendation

Five sentences. Which setup fits the Lab 4 message API at 1 million requests a month, and why? Use our two totals, our answer to the question, and the work that each setup needs from our group.

We recommend the serverless setup for the Lab 4 message API at 1 million requests a month. At USD 1.86 per month compared to USD 12.51 for the single `t3.micro` EC2 setup, the serverless architecture is almost seven times cheaper while handling the exact same workload. In months or periods with zero traffic, the serverless setup drops to USD 0.00 in compute and request costs, whereas the EC2 server and its EBS disk continue accumulating full hourly and storage charges even when idle. From an operational perspective, the serverless approach requires no server management from our group because AWS handles operating system patching, runtime maintenance, and automatic scaling to meet sudden traffic spikes without manual intervention. Conversely, the EC2 setup demands continuous maintenance work from our team to apply security updates, configure Auto Scaling policies, and monitor instance health, making serverless both significantly more economical and far easier to maintain.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| chupapichuros | Configured the estimates in the AWS Pricing Calculator, generated the share link, and created the submission file and branch. |
| EvapeGT | Verified the pricing parameters and monthly cost breakdowns for API Gateway, Lambda, DynamoDB, and EC2 against assignment requirements. |
| Note-Program | Drafted the five-sentence architecture recommendation using our cost totals, operational work, and traffic comparisons. |
| Steeshesh | Researched and wrote the explanation for why costs differ between serverless and EC2 in a month with zero requests. |

