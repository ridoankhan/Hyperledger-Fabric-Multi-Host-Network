echo "Enroll Admin"

export FABRIC_CA_CLIENT_HOME=${PWD}/crypto-config/peerOrganizations/org2.example.com/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/crypto-config/peerOrganizations/org2.example.com/peer0.org2.example.com/assets/ca/org1-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://admin-org2:org2AdminPW@0.0.0.0:7055

mkdir -p ${PWD}/crypto-config/peerOrganizations/org2.example.com/peer0.org2.example.com/msp/admincerts
cp ${PWD}/crypto-config/peerOrganizations/org2.example.com/admin/msp/signcerts/cert.pem ${PWD}/crypto-config/peerOrganizations/org2.example.com/peer0.org2.example.com/msp/admincerts/org1-admin-cert.pem

mkdir -p ${PWD}/crypto-config/peerOrganizations/org2.example.com/peer1.org2.example.com/msp/admincerts
cp ${PWD}/crypto-config/peerOrganizations/org2.example.com/admin/msp/signcerts/cert.pem ${PWD}/crypto-config/peerOrganizations/org2.example.com/peer1.org2.example.com/msp/admincerts/org1-admin-cert.pem

mkdir -p ${PWD}/crypto-config/peerOrganizations/org2.example.com/admin/msp/admincerts
cp ${PWD}/crypto-config/peerOrganizations/org2.example.com/admin/msp/signcerts/cert.pem ${PWD}/crypto-config/peerOrganizations/org2.example.com/admin/msp/admincerts/org1-admin-cert.pem

mkdir -p ${PWD}/crypto-config/peerOrganizations/org2.example.com/msp/admincerts
mkdir -p ${PWD}/crypto-config/peerOrganizations/org2.example.com/msp/cacerts
mkdir -p ${PWD}/crypto-config/peerOrganizations/org2.example.com/msp/tlscacerts
mkdir -p ${PWD}/crypto-config/peerOrganizations/org2.example.com/msp/users
cp ${PWD}/crypto-config/peerOrganizations/org2.example.com/peer0.org2.example.com/assets/ca/org1-ca-cert.pem ${PWD}/crypto-config/peerOrganizations/org2.example.com/msp/cacerts/
cp ${PWD}/crypto-config/peerOrganizations/org2.example.com/peer0.org2.example.com/assets/tls-ca/tls-ca-cert.pem ${PWD}/crypto-config/peerOrganizations/org2.example.com/msp/tlscacerts/
cp ${PWD}/crypto-config/peerOrganizations/org2.example.com/admin/msp/signcerts/cert.pem ${PWD}/crypto-config/peerOrganizations/org2.example.com/msp/admincerts/admin-org2-cert.pem
cp ./org1-config.yaml ${PWD}/crypto-config/peerOrganizations/org2.example.com/msp/config.yaml
echo "Org2 done"