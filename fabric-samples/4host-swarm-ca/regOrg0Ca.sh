echo "Working on RCA-ORG0"

export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/crypto-config/ordererOrganizations/example.com/ca/crypto/ca-cert.pem
export FABRIC_CA_CLIENT_HOME=${PWD}/crypto-config/ordererOrganizations/example.com/ca/admin

fabric-ca-client enroll -d -u https://rca-org0-admin:rca-org0-adminpw@0.0.0.0:7053
sleep 5

fabric-ca-client register -d --id.name orderer.example.com --id.secret ordererpw --id.type orderer -u https://0.0.0.0:7053
fabric-ca-client register -d --id.name orderer2.example.com --id.secret orderer2pw --id.type orderer -u https://0.0.0.0:7053
fabric-ca-client register -d --id.name orderer3.example.com --id.secret orderer3pw --id.type orderer -u https://0.0.0.0:7053
fabric-ca-client register -d --id.name orderer4.example.com --id.secret orderer4pw --id.type orderer -u https://0.0.0.0:7053
fabric-ca-client register -d --id.name orderer5.example.com --id.secret orderer5pw --id.type orderer -u https://0.0.0.0:7053
fabric-ca-client register -d --id.name admin-org0 --id.secret org0adminpw --id.type admin --id.attrs "hf.Registrar.Roles=client,hf.Registrar.Attributes=*,hf.Revoker=true,hf.GenCRL=true,admin=true:ecert,abac.init=true:ecert" -u https://0.0.0.0:7053
sleep 10