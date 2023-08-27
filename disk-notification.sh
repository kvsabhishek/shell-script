SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$(date +%F-%Hh-%Mm-%Ss).log

R="\e[31m"
N="\e[0m"
G="\e[32m]"

DISK_USAGE=$(df -hT | grep -vE "tmpfs|Filesystem")
DISK_USAGE_THRESHOLD=1

while IFS= read line
do 
    echo $line
done <<< $DISK_USAGE