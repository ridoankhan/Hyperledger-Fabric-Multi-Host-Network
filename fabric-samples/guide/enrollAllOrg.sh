echo "Enroll Orderer1"

# orderer 1
# preparation
mkdir -p /tmp/hyperledger/org0/orderer/assets/ca 
cp /tmp/hyperledger/org0/ca/admin/msp/cacerts/0-0-0-0-7053.pem /tmp/hyperledger/org0/orderer/assets/ca/org0-ca-cert.pem

mkdir -p /tmp/hyperledger/org0/orderer/assets/tls-ca 
cp /tmp/hyperledger/tls-ca/admin/msp/cacerts/0-0-0-0-7052.pem /tmp/hyperledger/org0/orderer/assets/tls-ca/tls-ca-cert.pem

# for identity
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/org0/orderer
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/org0/orderer/assets/ca/org0-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://orderer1-org0:ordererpw@0.0.0.0:7053
sleep 5

# for TLS
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/org0/orderer/assets/tls-ca/tls-ca-cert.pem

fabric-ca-client enroll -d -u https://orderer1-org0:ordererPW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts orderer1-org0 --csr.hosts localhost
sleep 5

cp /tmp/hyperledger/org0/orderer/tls-msp/keystore/*_sk /tmp/hyperledger/org0/orderer/tls-msp/keystore/key.pem
sleep 10 

# orderer 1 done

echo "Enroll Orderer2"

# orderer 2
# preparation
mkdir -p /tmp/hyperledger/org0/orderer2/assets/ca 
cp /tmp/hyperledger/org0/ca/admin/msp/cacerts/0-0-0-0-7053.pem /tmp/hyperledger/org0/orderer2/assets/ca/org0-ca-cert.pem

mkdir -p /tmp/hyperledger/org0/orderer2/assets/tls-ca 
cp /tmp/hyperledger/tls-ca/admin/msp/cacerts/0-0-0-0-7052.pem /tmp/hyperledger/org0/orderer2/assets/tls-ca/tls-ca-cert.pem

# for identity
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/org0/orderer2
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/org0/orderer2/assets/ca/org0-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://orderer2-org0:orderer2pw@0.0.0.0:7053
sleep 5

# for TLS
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/org0/orderer2/assets/tls-ca/tls-ca-cert.pem

fabric-ca-client enroll -d -u https://orderer2-org0:orderer2PW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts orderer2-org0 --csr.hosts localhost
sleep 5

cp /tmp/hyperledger/org0/orderer2/tls-msp/keystore/*_sk /tmp/hyperledger/org0/orderer2/tls-msp/keystore/key.pem
sleep 10

# orderer 2 done

echo "Enroll Orderer3"

# orderer 3
# preparation
mkdir -p /tmp/hyperledger/org0/orderer3/assets/ca 
cp /tmp/hyperledger/org0/ca/admin/msp/cacerts/0-0-0-0-7053.pem /tmp/hyperledger/org0/orderer3/assets/ca/org0-ca-cert.pem

mkdir -p /tmp/hyperledger/org0/orderer3/assets/tls-ca 
cp /tmp/hyperledger/tls-ca/admin/msp/cacerts/0-0-0-0-7052.pem /tmp/hyperledger/org0/orderer3/assets/tls-ca/tls-ca-cert.pem

# for identity
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/org0/orderer3
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/org0/orderer3/assets/ca/org0-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://orderer3-org0:orderer3pw@0.0.0.0:7053
sleep 5

# for TLS
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/org0/orderer3/assets/tls-ca/tls-ca-cert.pem

fabric-ca-client enroll -d -u https://orderer3-org0:orderer3PW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts orderer3-org0 --csr.hosts localhost
sleep 5

cp /tmp/hyperledger/org0/orderer3/tls-msp/keystore/*_sk /tmp/hyperledger/org0/orderer3/tls-msp/keystore/key.pem
sleep 10

# orderer 3 done

echo "Enroll Orderer4"

# orderer 4
# preparation
mkdir -p /tmp/hyperledger/org0/orderer4/assets/ca 
cp /tmp/hyperledger/org0/ca/admin/msp/cacerts/0-0-0-0-7053.pem /tmp/hyperledger/org0/orderer4/assets/ca/org0-ca-cert.pem

mkdir -p /tmp/hyperledger/org0/orderer4/assets/tls-ca 
cp /tmp/hyperledger/tls-ca/admin/msp/cacerts/0-0-0-0-7052.pem /tmp/hyperledger/org0/orderer4/assets/tls-ca/tls-ca-cert.pem

# for identity
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/org0/orderer4
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/org0/orderer4/assets/ca/org0-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://orderer4-org0:orderer4pw@0.0.0.0:7053
sleep 5

# for TLS
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/org0/orderer4/assets/tls-ca/tls-ca-cert.pem

fabric-ca-client enroll -d -u https://orderer4-org0:orderer4PW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts orderer4-org0 --csr.hosts localhost
sleep 5

cp /tmp/hyperledger/org0/orderer4/tls-msp/keystore/*_sk /tmp/hyperledger/org0/orderer4/tls-msp/keystore/key.pem
sleep 10

# orderer 4 done

echo "Enroll Orderer5"

# orderer 5
# preparation
mkdir -p /tmp/hyperledger/org0/orderer5/assets/ca 
cp /tmp/hyperledger/org0/ca/admin/msp/cacerts/0-0-0-0-7053.pem /tmp/hyperledger/org0/orderer5/assets/ca/org0-ca-cert.pem

mkdir -p /tmp/hyperledger/org0/orderer5/assets/tls-ca 
cp /tmp/hyperledger/tls-ca/admin/msp/cacerts/0-0-0-0-7052.pem /tmp/hyperledger/org0/orderer5/assets/tls-ca/tls-ca-cert.pem

# for identity
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/org0/orderer5
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/org0/orderer5/assets/ca/org0-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://orderer5-org0:orderer5pw@0.0.0.0:7053
sleep 5

# for TLS
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/org0/orderer5/assets/tls-ca/tls-ca-cert.pem

fabric-ca-client enroll -d -u https://orderer5-org0:orderer5PW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts orderer5-org0 --csr.hosts localhost
sleep 5

cp /tmp/hyperledger/org0/orderer5/tls-msp/keystore/*_sk /tmp/hyperledger/org0/orderer5/tls-msp/keystore/key.pem
sleep 10

# orderer 5 done

echo "Enroll Admin"

export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/org0/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/org0/orderer/assets/ca/org0-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://admin-org0:org0adminpw@0.0.0.0:7053

mkdir -p /tmp/hyperledger/org0/orderer/msp/admincerts
cp /tmp/hyperledger/org0/admin/msp/signcerts/cert.pem /tmp/hyperledger/org0/orderer/msp/admincerts/orderer-admin-cert.pem

mkdir -p /tmp/hyperledger/org0/msp/{admincerts,cacerts,tlscacerts,users}
cp /tmp/hyperledger/org0/orderer/assets/ca/org0-ca-cert.pem /tmp/hyperledger/org0/msp/cacerts/
cp /tmp/hyperledger/org0/orderer/assets/tls-ca/tls-ca-cert.pem /tmp/hyperledger/org0/msp/tlscacerts/
cp /tmp/hyperledger/org0/admin/msp/signcerts/cert.pem /tmp/hyperledger/org0/msp/admincerts/admin-org0-cert.pem
cp ./org0-config.yaml /tmp/hyperledger/org0/msp/config.yaml
echo "Org0 done"
sleep 5
echo 
echo "Enroll Peer1"

# preparation
mkdir -p /tmp/hyperledger/org1/peer1/assets/ca 
cp /tmp/hyperledger/org1/ca/admin/msp/cacerts/0-0-0-0-7054.pem /tmp/hyperledger/org1/peer1/assets/ca/org1-ca-cert.pem

mkdir -p /tmp/hyperledger/org1/peer1/assets/tls-ca 
cp /tmp/hyperledger/tls-ca/admin/msp/cacerts/0-0-0-0-7052.pem /tmp/hyperledger/org1/peer1/assets/tls-ca/tls-ca-cert.pem

# for identity
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/org1/peer1
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/org1/peer1/assets/ca/org1-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://peer1-org1:peer1PW@0.0.0.0:7054
sleep 5

# for TLS
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/org1/peer1/assets/tls-ca/tls-ca-cert.pem

fabric-ca-client enroll -d -u https://peer1-org1:peer1PW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts peer1-org1 --csr.hosts localhost
sleep 5

cp /tmp/hyperledger/org1/peer1/tls-msp/keystore/*_sk /tmp/hyperledger/org1/peer1/tls-msp/keystore/key.pem

echo "Enroll Peer2"

# preparation
mkdir -p /tmp/hyperledger/org1/peer2/assets/ca 
cp /tmp/hyperledger/org1/ca/admin/msp/cacerts/0-0-0-0-7054.pem /tmp/hyperledger/org1/peer2/assets/ca/org1-ca-cert.pem

mkdir -p /tmp/hyperledger/org1/peer2/assets/tls-ca 
cp /tmp/hyperledger/tls-ca/admin/msp/cacerts/0-0-0-0-7052.pem /tmp/hyperledger/org1/peer2/assets/tls-ca/tls-ca-cert.pem

# for identity
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/org1/peer2
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/org1/peer2/assets/ca/org1-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://peer2-org1:peer2PW@0.0.0.0:7054
sleep 5

# for TLS
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/org1/peer2/assets/tls-ca/tls-ca-cert.pem

fabric-ca-client enroll -d -u https://peer2-org1:peer2PW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts peer2-org1 --csr.hosts localhost
sleep 5

cp /tmp/hyperledger/org1/peer2/tls-msp/keystore/*_sk /tmp/hyperledger/org1/peer2/tls-msp/keystore/key.pem


echo "Enroll Admin"

export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/org1/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/org1/peer1/assets/ca/org1-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://admin-org1:org1AdminPW@0.0.0.0:7054

mkdir -p /tmp/hyperledger/org1/peer1/msp/admincerts
cp /tmp/hyperledger/org1/admin/msp/signcerts/cert.pem /tmp/hyperledger/org1/peer1/msp/admincerts/org1-admin-cert.pem

mkdir -p /tmp/hyperledger/org1/peer2/msp/admincerts
cp /tmp/hyperledger/org1/admin/msp/signcerts/cert.pem /tmp/hyperledger/org1/peer2/msp/admincerts/org1-admin-cert.pem

mkdir -p /tmp/hyperledger/org1/admin/msp/admincerts
cp /tmp/hyperledger/org1/admin/msp/signcerts/cert.pem /tmp/hyperledger/org1/admin/msp/admincerts/org1-admin-cert.pem

mkdir -p /tmp/hyperledger/org1/msp/{admincerts,cacerts,tlscacerts,users}
cp /tmp/hyperledger/org1/peer1/assets/ca/org1-ca-cert.pem /tmp/hyperledger/org1/msp/cacerts/
cp /tmp/hyperledger/org1/peer1/assets/tls-ca/tls-ca-cert.pem /tmp/hyperledger/org1/msp/tlscacerts/
cp /tmp/hyperledger/org1/admin/msp/signcerts/cert.pem /tmp/hyperledger/org1/msp/admincerts/admin-org1-cert.pem
cp ./org1-config.yaml /tmp/hyperledger/org1/msp/config.yaml
echo "Org1 done"
sleep 5
echo 
echo "Enroll Peer1"

# preparation
mkdir -p /tmp/hyperledger/org2/peer1/assets/ca 
cp /tmp/hyperledger/org2/ca/admin/msp/cacerts/0-0-0-0-7055.pem /tmp/hyperledger/org2/peer1/assets/ca/org2-ca-cert.pem

mkdir -p /tmp/hyperledger/org2/peer1/assets/tls-ca 
cp /tmp/hyperledger/tls-ca/admin/msp/cacerts/0-0-0-0-7052.pem /tmp/hyperledger/org2/peer1/assets/tls-ca/tls-ca-cert.pem

# for identity
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/org2/peer1
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/org2/peer1/assets/ca/org2-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://peer1-org2:peer1PW@0.0.0.0:7055
sleep 5

# for TLS
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/org2/peer1/assets/tls-ca/tls-ca-cert.pem

fabric-ca-client enroll -d -u https://peer1-org2:peer1PW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts peer1-org2 --csr.hosts localhost
sleep 5

cp /tmp/hyperledger/org2/peer1/tls-msp/keystore/*_sk /tmp/hyperledger/org2/peer1/tls-msp/keystore/key.pem

echo "Enroll Peer2"

# preparation
mkdir -p /tmp/hyperledger/org2/peer2/assets/ca 
cp /tmp/hyperledger/org2/ca/admin/msp/cacerts/0-0-0-0-7055.pem /tmp/hyperledger/org2/peer2/assets/ca/org2-ca-cert.pem

mkdir -p /tmp/hyperledger/org2/peer2/assets/tls-ca 
cp /tmp/hyperledger/tls-ca/admin/msp/cacerts/0-0-0-0-7052.pem /tmp/hyperledger/org2/peer2/assets/tls-ca/tls-ca-cert.pem

# for identity
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/org2/peer2
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/org2/peer2/assets/ca/org2-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://peer2-org2:peer2PW@0.0.0.0:7055
sleep 5

# for TLS
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/org2/peer2/assets/tls-ca/tls-ca-cert.pem

fabric-ca-client enroll -d -u https://peer2-org2:peer2PW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts peer2-org2 --csr.hosts localhost
sleep 5

cp /tmp/hyperledger/org2/peer2/tls-msp/keystore/*_sk /tmp/hyperledger/org2/peer2/tls-msp/keystore/key.pem


echo "Enroll Admin"

export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/org2/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/org2/peer1/assets/ca/org2-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://admin-org2:org2AdminPW@0.0.0.0:7055

mkdir -p /tmp/hyperledger/org2/peer1/msp/admincerts
cp /tmp/hyperledger/org2/admin/msp/signcerts/cert.pem /tmp/hyperledger/org2/peer1/msp/admincerts/org2-admin-cert.pem

mkdir -p /tmp/hyperledger/org2/peer2/msp/admincerts
cp /tmp/hyperledger/org2/admin/msp/signcerts/cert.pem /tmp/hyperledger/org2/peer2/msp/admincerts/org2-admin-cert.pem

mkdir -p /tmp/hyperledger/org2/admin/msp/admincerts
cp /tmp/hyperledger/org2/admin/msp/signcerts/cert.pem /tmp/hyperledger/org2/admin/msp/admincerts/org2-admin-cert.pem

mkdir -p /tmp/hyperledger/org2/msp/{admincerts,cacerts,tlscacerts,users}
cp /tmp/hyperledger/org2/peer1/assets/ca/org2-ca-cert.pem /tmp/hyperledger/org2/msp/cacerts/
cp /tmp/hyperledger/org2/peer1/assets/tls-ca/tls-ca-cert.pem /tmp/hyperledger/org2/msp/tlscacerts/
cp /tmp/hyperledger/org2/admin/msp/signcerts/cert.pem /tmp/hyperledger/org2/msp/admincerts/admin-org2-cert.pem
cp ./org2-config.yaml /tmp/hyperledger/org2/msp/config.yaml
echo "Org2 done"
