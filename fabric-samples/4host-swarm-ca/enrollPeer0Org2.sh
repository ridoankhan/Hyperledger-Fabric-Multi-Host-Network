echo "Enroll peer0.org2.example.com"

# preparation
mkdir -p ${PWD}/crypto-config/peerOrganizations/org2.example.com/peer0.org2.example.com/assets/ca 
cp ${PWD}/crypto-config/peerOrganizations/org2.example.com/ca/admin/msp/cacerts/0-0-0-0-7055.pem ${PWD}/crypto-config/peerOrganizations/org2.example.com/peer0.org2.example.com/assets/ca/org1-ca-cert.pem

mkdir -p ${PWD}/crypto-config/peerOrganizations/org2.example.com/peer0.org2.example.com/assets/tls-ca 
cp ${PWD}/crypto-config/tls-ca/admin/msp/cacerts/0-0-0-0-7052.pem ${PWD}/crypto-config/peerOrganizations/org2.example.com/peer0.org2.example.com/assets/tls-ca/tls-ca-cert.pem

# for identity
export FABRIC_CA_CLIENT_HOME=${PWD}/crypto-config/peerOrganizations/org2.example.com/peer0.org2.example.com
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/crypto-config/peerOrganizations/org2.example.com/peer0.org2.example.com/assets/ca/org1-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://peer0.org2.example.com:peer1PW@0.0.0.0:7055
sleep 5

# for TLS
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/crypto-config/peerOrganizations/org2.example.com/peer0.org2.example.com/assets/tls-ca/tls-ca-cert.pem

fabric-ca-client enroll -d -u https://peer0.org2.example.com:peer1PW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts peer0.org2.example.com --csr.hosts localhost
sleep 5

cp ${PWD}/crypto-config/peerOrganizations/org2.example.com/peer0.org2.example.com/tls-msp/keystore/*_sk ${PWD}/crypto-config/peerOrganizations/org2.example.com/peer0.org2.example.com/tls-msp/keystore/key.pem