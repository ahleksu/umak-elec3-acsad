---
week: 14
graded: true
counts_toward: Final Class Standing, Lab Activities (30%)
duration: 60 minutes, in the second hour of the class
mode: Group. One Pull Request per group in this repository, then the Pull Request link in the Google Form.
coverage: CIDR blocks, dividing a VPC into equal subnets, subnets of a given size, sizing subnets from a host count, the five AWS reserved addresses, checking a subnet block
due: 11:59 PM (Asia/Manila) on the night of your section's class
---

# Lab 3: VPC Subnet Planning Case Study

> **Submission format:** One Pull Request per group, with your `submission.md` and `contribution.md`. When the Pull Request is open, submit its link in the Google Form: https://forms.gle/v3tpLZzJZcWEtR8U8. Do not merge your own Pull Request.

**The case:** Your group works as the cloud engineers of a small company. Your client wants to move its app to AWS and has reserved one VPC CIDR block for it. Before anyone clicks **Create VPC**, the client wants to see how that block can be divided into subnets. Each group has a different client and a different VPC block, so your answers are your own.

**Before you start:** Read [`README.md`](README.md). It has the rules and a full worked example. You do not sign in to AWS in this lab.

**Tools:** Paper, a calculator, or a spreadsheet. Do not use an online subnet calculator. Write your working for Task 1, subnet 1, and for Task 2c, so I can see how you got the numbers.

## Before you start

1. Fork this repository and clone your fork. Create a branch named `lab-3-group-<number>`, for example `lab-3-group-04`.
2. Create the folder `submissions/lab-3/group-<number>/`.
3. Copy [`submission-template.md`](submission-template.md) into that folder as `submission.md`, and [`contribution-template.md`](contribution-template.md) as `contribution.md`.
   [`submission-example.md`](submission-example.md) shows a filled-in submission for the worked example.
4. Find your group's row in the table below. Use only your group's values.

## Your client

| Group | Client | VPC CIDR | Task 1: divide into | Task 2: subnet size, subnet number | Task 3: usable addresses needed (private, public) | Task 4: proposed subnets |
| --- | --- | --- | --- | --- | --- | --- |
| Group 1 | A school canteen ordering app | `10.66.0.0/17` | 4 equal subnets | `/23`, number 15 | 2,975, 2,149 | P1 `10.66.8.0/21`, P2 `10.66.128.0/19`, P3 `10.66.96.0/20`, P4 `10.66.86.191/20` |
| Group 2 | A barangay health center records system | `192.168.16.0/20` | 4 equal subnets | `/24`, number 10 | 191, 60 | P1 `192.168.16.128/25`, P2 `192.168.32.0/22`, P3 `192.168.29.0/25`, P4 `192.168.28.128/29` |
| Group 3 | A jeepney fleet tracking service | `172.23.48.0/20` | 8 equal subnets | `/25`, number 12 | 942, 71 | P1 `172.23.54.0/24`, P2 `172.23.58.0/30`, P3 `172.23.63.0/25`, P4 `172.23.64.0/22` |
| Group 4 | A sari-sari store point-of-sale chain | `10.170.224.0/20` | 8 equal subnets | `/24`, number 14 | 193, 35 | P1 `10.170.231.27/26`, P2 `10.170.235.192/26`, P3 `10.170.240.0/22`, P4 `10.170.225.128/25` |
| Group 5 | A campus library reservation system | `10.192.64.0/18` | 4 equal subnets | `/24`, number 5 | 3,993, 1,472 | P1 `10.192.128.0/20`, P2 `10.192.72.0/21`, P3 `10.192.120.0/21`, P4 `10.192.112.0/29` |
| Group 6 | A dental clinic booking app | `10.76.0.0/16` | 8 equal subnets | `/22`, number 6 | 3,561, 253 | P1 `10.76.35.0/24`, P2 `10.76.252.0/23`, P3 `10.77.0.0/18`, P4 `10.76.102.0/30` |
| Group 7 | A bakery delivery app | `192.168.160.0/21` | 8 equal subnets | `/25`, number 10 | 473, 70 | P1 `192.168.166.128/25`, P2 `192.168.168.0/23`, P3 `192.168.167.0/30`, P4 `192.168.165.164/25` |
| Group 8 | An esports tournament platform | `10.175.128.0/17` | 4 equal subnets | `/22`, number 30 | 5,874, 1,764 | P1 `10.175.234.47/21`, P2 `10.175.248.0/21`, P3 `10.175.176.0/20`, P4 `10.175.224.0/30` |
| Group 9 | A laundry shop pickup app | `10.9.0.0/18` | 8 equal subnets | `/22`, number 15 | 719, 307 | P1 `10.9.64.0/20`, P2 `10.9.36.0/29`, P3 `10.9.48.0/23`, P4 `10.9.18.46/23` |
| Group 10 | A print shop order portal | `172.22.0.0/16` | 8 equal subnets | `/20`, number 5 | 14,877, 5,820 | P1 `172.22.192.0/30`, P2 `172.23.0.0/18`, P3 `172.22.224.0/20`, P4 `172.22.212.202/20` |
| Group 11 | A pet clinic records system | `10.189.128.0/19` | 4 equal subnets | `/24`, number 7 | 579, 499 | P1 `10.189.150.0/23`, P2 `10.189.142.0/30`, P3 `10.189.148.133/23`, P4 `10.189.160.0/21` |
| Group 12 | A boarding house finder app | `10.89.192.0/18` | 8 equal subnets | `/22`, number 15 | 1,857, 1,994 | P1 `10.89.236.103/22`, P2 `10.89.224.0/30`, P3 `10.90.0.0/20`, P4 `10.89.240.0/22` |

