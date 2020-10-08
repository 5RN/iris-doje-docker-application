ARG IMAGE=intersystemsdc/iris-community:2020.3.0.200.0-zpm
FROM $IMAGE

USER root

# prepare durability
RUN	mkdir -p /external/data && \
	chown -R ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /external && \
	chmod -R g+w /external

WORKDIR /opt/doje
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/doje
USER ${ISC_PACKAGE_MGRUSER}

COPY  Installer.cls .
COPY  src /usr/irissys/mgr/src
#COPY  ../front-end/dist/doje-public-ui/ /usr/irissys/csp/doje/
COPY iris.script /tmp/iris.script

# run iris and initial 
RUN iris start $ISC_PACKAGE_INSTANCENAME \
	&& iris session $ISC_PACKAGE_INSTANCENAME < /tmp/iris.script \
	&& iris stop $ISC_PACKAGE_INSTANCENAME quietly
