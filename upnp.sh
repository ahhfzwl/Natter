#!/bin/sh
protocol="$1"; private_ip="$2"; private_port="$3"; b="$6"
curl -s -X POST "http://192.168.1.1:52869/upnp/control/WANIPConn1" \
     -H "Content-Type: text/xml; charset=utf-8" \
     -H "SOAPAction: \"urn:schemas-upnp-org:service:WANIPConnection:1#AddPortMapping\"" \
     -d "<?xml version=\"1.0\"?>
<s:Envelope xmlns:s=\"http://schemas.xmlsoap.org/soap/envelope/\" s:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\">
  <s:Body>
    <u:AddPortMapping xmlns:u=\"urn:schemas-upnp-org:service:WANIPConnection:1\">
      <NewRemoteHost></NewRemoteHost>
      <NewInternalClient>${private_ip}</NewInternalClient>
      <NewInternalPort>${private_port}</NewInternalPort>
      <NewExternalPort>${b}</NewExternalPort>
      <NewProtocol>$(echo "$protocol" | tr 'a-z' 'A-Z')</NewProtocol>
      <NewEnabled>1</NewEnabled>
      <NewPortMappingDescription>Natter-UPnP</NewPortMappingDescription>
      <NewLeaseDuration>0</NewLeaseDuration>
    </u:AddPortMapping>
  </s:Body>
</s:Envelope>"
