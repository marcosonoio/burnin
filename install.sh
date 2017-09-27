#!/usr/bin/env bash

if [ "${EUID}" -ne 0 ]; then
  echo "This script must be run as root!" 1>&2
  exit 1
fi

install -m 755 etc/udev/rules.d/* /etc/udev/rulse.d/
install -m 755 etc/systemd/system/* /etc/systemd/system/
install -m 755 usr/local/bin/* /usr/local/bin/

if [ ! -f /etc/burnin ]; then
  read -r -p 'set directory path to save report:\n' config
  echo "${config}" > /etc/burnin
fi
config=$(cat /etc/burnin)
echo "the path to save the report is:\n${config}"
read -rsp $'Press enter to continue...\n'
exit
