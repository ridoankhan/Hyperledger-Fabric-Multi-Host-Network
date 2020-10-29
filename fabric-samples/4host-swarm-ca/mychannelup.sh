
docker exec cli peer channel create -o orderer.example.com:7050 -c mychannel -f ./channel-artifacts/channel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderer/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem 

# export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/crypto/peerOrganizations/org1.example.com/peer0.org1.example.com/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem

docker exec -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peer0.org1.example.com/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem cli peer channel join -b mychannel.block

docker exec -e CORE_PEER_ADDRESS=peer1.org1.example.com:8051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peer1.org1.example.com/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem cli peer channel join -b mychannel.block

docker exec -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/admin/msp -e CORE_PEER_ADDRESS=peer0.org2.example.com:9051 -e CORE_PEER_LOCALMSPID="Org2MSP" -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peer0.org2.example.com/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem cli peer channel join -b mychannel.block

docker exec -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/admin/msp -e CORE_PEER_ADDRESS=peer1.org2.example.com:10051 -e CORE_PEER_LOCALMSPID="Org2MSP" -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peer1.org2.example.com/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem cli peer channel join -b mychannel.block

docker exec cli peer channel update -o orderer.example.com:7050 -c mychannel -f ./channel-artifacts/org1MSPanchors.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderer/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem

docker exec -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/admin/msp -e CORE_PEER_ADDRESS=peer0.org2.example.com:9051 -e CORE_PEER_LOCALMSPID="Org2MSP" -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peer0.org2.example.com/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem cli peer channel update -o orderer.example.com:7050 -c mychannel -f ./channel-artifacts/org2MSPanchors.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderer/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem
