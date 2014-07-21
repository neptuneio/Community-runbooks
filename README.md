Runbooks
========

A runbook is a list of diagnostic or resolution steps for an on-call engineer to execute to resolve an IT alert.

You can find different categories of alerts under runbooks directory above.

runbooks --> host-level-alerts
runbooks --> application-alerts
runbooks --> db-alerts
runbooks --> network-alerts

Explore them ; You can also contribute your own runbook into community-runbooks directory. Please see step 4, under How to user, to know how to contribute.

Sample Use cases
================

When process is hung, take a thread-dump and restart process
When memory utilization exceeds 95%,capture process-level diagnostics
When disk utilization reaches 85%, archive log files
When an alert comes, send a set of runbook steps to the on-call engineer
When EC2 instance is idle for 2 hrs, stop the instance to save costs

In general you will be able to execute any generic shell script, when an alert comes. Its powerful, Try it out, and tell us more use cases and contribute to the community.

How to use
==========

1) You can download a runbook of your choice for a particular use-case and link it to the alert/webhook trigger on Neptune.io platform (www.neptune.io/browse-templates)

2) You can use runbook links from github as part of the alert message so that an engineer know what steps to execute when an IT alert comes

3) You can always fork a runbook, and create a pull request

4) In general if you want to contribute a runbook of your own, please fork and write a runbook in community-runbooks directory, confirming to a sample runbook given. Please create a pull request. Then we will review and add your runbook for everyone to use.

5) Please contact team@neptune.io for any suggestions or thoughts.
