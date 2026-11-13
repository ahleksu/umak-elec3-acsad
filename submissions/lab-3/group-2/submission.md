# Lab 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/lab-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Add rows to the Task 1 table if your VPC divides into 8 subnets.
4. Do not write full names or student numbers in this file.
-->

## About us

- Group number: 2
- Section: 4 ACSAD
- Client: A barangay health center records system
- VPC CIDR: 192.168.16.0/20

## Task 1. Equal subnets

New prefix: /22

| # | CIDR | First | Last | Usable | First usable | Last usable |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 192.168.16.0/22 | 192.168.16.0 | 192.168.19.255 | 1,019 | 192.168.16.4 | 192.168.19.254 |
| 2 | 192.168.20.0/22 | 192.168.20.0 | 192.168.23.255 | 1,019 | 192.168.20.4 | 192.168.23.254 |
| 3 | 192.168.24.0/22 | 192.168.24.0 | 192.168.27.255 | 1,019 | 192.168.24.4 | 192.168.27.254 |
| 4 | 192.168.28.0/22 | 192.168.28.0 | 192.168.31.255 | 1,019 | 192.168.28.4 | 192.168.31.254 |


Reserved addresses of subnet 1: 192.168.16.0, 192.168.16.1, 192.168.16.2, 192.168.16.3, 192.168.19.255

Working for subnet 1: 

```
4 subnets = 2 extra bits, so the new prefix is /20 + 2 = /22
host bits = 32 - 22 = 10, total = 2^10 = 1,024
first = 192.168.16.0
last = 192.168.19.255
usable = 1,024 - 5 = 1,019
first usable = 192.168.16.0 + 4 = 192.168.16.4
last usable = 192.168.19.255 - 1 = 192.168.19.254
```

## Task 2. Subnets of a given size

- 2a. 2^(24 - 20) = 16 subnets
- 2b. 256 - 5 = 251 usable addresses each
- 2c. CIDR: 192.168.25.0/24. Usable range: 192.168.25.4 to 192.168.25.254

Working for 2c:

```
a /24 has 256 addresses, so each subnet moves the 3rd octet by 1
subnet number 10 starts at 192.168.16.0 + (10 - 1) x 256 = 192.168.25.0
last address = 192.168.25.255
usable = 192.168.25.4 to 192.168.25.254
```

- 2d. 192.168.31.0/24

## Task 3. Subnets from host counts

| Subnet | Prefix | CIDR | Availability Zone | Usable |
| --- | --- | --- | --- | --- |
| private-a | /24  | 192.168.16.0/24 | ap-southeast-1a | 251 |
| private-b | /24  | 192.168.17.0/24 | ap-southeast-1b | 251 |
| public-a | /25  | 192.168.18.0/25 | ap-southeast-1a | 123 |
| public-b | /25  | 192.168.18.128/25 | ap-southeast-1b | 123 |

## Task 4. Proposed subnets

| # | Proposal | Valid or not valid | Why |
| --- | --- | --- | --- |
| P1 | 192.168.16.128/25 | not valid | Because it overlaps private-a, 192.168.16.0/24 |
| P2 | 192.168.32.0/22 | not valid | Because it is outside the VPC, which ends at 192.168.31.255 |
| P3 | 192.168.29.0/25 | valid | Because it is inside the vpc, it starts on the correct prefix, and is an allowed subnet size |
| P4 | 192.168.28.128/29 | not valid | The "/29" prefix is smaller than "/28", the smallest subnet that AWS allows |
