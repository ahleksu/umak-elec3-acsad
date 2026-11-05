# Lab 2 Submission

## Instance Tracking
**First Instance**
- Instance ID: i-07b7f1c56c4dfcc96
- Availability Zone: ap-southeast-1b

**Second Instance**
- Instance ID: i-0d06e12176c631920
- Availability Zone: ap-southeast-1c

## Questions
**1. Why did the group stop at 2 instances?**

- Because the Auto Scaling group's Maximum capacity was explicitly set to 2 in Step 3. Target tracking scaling only adds instances up to that ceiling — even if CPU stays above the 40% target, the ASG won't launch a third instance because the maximum caps it there.

**2. Why did terminating an instance by hand not remove the cost?**

- Because the Auto Scaling group's job is to always maintain the desired capacity. When you terminate an instance manually, the ASG detects that the running instance count has dropped below the desired count and automatically launches a replacement to compensate so you still end up paying for the same number of running instances.

**3. Why is the target value 40 percent and not 90 percent?**

- A lower target leaves headroom for traffic spikes the group scales out before instances get overloaded, keeping response times healthy. A 90% target would mean instances are nearly maxed out before scaling kicks in, risking degraded performance or dropped requests while the new instance boots up.

**4. What did the automatic cutoff protect us from?**

- It protected the class/account from runaway cost and resource usage since scale-in is deliberately slow (about 15 minutes of low, the lab's automatic cutoff ensures the Auto Scaling group doesn't keep running indefinitely if students forget to clean up manually.

**5. What changes when a load balancer sits in front of the group?**
- Without a load balancer, you have to track and open each instance's individual public IP yourself. With one in front of the group, you'd get a single, stable endpoint that automatically distributes incoming traffic across all healthy instances you'd no longer need to know or manage individual instance IPs, and the load balancer would also handle health checks, routing only to instances that are actually healthy.
