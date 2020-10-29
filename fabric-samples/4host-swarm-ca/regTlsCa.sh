echo "Working on TLS-CA"

export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/crypto-config/tls-ca/crypto/tls-cert.pem
export FABRIC_CA_CLIENT_HOME=${PWD}/crypto-config/tls-ca/admin

fabric-ca-client enroll -d -u https://tls-ca-admin:tls-ca-adminpw@0.0.0.0:7052
sleep 5

fabric-ca-client register -d --id.name peer0.org1.example.com --id.secret peer1PW --id.type peer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name peer1.org1.example.com --id.secret peer2PW --id.type peer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name peer0.org2.example.com --id.secret peer1PW --id.type peer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name peer1.org2.example.com --id.secret peer2PW --id.type peer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name orderer.example.com --id.secret ordererPW --id.type orderer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name orderer2.example.com --id.secret orderer2PW --id.type orderer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name orderer3.example.com --id.secret orderer3PW --id.type orderer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name orderer4.example.com --id.secret orderer4PW --id.type orderer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name orderer5.example.com --id.secret orderer5PW --id.type orderer -u https://0.0.0.0:7052
sleep 10