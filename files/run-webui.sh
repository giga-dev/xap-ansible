#!/bin/sh -x

export LOOKUPLOCATORS=`sed s/,$// locators.txt`
export JAVA_HOME="${XAP_HOME}/../java"
export PATH="${JAVA_HOME}/bin:${PATH}"
export NIC_ADDR="#${interface_name}:ip#"
export EXT_JAVA_OPTIONS="${EXT_JAVA_OPTIONS} -Dcom.sun.jini.reggie.initialUnicastDiscoveryPort=${lus_port} -Dcom.gs.multicast.discoveryPort=${lus_port} -Dcom.gs.multicast.enabled=false -Dcom.gs.transport_protocol.lrmi.bind-port=$lrmi_comm_min_port-$lrmi_comm_max_port -Dcom.gigaspaces.start.httpPort=${gs_http_port} -Dcom.gigaspaces.system.registryPort=${gs_registry_port}"
export WEBUI_PORT=${webui_port}

nohup sh ${XAP_HOME}/bin/gs-webui.sh