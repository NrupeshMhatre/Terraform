#/bin/bash

aws --profile bizongo-prod route53 list-resource-record-sets 
--hosted-zone-id Z2HUZEGTB0OKNO --query "ResourceRecordSets[?Type == 'A']" 
| grep Name | sed 's/^.*: //' | sed 's/,$//' | sed 's/.$//' | sed 's/^"//' 
| sed 's/.$//' | sort | uniq  > 
/var/lib/jenkins/workspace/ssl-certi/example.txt
SLACK="https://hooks.slack.com/services/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"
file="/var/lib/jenkins/workspace/ssl-certi/example.txt"
n=1
MAX_DAY=10
MIN_DAY=7


CERTIFICATE=$(mktemp)
while read line; do

echo "line no $n : $line"
echo -n | openssl s_client -servername "${line}" -connect "${line}":443 
2>/dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > 
$CERTIFICATE
date=$(openssl x509 -in $CERTIFICATE -enddate -noout | sed 
"s/.*=\(.*\)/\1/")
date_s=$(date -d "${date}" +%s)
now_s=$(date -d now +%s)
date_diff=$(( (date_s - now_s) / 86400 ))
echo "$line will expire in $date_diff days"
#curl -X POST --data-urlencode "payload={\"channel\": \"#testingssl\", 
\"username\": \"webhookbot\", \"text\": \"SSL Certificate of $line will 
expire in $date_diff days..\", \"icon_emoji\": \":ghost:\"}"$

if [ $date_diff -lt $MAX_DAY ] || [ $date_diff -eq $MAX_DAY ]; 
then 
   curl -X POST --data-urlencode "payload={\"channel\": \"#testingssl\", 
\"username\": \"webhookbot\", \"text\": \"SSL Certificate of $line will 
expire in $date_diff days..\", \"icon_emoji\": \":fire:\"}"  $SLACK
   #curl -X POST --data-urlencode "payload={\"channel\": \"#testingssl\", 
\"username\": \"webhookbot\", \"text\": \"SSL Certificate of $line will 
expire in $date_diff days..\", \"icon_emoji\": \":ghost:\"}"  $SLACK

fi 


if [ $date_diff -lt $MIN_DAY ] || [ $date_diff -eq $MIN_DAY ];
then 
   curl -X POST --data-urlencode "payload={\"channel\": \"#testingssl\", 
\"username\": \"webhookbot\", \"text\": \"SSL Certificate of $line will 
expire in $date_diff days..\", \"icon_emoji\": \":fire:\"}"  $SLACK
   #curl -X POST --data-urlencode "payload={\"channel\": \"#testingssl\", 
\"username\": \"webhookbot\", \"text\": \"SSL Certificate of $line will 
expire in $date_diff days..\", \"icon_emoji\": \":fire:\"}"  $SLACK

fi
 
n=$((n+1))
done < $file
