echo "Enroll Admin"

export FABRIC_CA_CLIENT_HOME=${PWD}/crypto-config/peerOrganizations/org1.example.com/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/crypto-config/peerOrganizations/org1.example.com/peer0.org1.example.com/assets/ca/org1-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://admin-org1:org1AdminPW@0.0.0.0:7054

mkdir -p ${PWD}/crypto-config/peerOrganizations/org1.example.com/peer0.org1.example.com/msp/admincerts
cp ${PWD}/crypto-config/peerOrganizations/org1.example.com/admin/msp/signcerts/cert.pem ${PWD}/crypto-config/peerOrganizations/org1.example.com/peer0.org1.example.com/msp/admincerts/org1-admin-cert.pem

mkdir -p ${PWD}/crypto-config/peerOrganizations/org1.example.com/peer1.org1.example.com/msp/admincerts
cp ${PWD}/crypto-config/peerOrganizations/org1.example.com/admin/msp/signcerts/cert.pem ${PWD}/crypto-config/peerOrganizations/org1.example.com/peer1.org1.example.com/msp/admincerts/org1-admin-cert.pem

mkdir -p ${PWD}/crypto-config/peerOrganizations/org1.example.com/admin/msp/admincerts
cp ${PWD}/crypto-config/peerOrganizations/org1.example.com/admin/msp/signcerts/cert.pem ${PWD}/crypto-config/peerOrganizations/org1.example.com/admin/msp/admincerts/org1-admin-cert.pem

mkdir -p ${PWD}/crypto-config/peerOrganizations/org1.example.com/msp/admincerts
mkdir -p ${PWD}/crypto-config/peerOrganizations/org1.example.com/msp/cacerts
mkdir -p ${PWD}/crypto-config/peerOrganizations/org1.example.com/msp/tlscacerts
mkdir -p ${PWD}/crypto-config/peerOrganizations/org1.example.com/msp/users
cp ${PWD}/crypto-config/peerOrganizations/org1.example.com/peer0.org1.example.com/assets/ca/org1-ca-cert.pem ${PWD}/crypto-config/peerOrganizations/org1.example.com/msp/cacerts/
cp ${PWD}/crypto-config/peerOrganizations/org1.example.com/peer0.org1.example.com/assets/tls-ca/tls-ca-cert.pem ${PWD}/crypto-config/peerOrganizations/org1.example.com/msp/tlscacerts/
cp ${PWD}/crypto-config/peerOrganizations/org1.example.com/admin/msp/signcerts/cert.pem ${PWD}/crypto-config/peerOrganizations/org1.example.com/msp/admincerts/admin-org1-cert.pem
cp ./org1-config.yaml ${PWD}/crypto-config/peerOrganizations/org1.example.com/msp/config.yaml
echo "Org1 done"