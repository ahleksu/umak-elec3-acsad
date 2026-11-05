# Screenshot checklist

Save your own screenshots here using the filenames below. Only mark a box after the file exists and clearly shows the stated result.

| Done | Filename | What must be visible | Evidence priority |
|---|---|---|---|
| [x] | `01-security-group.png` | `acsad-g01-web`, HTTP TCP 80, source `0.0.0.0/0` | Supporting |
| [ ] | `02-launch-template.png` | `acsad-g01-lt`, Amazon Linux 2023, `t3.micro`, security group; add a second image for detailed monitoring if needed | Supporting |
| [x] | `03-scaling-policy.png` | Corrected enabled policy, Average CPU target 30%, warmup 60 seconds, successful save; initial capacity 1/1/2 shown separately | Supporting |
| [x] | `03c-asg-created.png` | Creation success, group metrics enabled, `acsad-g01-lt` Latest, and initial capacity 1/1/2; first instance launch still pending in this image | Supporting |
| [x] | `03d-policy-before-correction.png` | Initial policy target 85 and warmup 300 seconds; corrected 30/60 configuration documented in `03-scaling-policy.png` | Configuration before correction |
| [ ] | `04-first-instance.png` | First instance browser page with ID, Availability Zone, and `t3.micro` | Supporting |
| [x] | `04b-repeat-burn.png` | `/burn` response on 54.151.163.46 after policy correction; CPU, current count, alarm, and scale-out still need verification | Repeat-run load request |
| [x] | `05-cloudwatch-alarm.png` | Corrected high-CPU alarm selected, In alarm, CPU >30 condition, group dimension, graph, and state update at 14:25:31 UTC | **Required** |
| [x] | `05d-high-alarm-card.png` | Earlier view showing high-CPU card In alarm while low alarm was selected; clearer required proof is `05-cloudwatch-alarm.png` | Supporting |
| [x] | `05a-alarm-list.png` | Initial run's high-CPU alarm currently OK, last state update, and condition >85; subsequent policy screenshot confirms target 85 | Supporting |
| [x] | `05b-cloudwatch-alarm-history.png` | Historical OK → In alarm transition at 13:53:10 UTC and successful scaling action; current state at capture is OK | Historical alarm evidence |
| [x] | `05c-repeat-low-alarm.png` | Corrected policy's low-CPU alarm currently OK, CPU graph showing a new rise, high-CPU card visible as OK; high-alarm proof pending | Repeat-run supporting evidence |
| [x] | `06-scale-out-activity.png` | This group's Activity history showing the scale-out launch and its result | **Required** |
| [x] | `06b-corrected-scale-out-activity.png` | Corrected high-CPU alarm triggered 1→2 scale-out; new instance i-0a94f341522f9fc8a launched successfully at 10:25–10:26 PM | **Required corrected-run proof** |
| [x] | `06c-activity-after-stop.png` | Step 5 item 8: Activity view after stop and CPU chart, with corrected-run successful scale-out retained | Supporting |
| [x] | `07-two-inservice.png` | Two different instance IDs with lifecycle `InService` in this group | Supporting |
| [x] | `07b-corrected-two-inservice.png` | Corrected run's existing and new instances both InService and Healthy | Supporting |
| [x] | `08-second-instance.png` | Second instance browser page with its different ID and Availability Zone | Supporting |
| [x] | `08a-second-instance-details.png` | Second instance console details with public IP, Running state, group membership, and detailed monitoring | Supporting |
| [x] | `08b-burn-stopped.png` | `/stop` at `47.131.225.190` returning `Burn stopped.` | Supporting |
| [x] | `08c-repeat-load-instance.png` | Existing load instance i-0a84fd102ca571cd1 at 54.151.163.46, zone ap-southeast-1b, burning False | Supporting |
| [x] | `08d-corrected-burn-stopped.png` | Corrected-run `/stop` at 54.151.163.46 returning Burn stopped | Supporting |
| [x] | `08e-existing-instance-refreshed.png` | Refreshed existing instance page with burning False and uptime 2467 seconds | Supporting |
| [x] | `08f-corrected-new-instance.png` | New instance i-0a94f341522f9fc8a at 13.212.78.168, ap-southeast-1a, t3.micro, burning False | Corrected-run item 5 |
| [x] | `09-cpu-chart.png` | CPU graph showing the load increase and, if visible, decrease after `/stop` | Supporting |
| [x] | `09a-group-capacity-metrics.png` | Group metrics enabled and historical desired/InService counts increasing to two; separate from CPU metrics | Supporting |
| [x] | `09b-repeat-monitoring.png` | Group EC2 chart captured during repeat-run follow-up; visible spike is earlier, right edge low | Repeat-run supporting evidence |
| [x] | `09c-corrected-cpu-chart.png` | Step 5 item 7: corrected-run CPU spike near 100%, then around 50%, then near zero following the stop response | Corrected-run CPU evidence |
| [x] | `10-replacement-activity.png` | Successful replacement i-0c068db1206f2746c launched after manual termination of i-0a94f341522f9fc8a | Step 6 proof |
| [x] | `10c-manual-termination.png` | Console confirms termination initiated for i-0a94f341522f9fc8a; Shutting-down state | Step 6 proof |
| [x] | `10d-replacement-inservice.png` | Replacement i-0c068db1206f2746c InService and Healthy, desired capacity 2 | Step 6 proof |
| [x] | `10a-before-manual-replacement.png` | Already terminated initial instance selected; corrected-run new instance Running; manual termination not yet evidenced | State before replacement |
| [x] | `10b-before-manual-replacement-list.png` | Additional Instances list showing corrected-run new instance Running | State before replacement |
| [ ] | `11-cleanup-asg.png` | Search for `acsad-g01-asg` after deletion, showing no matching group | Supporting |
| [x] | `11a-cleanup-asg-deleting.png` | ASG Deleting with desired/minimum/maximum 0/0/0 and one instance still listed; team separately reports final deletion complete | Cleanup in progress at capture |
| [ ] | `12-cleanup-instances.png` | Recorded lab instance IDs in `Terminated` state | Supporting |
| [x] | `13-cleanup-template.png` | Successful delete request banner; acsad-g01-lt absent from displayed template list | Cleanup proof |
| [x] | `14-cleanup-security-group.png` | Banner explicitly confirms acsad-g01-web and its group ID successfully deleted; table still shows stale row at capture | Cleanup proof |

Use additional filenames such as `02b-detailed-monitoring.png` or `03b-capacity.png` when one screenshot cannot show all settings legibly. Keep the resource name or instance ID visible so the screenshot can be matched to the report.

The official required minimum is the Activity History and CloudWatch Alarm screenshots. The supporting images make the instance, replacement, and cleanup observations easier to verify. Capture the alarm while the load is running, before `/stop` and before deleting the group.

Once images exist, embed them in `../submission.md` using paths such as:

```markdown
![Scale-out activity](screenshots/06-scale-out-activity.png)
![Target tracking alarm in ALARM](screenshots/05-cloudwatch-alarm.png)
```
