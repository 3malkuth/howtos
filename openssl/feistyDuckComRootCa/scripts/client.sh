#!/bin/bash

echo "CLIENT: Creating a CLIENT Certificate..."
echo "CLIENT: Creating base files and directory structure..."
mkdir ../client
cd ../client
cp ../configs/client.conf .
mkdir private
chmod 700 private

echo "CLIENT: Creating private key and CSR..."
echo "CLIENT: Test password - ${2}"
openssl req -new \
    -config client.conf \
    -out client.csr \
    -keyout private/client.key

echo "CLIENT: Creating public key..."
echo "CLIENT: Test password - ${2}"
openssl rsa -in private/client.key -pubout -out client-public.key

echo "CLIENT: Creating certificate signed by SUB CA ..."
echo "CLIENT: Sub CA Test password - ${1}"
cd ../sub-ca
openssl ca \
    -config sub-ca.conf \
    -in ../client/client.csr \
    -out ../client/client.crt \
    -extensions client_ext
cd ../client
