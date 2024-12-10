#!/bin/bash

echo "SERVER: Creating a SERVER Certificate..."
echo "SERVER: Creating base files and directory structure..."
mkdir ../server
cd ../server
cp ../configs/server.conf .
mkdir private
chmod 700 private

echo "SERVER: Creating private key and CSR..."
echo "SERVER: Test password - ${2}"
openssl req -new \
    -config server.conf \
    -out server.csr \
    -keyout private/server.key

echo "SERVER: Creating public key..."
echo "SERVER: Test password - ${2}"
openssl rsa -in private/server.key -pubout -out server-public.key

echo "SERVER: Creating certificate signed by SUB CA ..."
echo "SERVER: Sub CA Test password - ${1}"
cd ../sub-ca
openssl ca \
    -config sub-ca.conf \
    -in ../server/server.csr \
    -out ../server/server.crt \
    -extensions server_ext

cd ../server
