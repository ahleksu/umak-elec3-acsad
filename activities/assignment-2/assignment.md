---
week: 10
graded: true
counts_toward: Class Standing, Seatwork/Assignment/Recitation (10%)
estimated_time: 45 to 60 minutes
mode: Individual, take-home. Sign in with your Lab group IAM user. Submit a Pull Request to your section repository, then submit the Pull Request link in the Google Form.
coverage: VPC, CIDR, subnets, Availability Zones, route tables, internet and NAT gateways, security groups, network ACLs
due: 2026-10-07, 11:59 PM (Asia/Manila). The Pull Request and the Google Form must both be in by this time.
---

# Assignment 2: Explore a VPC

This is a self-guided activity. Work through [`README.md`](README.md) first. It explains every term that this page uses.

> Submit your work as a Pull Request to this repository, like the earlier activities. Then submit the Pull Request link in this Google Form: <https://forms.gle/KBYrjEwoLRqre9fE9>. Both are due on Wednesday, October 7, 2026, at 11:59 PM (Asia/Manila). Do not merge your own Pull Request.

## Before you start

1. Fork this repository and clone your fork. Create a branch named `assignment-2-<your-github-username>`.
2. Create the folder `submissions/assignment-2/<your-github-username>/`. Use your exact GitHub username.
3. Copy [`submission-template.md`](submission-template.md) into that folder and rename the copy to `submission.md`. You write every answer in this file.
4. Read [`sample-submission.md`](sample-submission.md). It shows a complete submission for a made-up student. Do not copy its values.
5. Find your value of X. Take the last two digits of your student number and add 100.

| Last two digits of the student number | X |
| --- | --- |
| `07` | 107 |
| `42` | 142 |
| `00` | 100 |
| `99` | 199 |

Write X in the "About me" part of your `submission.md`. Part B uses it. I compare X with the student number in your form response.

## Part A. Explore (17 points)

You use the AWS console in this part. You only look. The group user cannot create, change, or delete anything in this assignment. If a page shows a red error, write down the message and continue.

To take each screenshot:

1. Take the screenshot of the page.
2. Crop out the top bar of the AWS console. The top bar shows the account number and the IAM user name, and your Pull Request is public.
3. Save the screenshot as a PNG file in your submission folder, with the file name that the step gives.

### A0. Sign in

1. Sign in with the IAM user and password of your Lab group. Use the sign-in link that I gave your group.
2. In the top bar, make sure that the Region is **Asia Pacific (Singapore)**.

Do not change the group password. Your groupmates use the same user. If you change the password, you lock them out.

