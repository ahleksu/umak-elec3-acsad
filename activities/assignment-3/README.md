# Assignment 3: Price the Database Before You Build It

This is a self-guided activity. A database runs, and costs money, every hour that it exists. So a cloud engineer prices a database before anyone creates it. Your group prices an Amazon RDS for MySQL database for the client from your [Lab 3](../lab-3/lab.md) case.

Work through this page first. It explains the choices that change the price. Then follow the steps in [`assignment.md`](assignment.md).

## What you do

This is group work. You do not sign in to AWS. Your group submits one Pull Request.

1. Open the AWS Pricing Calculator at <https://calculator.aws>.
2. Build three estimates for Amazon RDS for MySQL in Asia Pacific (Singapore): small and cheap, high availability, and read scaling.
3. Save the estimate and copy its share link.
4. Recommend one option for your Lab 3 client, in five sentences.
5. Answer one question about Multi-AZ and read replicas.

You create nothing in AWS, so this assignment costs nothing.

## Key ideas

### Amazon RDS

Amazon RDS runs a relational database for you. AWS installs the database engine, patches it, and backs it up. You choose the size and the setup. You pay for every hour that the database runs, and for its storage.

### Instance class

The instance class sets the CPU and the memory of the database server, for example `db.t4g.micro`. A larger class costs more per hour.

### Single-AZ and Multi-AZ

A Single-AZ database runs in one Availability Zone. If that zone fails, the database stops until AWS recovers it. A Multi-AZ deployment adds a standby copy in a second Availability Zone. AWS keeps the standby up to date and switches to it when the primary fails. You pay for the standby too.

### Read replicas

A read replica is a second DB instance that holds a copy of the data. An application with many reads can send some of its read queries to it. In the calculator, a read replica is one more node of the same instance class.

### Storage

General Purpose SSD (gp3) storage is priced per GB each month. Your three estimates use 20 GB.

### Check every field

The calculator fills in its own defaults, and some of them are expensive. When I opened it on October 30, the default setup cost USD 8,507.28 a month in Singapore. The small setup in [`assignment.md`](assignment.md) cost USD 21.01. Read every field before you trust a total.

## How you submit

Submit one Pull Request per group to this repository. Then one groupmate submits the Pull Request link in the Google Form: https://forms.gle/ftSQ77MaprGrMHEN9. Both are due on Friday, November 6, 2026, at 11:59 PM (Asia/Manila).

## Files in this folder

| File | What it is |
| --- | --- |
| [`README.md`](README.md) | This page: what you do and the ideas that change the price. |
| [`assignment.md`](assignment.md) | The calculator steps, the three estimates, what to submit, and the scoring. |
| [`submission-template.md`](submission-template.md) | Every item to submit, with an `<answer>` placeholder. Copy it to your submission folder as `submission.md`. |
