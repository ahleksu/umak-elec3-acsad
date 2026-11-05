# Lab 2 Submission

## Instance Tracking
**First Instance**
- Instance ID: I-0989e23f5483704fc
- Availability Zone: ap-southeast-1A

**Second Instance**
- Instance ID: i-08e67d72153f93f44
- Availability Zone: ap-southeast-1b

## Proof (Screenshots)
1. **Activity History:** Add a screenshot showing the Auto Scaling group's Activity history when the second instance launched.
   
   <img width="762" height="393" alt="activity_history" src="https://github.com/user-attachments/assets/e821c21f-c6df-4e1b-b7e9-7352ccb24b23" />

2. **CloudWatch Alarm:** Add a screenshot of the target tracking alarm in the "In alarm" state.

   <img width="757" height="390" alt="cloudwatch" src="https://github.com/user-attachments/assets/3d43a61c-94ae-4c84-8a66-0b2953567af1" />
   <img width="759" height="385" alt="cloudwatch 2" src="https://github.com/user-attachments/assets/cfb5e5e1-8f83-4040-b296-e0fb8e3b37df" />


## Questions
1. Why did the group stop at 2 instances?

   The group stopped at 2 instances because the maximum number of instances was set to 2. Once it reached that limit, Auto Scaling could no longer add another instance.
2. Why did terminating an instance by hand not remove the cost?

   Terminating an instance manually did not completely remove the cost because the Auto Scaling Group automatically created a replacement instance to maintain the required number of instances. The new instance can still use AWS resources and generate costs.
3. Why is the target value set to your assigned value (e.g., 30-85 percent) instead of 99 percent?

   The target value is set to the assigned percentage so the system can respond before the instance becomes overloaded. If it was set to 99%, the CPU would have to become almost fully utilized before Auto Scaling would take action.
4. What did the automatic cutoff protect us from?

   The automatic cutoff protected us from having too many instances running at the same time. It also helped prevent unnecessary AWS usage and unexpected costs if the system kept trying to scale up.
5. What changes when a load balancer sits in front of the group?

   When a load balancer is placed in front of the group, it distributes the incoming traffic between the available instances. This helps prevent one instance from receiving all the traffic and allows the workload to be shared among the instances.