If you cannot sign in, go to [If AWS does not work](#if-aws-does-not-work).

### A1. The VPC (2 points)

1. In the search bar, type `VPC` and open **VPC**.
2. In the left menu, click **Your VPCs**.
3. Find the VPC where the **Default VPC** column says **Yes**.

Record:

- The IPv4 CIDR of the default VPC.
- The number of IPv4 addresses in that CIDR. Use the table in the README.

### A2. The subnets (2 points)

1. In the left menu, click **Subnets**.
2. Look at every subnet in the default VPC.

Record a table with one row for each subnet: its Availability Zone and its IPv4 CIDR.

**Screenshot 1.** Take a screenshot of the subnet list. Make sure that the Availability Zone, IPv4 CIDR, and Available IPv4 addresses columns are visible. Save it as `screenshot-1-subnets.png`.

### A3. Available addresses (2 points)

Look at the **Available IPv4 addresses** column on the same page.

Record the number for each subnet. Then answer:

- Each subnet is a `/20`, which has 4,096 addresses. Why is the number lower than 4,096?
- If one subnet shows a lower number than the others, what uses the missing address?

### A4. The route table (2 points)

1. In the left menu, click **Route tables**.
2. Select the route table of the default VPC.
3. Open the **Routes** tab.

Record every route: its destination and its target. For a target ID, write only the type, for example `local` or `igw-...`.

**Screenshot 2.** Take a screenshot of the Routes tab of this route table. Save it as `screenshot-2-routes.png`.

### A5. Public or private (1 point)

Are the default subnets public or private? Name the route from A4 that proves your answer.

### A6. The internet gateway (1 point)

1. In the left menu, click **Internet gateways**.
2. Find the internet gateway of the default VPC.

Record its **State**. Then answer: what happens to the default subnets if this gateway is detached from the VPC?

### A7. NAT gateways (1 point)

1. In the left menu, click **NAT gateways**.
2. Count the NAT gateways.

Record the count. Then answer: if you add a private subnet to this VPC today, can a server in it download updates from the internet? Give the reason.

### A8. The network ACL (2 points)

1. In the left menu, click **Network ACLs**.
2. Select the network ACL of the default VPC.
3. Open the **Inbound rules** tab.

Record every inbound rule: its rule number, its source, and Allow or Deny. Then explain in one or two sentences how a network ACL is different from a security group.

**Screenshot 3.** Take a screenshot of the Inbound rules tab of this network ACL. Save it as `screenshot-3-network-acl.png`.

### A9. The default security group (1 point)

1. In the left menu, under **Security**, click **Security groups**.
2. Select the security group named `default` in the default VPC.
3. Open the **Inbound rules** tab.

Record the inbound rule: its type and its source. Then answer: which resources can send traffic to an instance that uses this security group?

### A10. Sign out

Click the user name in the top right, then **Sign out**.

## Part B. Prepare (13 points)

You do not use the AWS console in this part. Write your answers in your `submission.md`. Look at the plan in [`diagrams/a2-05-your-vpc-plan.png`](diagrams/a2-05-your-vpc-plan.png).

### B1. Plan two subnets (2 points)

You plan a VPC with the CIDR `10.X.0.0/16`. Use your own value of X. The VPC has two `/24` subnets:

1. The public subnet starts at the first address of the VPC range.
2. The private subnet starts right after the public subnet ends.

Record the CIDR of each subnet.

### B2. Route tables (2 points)

Record the routes, destination and target, for:

- The route table of the public subnet.
- The route table of the private subnet.

For a target, write `local`, `internet gateway`, or `NAT gateway`.

### B3. Draw your VPC (4 points)

Draw your plan from B1 and B2 as a diagram. Use one of these:

- A digital tool. I suggest [Excalidraw](https://excalidraw.com), [draw.io](https://app.diagrams.net), or [Lucidchart](https://www.lucidchart.com). All three have a free option. You can also open [`diagrams/a2-05-your-vpc-plan.excalidraw`](diagrams/a2-05-your-vpc-plan.excalidraw) in Excalidraw and fill in the blanks.
- Paper. Draw with a pen, then take a clear photo.

Your diagram must show:

1. The VPC box, labeled with your VPC CIDR `10.X.0.0/16`.
2. The public subnet and the private subnet, each labeled with its CIDR.
3. The internet gateway, connected to the public subnet only.
4. The routes of each subnet, written next to it.

Export the diagram as a PNG image, and save it in your submission folder as `vpc-diagram.png`. A photo of a paper drawing can be a JPG named `vpc-diagram.jpg`. If you use JPG, change the image line in your `submission.md` to `vpc-diagram.jpg`. For an example, see the B3 diagram in [`sample-submission.md`](sample-submission.md).

### B4. Predict a change (2 points)

Your Lab 2 instance ran in a default subnet and had a public IPv4 address. Imagine that someone deletes the route `0.0.0.0/0` from the default route table. Answer:

- Can you still open the instance web page from your laptop? Why?
- Can the instance still reach another instance in the same VPC? Why?

### B5. Place a database (2 points)

You add a database server to your VPC from B1. Which subnet do you put it in? Give the reason.

### B6. Your question about VPCs (1 point)

Write one question about VPCs that this activity did not answer for you. Say what made you think of it. A specific question about VPCs gets the point.

## If AWS does not work

If you cannot sign in, or a VPC page does not load after you refresh it two times, do these steps:

1. Write `NO ACCESS` and the exact error message in each Part A answer that you did not complete. Save a screenshot of the error under each screenshot file name.
2. Answer A5, A7, and A8 with the example VPC `10.0.0.0/16` in section 3 of the README.
3. Complete Part B as usual.
4. Message me in the class channel before the deadline.

You do not lose points for an access problem that I confirm.

## Scoring (30 points)

| Part | Items | Points |
| --- | --- | --- |
| A | A1 to A9 answers | 14 |
| A | Three screenshots, 1 point each | 3 |
| B | B1, B2, B4, B5, and B6 answers | 9 |
| B | B3 diagram | 4 |
| Total | | 30 |

Use the X from your own student number. If X does not match your student number, B1, B2, and B3 get 0 points.

## How to submit

Your submission folder must look like this:

```text
submissions/assignment-2/<your-github-username>/
├── submission.md
├── screenshot-1-subnets.png
├── screenshot-2-routes.png
├── screenshot-3-network-acl.png
└── vpc-diagram.png
```

1. Make sure that `submission.md` has no `<answer>` left.
2. Make sure that the four image files are in your folder, with the exact file names above.
3. Commit with the message `assignment-2: submit submission.md`, and push to your fork.
4. Open your fork on GitHub, and open `submission.md` in your folder. Make sure that every screenshot and your diagram show on the page.
5. Open a Pull Request against the `main` branch of this repository. Fill in the Pull Request template.
6. Wait for the automated check on your Pull Request. It only confirms that you changed files inside your own folder. If it turns red, move your files into `submissions/assignment-2/<your-github-username>/` and push again.
7. Open the Google Form: <https://forms.gle/KBYrjEwoLRqre9fE9>. Enter your full name, your student number, your section, your GitHub username, and the link to your Pull Request.
8. Submit the form before Wednesday, October 7, 2026, at 11:59 PM (Asia/Manila).

Do not write your full name or your student number in the Pull Request. Do not merge your own Pull Request. Do not post your answers or screenshots in the class channel.

## Working with others and AI tools

This is individual work. You can talk about the concepts in the README with classmates. Write every answer and draw your diagram yourself. The Pull Requests of your classmates are public. Do not copy from them. If something is unclear, message me in the class channel.

You can use an AI tool to understand a concept. Write the answers in your own words. Part A answers must come from what you saw in the console.
