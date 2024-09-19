FROM quay.io/centos/centos:stream8
WORKDIR /workspace
COPY workload.sh /workspace
RUN ["chmod", "777", "workload.sh"]
RUN ["/bin/bash", "-c", "./workload.sh"]
CMD ["sleep", "30d"]