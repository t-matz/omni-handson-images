FROM alpine:latest

RUN apk --no-cache add tshark

RUN mkdir /pcap
WORKDIR /pcap

ENTRYPOINT [ "/usr/bin/tshark" ]
CMD [ "-h" ]
