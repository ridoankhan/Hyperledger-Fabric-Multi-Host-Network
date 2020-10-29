echo "Enroll Admin"

export FABRIC_CA_CLIENT_HOME=${PWD}/crypto-config/ordererOrganizations/example.com/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/crypto-config/ordererOrganizations/example.com/orderer/assets/ca/org0-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://admin-org0:org0adminpw@0.0.0.0:7053

mkdir -p ${PWD}/crypto-config/ordererOrganizations/example.com/orderer/msp/admincerts
cp ${PWD}/crypto-config/ordererOrganizations/example.com/admin/msp/signcerts/cert.pem ${PWD}/crypto-config/ordererOrganizations/example.com/orderer/msp/admincerts/orderer-admin-cert.pem

mkdir -p ${PWD}/crypto-config/ordererOrganizations/example.com/msp/admincerts
mkdir -p ${PWD}/crypto-config/ordererOrganizations/example.com/msp/cacerts
mkdir -p ${PWD}/crypto-config/ordererOrganizations/example.com/msp/tlscacerts
mkdir -p ${PWD}/crypto-config/ordererOrganizations/example.com/msp/users
cp ${PWD}/crypto-config/ordererOrganizations/example.com/orderer/assets/ca/org0-ca-cert.pem ${PWD}/crypto-config/ordererOrganizations/example.com/msp/cacerts/
cp ${PWD}/crypto-config/ordererOrganizations/example.com/orderer/assets/tls-ca/tls-ca-cert.pem ${PWD}/crypto-config/ordererOrganizations/example.com/msp/tlscacerts/
cp ${PWD}/crypto-config/ordererOrganizations/example.com/admin/msp/signcerts/cert.pem ${PWD}/crypto-config/ordererOrganizations/example.com/msp/admincerts/admin-org0-cert.pem
cp ./org0-config.yaml ${PWD}/crypto-config/ordererOrganizations/example.com/msp/config.yaml
echo "Org0 done"
sleep 5