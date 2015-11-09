echo $@>>/opt/myprojects/postfix-3.1-20151011/deliver.log
cat >/var/log/abc
/usr/sbin/sendmail.postfix $@</var/log/abc
echo $?>>/opt/myprojects/postfix-3.1-20151011/deliver.log
