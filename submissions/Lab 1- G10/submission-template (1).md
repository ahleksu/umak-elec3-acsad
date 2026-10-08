# Lab 1 Submission

## Part B
**Error Action Name:** You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/acsad-g10 is not authorized to perform: **ec2:RunInstances** on resource: arn:aws:ec2:ap-southeast-1:548387266019:instance/* because no identity-based policy allows the ec2:RunInstances action. Encoded authorization failure message: AwsgCbq_lUUs7K4N8JUUz_2qP5e-rwF2pAkX1kWy3QdURmOef7hvUIWk0BuAVAhUcAgkBgrryR3VrPoUvnJ38QjuxdBoVBl5F6adFhvyrp94riYIU2SAT5N0YCEx90RVXNJGjVFGkSemfZnhQ4nQblmAErq2sbUXOHIr9Jx4r3ERczuN5Tzy40JZJ0bRmqEcYL-R3AOsMCiqODCDCT_LaFX-O_iXndjcESx0JBguKSJcn3wX-5lg0VCC7kq2WgWFAF8MSrwXN_xwdxtFZ7hMSxN2sjjYSkm8HVNmLBxojbWiJbVSF6PY9RX7TQryazPMopO8exDJzbqPZz9yEKWdIL1MIPC2amGj2-0pyw2QWu_DxcXGnqFMZfZS5ST4G8-5eKH177QE6byjGMDsw4fQzzp1Z1p7e3hN9dii9ujpmRpouKzV2BiRu0BSNEvIz4bj2N9N4SxXCcI1G9mEQE1YSLylllYsoLg4NstxZ9LmAquPx8yjrp9Egm6XC1LABwzF9zmgYX2CDAGOSCTbPdkGnj5sKRxEemcVue5VMrtSVi0YkFat0vmhWr0ZyYl21mF_oTBI05SoaACYKSCeGA6BmmwX_JvHy0em2kw9T3Yx_o-wICzNBvZo1Gwa5Po2wGow3C1F1XBMboPSBz4UrSP-kN2IvczTpThqw8z61SEZlvrl4YQ2Fn0_XD_4lWs2EYvQzP-3kZrGBtZJcm5olrwZUYMAxOcEkDw-lwbXP7UCMKegpd0_psvivi6zeAagp9679fO6hXgLLii2IUeYBeF0SsQ3gpxa6Z-VaAoULQ0D5crI4XP-Yk7MTg
![Part B Error]
**Screenshot (Part B launch denial with username visible):** 

## Part C
**Policy Statement Blanks:**
- `"Action"`: "ec2:RunInstances"
- `"Resource"`: "arn:aws:ec2:ap-southeast-1:548387266019:arn:aws:ec2:ap-southeast-1:548387266019:instance/*"
- `"ec2:InstanceType"`: "t3.micro"

## Part D
**Security Group Error Text:** You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/acsad-g10 is not authorized to perform: ec2:CreateSecurityGroup on resource: arn:aws:ec2:ap-southeast-1:548387266019:security-group/* because no identity-based policy allows the ec2:CreateSecurityGroup action. Encoded authorization failure message: ljmx3RJe7Hc3q7Y5JxHiVCNqjuVe9n6kgXexivF32XXA-pKlhJwNdKbOy0nsipmTEaUYnnNJfRJW7r1cA69HXKH0kbXl9F2Y0Kwog4X7nSsiBxf-kjHBXVaMThjQxmWU1roCDy4dUGsqERUCdS9OaQ7YnQu01BorXMT7Ihnxocf3QWOyABL22pKywrM51xKxNQ7mkutu7Vu_dNn0WrstjYlm9h9ktx3uIMhtc_7GQ8YB8t1jeiZSAUcE-h4NT2R5pQ_4WEbvgcsYDhEOoYnhrGJ4COBDVn72d-wDrTPoKIL0P47M4TyZQ2xFDjiEvxlBQxiEkvFXhgDdE1PtajYshdCwl_5vXzBEiFq2If90fMjyN0Ebhm5ID4RFcSyhoEqTRKPMoRvYndYRXA4TXCPX9dZMwCMMIW9uwbVklFd2u-0cAj_84jXfWHpaVLDCVA5Iy5ct4UnYcc0npTrJDer9HYgvHRFKg8JkOZBn9msMWXjlZbBRxO83KOLRXgT4zzKaLJOQzTNa0gghkQHS-KCBedyTgPe0jxv9sAcsPK4C

**Running Instance Time:** <write time here>

**Screenshot 1 (Permissions tab listing <user>-launch):**
![Permissions Tab](part-d-policy.png)

**Screenshot 2 (Instance in Running state):**
![Running Instance](part-d-instance.png)

## Part E
**t3.small / Tokyo Denial Error:** Instance launch failed
You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/acsad-g10 is not authorized to perform: ec2:RunInstances on resource: arn:aws:ec2:ap-southeast-1:548387266019:instance/* with an explicit deny in a permissions boundary: arn:aws:iam::548387266019:policy/umak-lab-boundary. Encoded authorization failure message: UYtC9iAjrejq32wq_Zw0o4c0pRwT4vN-Y9EQ_Hq3K_cVi58xoJ_xGA_sq7geeYRKApaQgLRQQEwq4iLyV7CE2EiBIJtZwuGTS_O6vb8mYhMp4X_eVN7RjHOySNqUeceOiHOQwawTpnnLqNQEb5VsZVccZYYyV1qDo1G48sYIqsC0Ll8kGLVL0qnCuKGv_A9v31GQdijXa_oqzAzhQwIjzpm1qoJ6fqyxEMaVTtJsQxQnkC07rnkcUQcUO1q6greyoq99u8XOC57q0CpOrxjONJzYYp-0k9O1esJy1RIsSDzbAaWnwqBko94enurjx1bhrse8OUsukROarlFZFl3HQocKmv7OCjh-Dar_lCy4wJy7aRmGYudbjAQAHwgLtOO6EzWbpC_p8BXpBKu_3-dj7QVDJQ8zZWkmVh4UP7SclYkAU1ScIpX6p0IjNC57qC8B59z7Es9TKXr-1objTwxOeo38frxhTXRKQPnZDt_-YNiA7sp2leIiW7ik2NQxa0By0XdyNuqOlXDWtkNQnuD_UH1Mw8bymSOcKYBU-9svKudbLdpeFaSIRuvUmvhsy95y16ANGK2HqFWHhpz_7W5LMocsf4WBcRFQf6v9YDdSAKNccrYp7UVWU9wdT4S0ObgWcHmbFer25KeMjnL9KqCIVuo0wVx-juAn4VTv9O7hFTUcpTvvVSMJ8Q2cHViuYzDjJQcfNA7AMKSaDlRz-jrLihvEaisrd63klwSBEMPc6GYQFx7esYrUR0Gg8a-trraJm_cu6ZCaFkN9SlU1frrOUi44sfcaw1S6Bl8Kf536ilSwlBMTFd-oYS1rrNbTnr1Cy0Q9BLSvDW71U1aJ4Bo0TwGwwDDMpElWNmDE4mz_3dPTgozDKJZKVo_2BXzEPXjrMrLNpNYBJbE1zsdg6mVnNPjRpS5-BfF4S7VzsY7uME5z3J6mzFCvN2vTjvejn84N2w

**Screenshot 1 (t3.small or Tokyo denial):**
![Boundary Denial](part-e-denial.png)

**Screenshot 2 (CloudTrail event showing errorMessage):**
![CloudTrail Event](part-e-cloudtrail.png)

## Part F Questions
1. Which action did the Part B error name?
   - ec2:RunInstances
2. In your policy, which condition limits `ec2:RunInstances`?
   -The ec2:InstanceType condition limits ec2:RunInstances to the allowed instance type, t3.micro.
3. After you attached `ec2:*` on `*`, why was `t3.small` still denied? Name the boundary statement.
   - t3.small was still denied because the permissions boundary contains an explicit Deny for ec2:RunInstances when the requested instance type is not allowed. The boundary statement restricting ec2:InstanceType to t3.micro caused the denial.
4. Why is `ec2:*` on `*` a poor policy even with a boundary?
   - ec2:* on * grants very broad EC2 permissions, which violates the principle of least privilege. Even though the permissions boundary limits the maximum permissions, the identity policy still grants more access than is necessary.
5. In two sentences: what does the boundary control that your policy cannot?
   - The permissions boundary controls the maximum permissions that the user can exercise, even if the identity policy grants broader permissions. An explicit Deny in the boundary can prevent an action such as ec2:RunInstances from being allowed by the identity policy.
