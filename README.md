Runbooks
========

A runbook is a list of diagnostic or remediation steps for an on-call engineer to execute to resolve an IT alert.

Explore different categories of alerts under "runbooks" directory above.

host-level-alerts
application-alerts
db-alerts
network-alerts

If you have interesting alert use-cases and runbooks, please send in a pull request

Sample Use cases
================

* When process is hung, take a thread-dump and restart process
* When memory utilization exceeds 95%,capture process-level diagnostics
* When disk utilization reaches 85%, archive log files
* When an alert comes, send a set of runbook steps to the on-call engineer
* When EC2 instance is idle for 2 hrs, stop the instance to save costs


How to use
==========

1. Sign up with Neptune.io

2. While creating a rule, click the dropdown list in the runbook section. Search for a runbook using keywords (e.g : disk, memory etc.). You can select a runbook and then edit it to customize it your environment.

5. Please contact support@neptune.io for any suggestions or thoughts.
