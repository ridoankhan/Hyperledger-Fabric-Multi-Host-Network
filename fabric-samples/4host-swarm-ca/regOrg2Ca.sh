echo "Working on RCA-ORG2"

export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/crypto-config/peerOrganizations/org2.example.com/ca/crypto/ca-cert.pem
export FABRIC_CA_CLIENT_HOME=${PWD}/crypto-config/peerOrganizations/org2.example.com/ca/admin

fabric-ca-client enroll -d -u https://rca-org2-admin:rca-org2-adminpw@0.0.0.0:7055
sleep 5

fabric-ca-client register -d --id.name peer0.org2.example.com --id.secret peer1PW --id.type peer -u https://0.0.0.0:7055
fabric-ca-client register -d --id.name peer1.org2.example.com --id.secret peer2PW --id.type peer -u https://0.0.0.0:7055
fabric-ca-client register -d --id.name admin-org2 --id.secret org2AdminPW --id.type admin --id.attrs "abac.init=true:ecert" -u https://0.0.0.0:7055
fabric-ca-client register -d --id.name user-org2 --id.secret org2UserPW --id.type user -u https://0.0.0.0:7055

echo "All CA and registration done"

