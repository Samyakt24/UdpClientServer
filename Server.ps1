function serverBroadcast()
{
while(1){
$GetIp=(Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias Ethernet).IPAddress[1]
 $Broadcast = ([System.Net.IPAddress]::Broadcast)
$UdpClient = New-Object Net.Sockets.UdpClient
 $IPEndPoint = New-Object Net.IPEndPoint $Broadcast, 9022
$Packet =[text.encoding]::ascii.getbytes("$GetIp","secrets")
$connection=$UdpClient.Send($Packet, $Packet.Length,$IPEndPoint)
write-host "$connection"
$UdpClient.Close()
}
}
