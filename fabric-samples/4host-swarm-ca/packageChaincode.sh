
docker exec cli peer lifecycle chaincode package aidDistribution.tar.gz --path ../../../chaincode/aid_distribution/javascript/ --lang node --label aidDistribution_1

# install on peer0 org1
docker exec -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peer0.org1.example.com/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem cli peer lifecycle chaincode install aidDistribution.tar.gz
# output : aidDistribution_1:57ee60c8197e03c9ab9d452fa32054b165bcbbdb73a284d7f0e4530bf1b7bfc9


# peer1.org1
docker exec -e CORE_PEER_ADDRESS=peer1.org1.example.com:8051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peer1.org1.example.com/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem cli peer lifecycle chaincode install aidDistribution.tar.gz
# output: aidDistribution_1:57ee60c8197e03c9ab9d452fa32054b165bcbbdb73a284d7f0e4530bf1b7bfc9

# peer0.org2
docker exec -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/admin/msp -e CORE_PEER_ADDRESS=peer0.org2.example.com:9051 -e CORE_PEER_LOCALMSPID="Org2MSP" -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peer0.org2.example.com/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem cli peer lifecycle chaincode install aidDistribution.tar.gz
# output: aidDistribution_1:57ee60c8197e03c9ab9d452fa32054b165bcbbdb73a284d7f0e4530bf1b7bfc9

# peer1.org2
docker exec -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/admin/msp -e CORE_PEER_ADDRESS=peer1.org2.example.com:10051 -e CORE_PEER_LOCALMSPID="Org2MSP" -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peer1.org2.example.com/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem cli peer lifecycle chaincode install aidDistribution.tar.gz
# output: aidDistribution_1:57ee60c8197e03c9ab9d452fa32054b165bcbbdb73a284d7f0e4530bf1b7bfc9


############## approve chaincode in both orgs ##############

# for org1
docker exec -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peer0.org1.example.com/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem cli peer lifecycle chaincode approveformyorg --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderer/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem --channelID mychannel --name aidDistribution --version 1 --sequence 1 --waitForEvent --package-id aidDistribution_1:57ee60c8197e03c9ab9d452fa32054b165bcbbdb73a284d7f0e4530bf1b7bfc9


# for org2
docker exec -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/admin/msp -e CORE_PEER_ADDRESS=peer0.org2.example.com:9051 -e CORE_PEER_LOCALMSPID="Org2MSP" -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peer0.org2.example.com/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem cli peer lifecycle chaincode approveformyorg --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderer/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem --channelID mychannel --name aidDistribution --version 1 --sequence 1 --waitForEvent --package-id aidDistribution_1:57ee60c8197e03c9ab9d452fa32054b165bcbbdb73a284d7f0e4530bf1b7bfc9


############## check approval status #############

docker exec -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peer0.org1.example.com/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem cli peer lifecycle chaincode checkcommitreadiness --channelID mychannel --name aidDistribution --version 1 --sequence 1

############### Commit chaincode ##############

docker exec -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peer0.org1.example.com/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem cli peer lifecycle chaincode commit -o orderer.example.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderer/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem --peerAddresses peer0.org1.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peer0.org1.example.com/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem --peerAddresses peer0.org2.example.com:9051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peer0.org2.example.com/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem --channelID mychannel --name aidDistribution --version 1 --sequence 1

##################### check commit status #####################

docker exec -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peer0.org1.example.com/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem cli peer lifecycle chaincode querycommitted --channelID mychannel --name aidDistribution

############### Invoke InitLedger ##################
docker exec -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peer0.org1.example.com/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem cli peer chaincode invoke -o orderer3.example.com:9050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderer3/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem -C mychannel -n aidDistribution --peerAddresses peer0.org1.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peer0.org1.example.com/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem --peerAddresses peer0.org2.example.com:9051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peer0.org2.example.com/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem -c '{"Args":["initLedger"]}'

################# Query Chaincode ####################
docker exec -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peer0.org1.example.com/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem cli peer chaincode query -n aidDistribution -C mychannel -c '{"Args":["queryAid","AID0"]}'

docker exec -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peer0.org1.example.com/tls-msp/tlscacerts/tls-0-0-0-0-7052.pem cli peer chaincode query -n aidDistribution -C mychannel -c '{"Args":["queryAllAids"]}'
