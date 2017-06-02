#!/bin/bash
export USERAGENT="Simple Bash No-IP Updater"
export USUARIO=xxxxxxxxxx
export PASSWORD='aaaaaaQo='
export arqLog=/var/log/updateIpVictor.log

atualizaIP(){
	if [ -n "${remoteIp}" ]; then
		echo "Atualizando ip para o HOST ${HOST}..." >> "${arqLog}"
	        echo $(date "+[%d/%m/%Y - %H:%M:%S] -") $(curl -s --user-agent "${USERAGENT}" "https://${USUARIO}:$(echo ${PASSWORD}|base64 -di)@dynupdate.no-ip.com/nic/update?hostname=${HOST}&myip=${remoteIp}") >> "${arqLog}"
	else
	        echo $(date "+[%d/%m/%Y - %H:%M:%S] -") "IP nao localizado... Erro no processo para o host ${HOST}" >> "${arqLog}"
	fi
}
export cameraHost=asdasdsadsad.nwsvr.com
export HOST=aaaaaaaa.ddns.net
export remoteIp=$(curl -sI "${cameraHost}" | fgrep Location | cut -d':' -f3 | sed 's?/??g'| egrep '^(([0-9]{1,2}|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.){3}([0-9]{1,2}|1[0-9][0-9]|2[0-4][0-9]|25[0-5])$')
atualizaIP
export HOST=bbbbbbbbb.ddns.net
export remoteIp=$(upnpc -l | fgrep ExternalIPAddress | awk '{ print $3 }' | egrep '^(([0-9]{1,2}|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.){3}([0-9]{1,2}|1[0-9][0-9]|2[0-4][0-9]|25[0-5])$')
atualizaIP
