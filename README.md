# postfix.3.1

changed qmgr service.
add new parameters in main.cf
parameter name is multipli_domain_enable and type is bool and default value is false.
if multipli_domain_enable value yes so bool type true,
    qmgr service send to mail content_filter service via to one deamon for all recipient domains.

if multipli_domain_enable value no or not defined it so bool type false,
    qmgr service send to mail content_filter service via to multipli deamon for each recipient domains.

sample
    delivery.sh bash file use for content_filter pipe service 
    delivery.sh
    echo $@>>/opt/deliver.log
    cat >/var/log/abc
    /usr/sbin/sendmail.postfix $@</var/log/abc
    echo $?>>/opt/deliver.log
    master.cf 
    smtp       inet  n       -       n       -       -       smtpd
      -o content_filter=cfilt:
    cfilt      unix  -       n       n       -       -       pipe
        flags=Rq user=vmail:vmail argv=/opt/deliver.sh  -f ${sender}  ${original_recipient}
    main.cf
    multipli_domain_enable=yes
test One ...
telnet localhost 25
mail from:hasan.ucak@e-imza.com.tr
250 2.1.0 Ok
rcpt to:ucak_hasan@yahoo.com
250 2.1.5 Ok
rcpt to:ucak_hasan@hotmail.com
250 2.1.5 Ok
data
354 End data with <CR><LF>.<CR><LF>
bla bla bla
.

tail -f delivery.log
-f hasan.ucak@e-imza.com.tr ucak_hasan@hotmail.com ucak_hasan@yahoo.com
0

test Two ...
    multipli_domain_enable=no ...or not defined

tail -f delivery.log
-f hasan.ucak@e-imza.com.tr ucak_hasan@hotmail.com
-f hasan.ucak@e-imza.com.tr ucak_hasan@yahoo.com
0
0