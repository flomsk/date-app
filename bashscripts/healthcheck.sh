#!/bin/bash
#=======================================================#
#set -x
# Check if our webserver is online
URL=$(aws elbv2 describe-load-balancers --query 'LoadBalancers[?LoadBalancerName==`engage-elb`].DNSName' --output text) #OUR ROOT URL
URL=http://$URL
response_code=$(curl -w "%{http_code}\n" -s -o /dev/null "${URL}") #Getting HTTP Response code
if [ "$response_code" -eq "200" ]; then
  echo "Webserver is online"
else
  echo "Webserver is down"
fi
#=======================================================#
# Check is our time synced
URL_NOW=$URL/now #Our NOW location
client_time=$(date +"%H:%M:%S") #Getting client date
client_seconds=`date --date="$client_time" +%s` #Format to epoch
server_time=$(curl -sS ${URL_NOW} | awk '{print $3 " " $4}') #Getting server date
server_seconds=`date --date="$server_time" +%s` #Format to epoch
if [ "$client_seconds" -eq "$server_seconds" ]; then
  echo "Time is synced"
else
  echo "Time is not synced"
fi
