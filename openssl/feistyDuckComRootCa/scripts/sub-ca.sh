#!/bin/bash

echo "SUB CA: Creating a SUB CA..."
echo "SUB CA: Creating base files and directory structure..."
mkdir ../sub-ca
cd ../sub-ca
cp ../configs/sub-ca.conf .
mkdir certs db private
chmod 700 private
touch db/index
openssl rand -hex 16  > db/serial
echo 1001 > db/crlnumber

echo "SUB CA: Creating private key and CSR..."
echo "SUB CA: Test password - ${2}"
openssl req -new \
    -config sub-ca.conf \
    -out sub-ca.csr \
    -keyout private/sub-ca.key

echo "SUB CA: Creating public key..."
echo "SUB CA: Test password - ${2}"
openssl rsa -in private/sub-ca.key -pubout -out sub-ca-public.key

echo "SUB CA: Creating certificate signed by ROOT CA ..."
echo "SUB CA: ROOT CA Test password - ${1}"
cd ../root-ca
openssl ca \
    -config root-ca.conf \
    -in ../sub-ca/sub-ca.csr \
    -out ../sub-ca/sub-ca.crt \
    -extensions sub_ca_ext
cd ../sub-ca
