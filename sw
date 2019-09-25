enable
clock set 10:32:10 25 sep 2019
configure terminal
hostname SW-01
banner motd "acesso apenas para pessoas autorizadas"
enable secret CasaArryn
service password-encryption
ip domain-name grupo4.local
crypto key generate rsa general-keys modulus 1024
username FabricioGomes privilege 15 secret Gomes
username AlexFaria  privilege 15 secret Faria
username ThomazRissi privilege 15 secret Rissi
line console 0
password ConsoleArryn
login
exit
line vty 0 15
transport input ssh
exec-timeout 9
login local
exit
vlan 10
name rh
exit
vlan 20
name voz
exit
vlan 30
name ti
exit
interface f0/5
switchport mode access
switchport access vlan 10
exit
interface f0/10
switchport mode access
switchport access vlan 20
exit
interface f0/15
switchport mode access
switchport access vlan 30
exit
interface g0/1
switchport mode trunk
switchport trunk native vlan 99
switchport trunk allowed vlan 10,20,30
no shutdown
exit
interface vlan 100
ip address 192.168.4.254 255.255.255.0
description interface de gerenciamento
exit
default gateway 192.168.4.177
do wr
