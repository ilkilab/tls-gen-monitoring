#!/bin/sh
if kubectl get secret -n monitoring | grep -q 'tls-monitoring'; then
  echo "#################################################"
  echo "# TLS Secret for Monitoring is already present! #"
  echo "#################################################"
else
  echo "#######################################################"
  echo "# TLS Secret for Monitoring Not Found ! Creating it...#"
  echo "#######################################################"
  openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /var/tls-monitoring/key.pem -out /var/tls-monitoring/crt.pem -subj "/CN=IKEmonitoring"
  kubectl create secret tls tls-monitoring --cert=/var/tls-monitoring/crt.pem --key=/var/tls-monitoring/key.pem -n monitoring
fi
