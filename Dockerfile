FROM alpine:3.13.1
RUN apk update && apk add openssl
RUN mkdir -p /var/tls-monitoring/
RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.20.2/bin/linux/amd64/kubectl
RUN chmod +x kubectl
RUN mv kubectl /usr/bin/
COPY generate-tls-secret.sh /opt/generate-tls-secret.sh
RUN chmod +x /opt/generate-tls-secret.sh
CMD ./opt/generate-tls-secret.sh
