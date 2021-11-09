#!/bin/sh
#This will find ami's using the name value and output the ami's and corresponding snapshot ID's to text files
# works with script find_ami_snapshot.sh
AMIID="$(aws ec2 describe-images --region us-east-1 --filters Name=name,Values=adselfservice-* --query 'Images[*].ImageId' --output text)"
for ami in $AMIID
do
echo $ami >> ami-to-delete.txt
done
Snapshots="$(aws ec2 describe-images --region us-east-1 --image-ids $AMIID --query 'Images[*].BlockDeviceMappings[*].Ebs.SnapshotId' --output text)"
for snapshot in $Snapshots
do 
echo $snapshot >> snapshot-to-delete.txt
done