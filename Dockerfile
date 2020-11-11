FROM cp.icr.io/cp/icp4i/ace/ibm-ace-mqclient-server-prod:11.0.0.8-r1-amd64
COPY datasources.json /home/aceuser/ace-server/config/connectors/loopback
COPY CheckInFlows*.bar /home/aceuser/initial-config/bars/
# COPY cacert.pem /home/aceuser/ssl/
USER aceuser
RUN source /opt/ibm/ace-11/server/bin/mqsiprofile \
    && cd $MQSI_WORKPATH/node_modules \
    && npm install  loopback-connector-mongodb
