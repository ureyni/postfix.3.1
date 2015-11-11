echo $@>>/var/log/deliver.log
#exit 0
cat >/var/log/abc
COUNTER=1
for argument in $@
do
  if [ $COUNTER -gt 2 ]
  then
    /usr/sbin/sendmail.postfix -i -G -f $2 $argument
    echo "/usr/sbin/sendmail.postfix -i -G -f $2 $argument">>/var/log/deliver.log
  fi 
  COUNTER=$[$COUNTER +1]
  echo $argument"..$COUNTER \n"$2>>/var/log/deliver.log
done
#/usr/sbin/sendmail.postfix -i -G $@</var/log/abc
#echo $?>>/var/log/deliver.log