Tasks 1, 2, and 3 are three different options that the client is comparing. Each task starts again from the whole VPC. Task 4 checks proposals against your Task 3 plan.

## Task 1. Divide the VPC into equal subnets (16 points)

The client wants the VPC split into the number of equal subnets in your row.

1. Write the new prefix of each subnet.
2. For every subnet, write its CIDR block, first address, last address, usable addresses, first usable address, and last usable address.
3. For subnet 1 only, list the five reserved addresses.

## Task 2. Subnets of a given size (8 points)

The client's network staff want every subnet to be the size in your row.

- **2a.** How many subnets of that size fit in the VPC?
- **2b.** How many usable addresses does each one have?
- **2c.** Write the CIDR block and the usable range of the subnet with the number in your row. Subnet number 1 starts at the first address of the VPC.
- **2d.** Write the CIDR block of the last subnet.

## Task 3. Size the subnets from host counts (12 points)

The client needs four subnets: two private subnets for the app servers and the RDS database, and two public subnets for the load balancer. Your row gives the usable addresses that each private subnet and each public subnet needs.

Follow these rules:

- Give each subnet the smallest block whose usable count (total minus 5) is at least the need.
- Place the subnets in this order: `private-a`, `private-b`, `public-a`, `public-b`.
- Start `private-a` at the first address of the VPC. Start each next subnet at the first address after the previous one that is on a step for its size.
- Put the `-a` subnets in `ap-southeast-1a` and the `-b` subnets in `ap-southeast-1b`.

For each subnet, write its prefix, CIDR block, Availability Zone, and usable addresses.

## Task 4. Check the proposed subnets (8 points)

A groupmate proposes the four subnet blocks in your row, P1 to P4, for future use in the same VPC. For each one, write **Valid** or **Not valid** and one sentence that says why. A valid block is inside the VPC, starts on a step, is between `/16` and `/28`, and does not overlap your Task 3 plan. If a block does not start on a step, also write the valid block of the same size that holds its address.

## Submit

1. Fill in `contribution.md`: who computed, who checked, and who wrote each task.
2. Commit, push your branch, and open one Pull Request to this repository. Title: `Lab 3: Group <number>`.
3. Submit the Pull Request link in the Google Form: https://forms.gle/v3tpLZzJZcWEtR8U8.

## If you get stuck

- Recheck the block size first. Most wrong last addresses come from a wrong total.
- Check that your first usable address is 4 more than the first address, and that your last usable address is 1 less than the last address.
- Compare your steps with the worked example in [`README.md`](README.md).
- Message me in the group chat with your group number and the task number.
