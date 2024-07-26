ARG BUILD_FROM
FROM $BUILD_FROM
MAINTAINER christian.clark@gmail.com

# Install requirements for add-on
RUN apk add --no-cache python3 py3-pip py3-pyserial py3-paho-mqtt

# Run script
COPY run.sh btmon3.py ecm1240.cfg /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
