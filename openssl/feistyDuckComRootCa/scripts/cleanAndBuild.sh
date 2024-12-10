#!/bin/bash

ROOT_CA_TEST_PRIV_PASS="rootCaTestPass"
SUB_CA_TEST_PRIV_PASS="subCaTestPass"
SERVER_TEST_PRIV_PASS="serverTestPass"
CLIENT_TEST_PRIV_PASS="clientTestPass"

rm -rf ../root-ca ../sub-ca ../server ../client
./root-ca.sh ${ROOT_CA_TEST_PRIV_PASS}
./sub-ca.sh ${ROOT_CA_TEST_PRIV_PASS} ${SUB_CA_TEST_PRIV_PASS} 
./server.sh ${SUB_CA_TEST_PRIV_PASS} ${SERVER_TEST_PRIV_PASS} 
./client.sh ${SUB_CA_TEST_PRIV_PASS} ${CLIENT_TEST_PRIV_PASS} 
