# Lab 3 Submission

## About us

- Group number: 9
- Section: IV-ACSAD
- Client: A laundry shop pickup app
- VPC CIDR: 10.9.0.0/18

## Task 1. Equal subnets

New prefix: /21

| # | CIDR | First | Last | Usable | First usable | Last usable |
|---|---|---|---|---:|---|---|
| 1 | 10.9.0.0/21 | 10.9.0.0 | 10.9.7.255 | 2,043 | 10.9.0.4 | 10.9.7.254 |
| 2 | 10.9.8.0/21 | 10.9.8.0 | 10.9.15.255 | 2,043 | 10.9.8.4 | 10.9.15.254 |
| 3 | 10.9.16.0/21 | 10.9.16.0 | 10.9.23.255 | 2,043 | 10.9.16.4 | 10.9.23.254 |
| 4 | 10.9.24.0/21 | 10.9.24.0 | 10.9.31.255 | 2,043 | 10.9.24.4 | 10.9.31.254 |
| 5 | 10.9.32.0/21 | 10.9.32.0 | 10.9.39.255 | 2,043 | 10.9.32.4 | 10.9.39.254 |
| 6 | 10.9.40.0/21 | 10.9.40.0 | 10.9.47.255 | 2,043 | 10.9.40.4 | 10.9.47.254 |
| 7 | 10.9.48.0/21 | 10.9.48.0 | 10.9.55.255 | 2,043 | 10.9.48.4 | 10.9.55.254 |
| 8 | 10.9.56.0/21 | 10.9.56.0 | 10.9.63.255 | 2,043 | 10.9.56.4 | 10.9.63.254 |

Reserved addresses of subnet 1: 10.9.0.0, 10.9.0.1, 10.9.0.2, 10.9.0.3, 10.9.7.255

Working for subnet 1:

8 subnets = 3 extra bits, so the new prefix is /18 + 3 = /21

host bits = 32 - 21 = 11, total = 2^11 = 2,048

first = 10.9.0.0

last = first + 2,047 = 7 x 256 + 255 -> 10.9.7.255

usable = 2,048 - 5 = 2,043

first usable = 10.9.0.0 + 4 = 10.9.0.4

last usable = 10.9.7.255 - 1 = 10.9.7.254

## Task 2. Subnets of a given size

- 2a. 2^(22 - 18) = 16 subnets
- 2b. 1,024 - 5 = 1,019 usable addresses each
- 2c. CIDR: 10.9.56.0/22. Usable range: 10.9.56.4 to 10.9.59.254

Working for 2c:

A /22 has 1,024 addresses, so each subnet moves the 3rd octet by 4

subnet number 15 starts at 10.9.0.0 + (15 - 1) x 1,024

= 14 x 1,024 = 14,336 addresses = 56 x 256 -> 10.9.56.0

last address = 10.9.59.255

usable = 10.9.56.4 to 10.9.59.254

- 2d. 10.9.60.0/22

## Task 3. Subnets from host counts

| Subnet | Prefix | CIDR | Availability Zone | Usable |
|---|---|---|---|---:|
| private-a | /22 | 10.9.0.0/22 | ap-southeast-1a | 1019 |
| private-b | /22 | 10.9.4.0/22 | ap-southeast-1b | 1019 |
| public-a | /23 | 10.9.8.0/23 | ap-southeast-1a | 507 |
| public-b | /23 | 10.9.10.0/23 | ap-southeast-1b | 507 |

## Task 4. Proposed subnets

| # | Proposal | Valid or not valid | Why |
|---|---|---|---|
| P1 | 10.9.64.0/20 | Not valid | It is outside the VPC, which ends at 10.9.63.255. |
| P2 | 10.9.36.0/29 | Not valid | A /29 is smaller than /28, the smallest subnet that AWS allows. |
| P3 | 10.9.48.0/23 | Valid | It is inside the VPC, starts on a step for a /23, is between /16 and /28, and overlaps none of our Task 3 subnets. |
| P4 | 10.9.18.46/23 | Not valid | It does not start on a step for a /23. The valid block that holds the address is 10.9.18.0/23. |
