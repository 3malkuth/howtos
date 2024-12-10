#!/bin/bash

echo "ROOT CA: Creating a ROOT CA..."
echo "ROOT CA: Creating base files and directory structure..."
mkdir ../root-ca
cd ../root-ca
cp ../configs/root-ca.conf .
mkdir certs db private
chmod 700 private
touch db/index
openssl rand -hex 16  > db/serial
echo 1001 > db/crlnumber

echo "ROOT CA: Creating private key and CSR..."
echo "ROOT CA: Test password - ${1}"
openssl req -new \
    -config root-ca.conf \
    -out root-ca.csr \
    -keyout private/root-ca.key

echo "ROOT CA: Creating public key..."
echo "ROOT CA: Test password - ${1}"
openssl rsa -in private/root-ca.key -pubout -out root-ca-public.key

echo "ROOT CA: Creating self signed certificate of ROOT CA CSR..."
echo "ROOT CA: Test password - ${1}"
openssl ca -selfsign \
    -config root-ca.conf \
    -in root-ca.csr \
    -out root-ca.crt \
    -extensions ca_ext
