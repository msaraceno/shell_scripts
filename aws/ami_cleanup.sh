#!/bin/sh
# works with script ami-cleanup.sh
AMIID=ami-to-delete.txt
amis=$(cat $AMIID)
for ami in $amis
do
#removes return at end of each line
ami=$ami|tr -d '\r'
#echo $ami
aws ec2 deregister-image --image-id $ami
done
SnapshotIDs="snapshot-to-delete.txt"
snapshots=$(cat $SnapshotIDs)
for snapshot in $snapshots
do
snapshot=$shanpshot|tr -d '\r'
aws ec2 delete-snapshot --snapshot-id $snapshot
#echo $snapshot
done