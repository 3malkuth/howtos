# OpenSSL
## Configuration
* man config
* man ca
* Ubuntu
  * /etc/ssl/openssl.cnf
* Other
  * /etc/openssl.cnf
## Create Keys
* https://www.feistyduck.com/library/openssl-cookbook/online/ch-openssl.html#openssl-key-generation
```
# Create 2048-bit RSA private key
$ openssl genrsa -aes128 -out fd.key 2048

# Create Public RSA key from private key
$ openssl rsa -in fd.key -pubout -out fd-public.key

# Create DSA private key
$ openssl dsaparam -genkey 2048 | openssl dsa -out dsa.key -aes128 # nice as don't leave temp files on disk

# Create 256-bit ECDSA private key using the secp256r1 named curve
$ openssl ecparam -genkey -name secp256r1 | openssl ec -out ec.key -aes128
# Note: most browsers only support: secp384r1, secp256r1
```
## Create CSR (Certificate Signing Request)
* https://www.feistyduck.com/library/openssl-cookbook/online/ch-openssl.html#openssl-creating-csrs
  * This is a formal request asking a CA to sign a certificate,
    * and it contains the public key of the entity requesting the certificate
    * and some information about the entity.
    * This data will all be part of the certificate.
    * A CSR is always signed with the private key corresponding to the public key it carries
```
# Create CSR
$ openssl req -new -key fd.key -out fd.csr
# Notes:
## Do not leave a field blank. If you want it blank, put in a single dot
## Can use this to sign your own certificate or send to a CA

# Check that it was created correctly
$ openssl req -text -in fd.csr -noout
```
## Renew certificate without changing any of its info
* https://www.feistyduck.com/library/openssl-cookbook/online/ch-openssl.html#creating-csrs-from-existing-certificates
```
$ openssl x509 -x509toreq -in fd.crt -out fd.csr -signkey fd.key
# Note: Unless you’re using some form of public key pinning and wish to continue using the existing key, it’s best practice to generate a new key every time you apply for a new certificate
```

## CSR Generation with a file
```
## file contents: fd.cnf###################################
[req]
prompt = no
distinguished_name = dn
req_extensions = ext
input_password = PASSPHRASE

[dn]
CN = www.feistyduck.com
emailAddress = webmaster@feistyduck.com
O = Feisty Duck Ltd
L = London
C = GB

[ext]
subjectAltName = DNS:www.feistyduck.com,DNS:feistyduck.com
# NOTE: Other extensions can be found at: /etc/ssl/openssl.cnf
#       A standard one is the v3_ca

############################################################

$ openssl req -new -config fd.cnf -key fd.key -out fd.csr
```

## Certificate generation (signing)
* https://www.feistyduck.com/library/openssl-cookbook/online/ch-openssl.html#signing-your-own-certificates
```
$ openssl x509 -req -days 365 -in fd.csr -signkey fd.key -out fd.crt
```

## One liner to create private key and certificate
```
$ openssl req -new -x509 -days 365 -keyout fd.key -out fd.crt -config fd.cnf
$ openssl req -new -x509 -days 3650 -extensions v3_ca \ 
-keyout private/cakey.pem -out cacert.pem \
-config /etc/ssl/openssl.cnf
# http://www.freebsdmadeeasy.com/tutorials/freebsd/create-a-ca-with-openssl.php
```

## Verify
```
# Cetificate
$ openssl x509 -text -noout -in fd.crt
# Public Key
$ openssl rsa -inform PEM -pubin -in fd-public.key -noout # RSA specific
$ openssl pkey -inform PEM -pubin -in fd-public.key -noout # General public key

```

## Create a Root CA
* https://www.feistyduck.com/library/openssl-cookbook/online/ch-openssl.html#creating-a-root-ca
* Setup directory structue for CA
```
# Make a home for all CA files
$ mkdir root-ca
$ cd root-ca
$ mkdir certs db private 
# NOTE: 
## certs holds all copies of certificates we issue
## private holds private key for CA
## db is used for the certificate database (index)
$ chmod 700 private # Never allow viewable or modifible by anyone else on the system
$ touch db/index
$ openssl rand -hex 16  > db/serial
$ echo 1001 > db/crlnumber     
```
* Create root CA config file
 * Filename: root-ca.conf
```
[default]
name                    = root-ca
domain_suffix           = example.com
aia_url                 = http://$name.$domain_suffix/$name.crt
crl_url                 = http://$name.$domain_suffix/$name.crl
ocsp_url                = http://ocsp.$name.$domain_suffix:9080
default_ca              = ca_default
name_opt                = utf8,esc_ctrl,multiline,lname,align

[ca_dn]
countryName             = "GB"
organizationName        = "Example"
commonName              = "Root CA"

[ca_default]
home                    = .
database                = $home/db/index
serial                  = $home/db/serial
crlnumber               = $home/db/crlnumber
certificate             = $home/$name.crt
private_key             = $home/private/$name.key
RANDFILE                = $home/private/random
new_certs_dir           = $home/certs
unique_subject          = no
copy_extensions         = none
default_days            = 3650
default_crl_days        = 365
default_md              = sha256
policy                  = policy_c_o_match

[policy_c_o_match]
countryName             = match
stateOrProvinceName     = optional
organizationName        = match
organizationalUnitName  = optional
commonName              = supplied
emailAddress            = optional

[req]
default_bits            = 4096
encrypt_key             = yes
default_md              = sha256
utf8                    = yes
string_mask             = utf8only
prompt                  = no
distinguished_name      = ca_dn
req_extensions          = ca_ext

[ca_ext]
basicConstraints        = critical,CA:true
keyUsage                = critical,keyCertSign,cRLSign
subjectKeyIdentifier    = hash

[sub_ca_ext]
authorityInfoAccess     = @issuer_info
authorityKeyIdentifier  = keyid:always
basicConstraints        = critical,CA:true,pathlen:0
crlDistributionPoints   = @crl_info
extendedKeyUsage        = clientAuth,serverAuth
keyUsage                = critical,keyCertSign,cRLSign
nameConstraints         = @name_constraints
subjectKeyIdentifier    = hash

[crl_info]
URI.0                   = $crl_url

[issuer_info]
caIssuers;URI.0         = $aia_url
OCSP;URI.0              = $ocsp_url

[name_constraints]
permitted;DNS.0=example.com
permitted;DNS.1=example.org
excluded;IP.0=0.0.0.0/0.0.0.0
excluded;IP.1=0:0:0:0:0:0:0:0/0:0:0:0:0:0:0:0

[ocsp_ext]
authorityKeyIdentifier  = keyid:always
basicConstraints        = critical,CA:false
extendedKeyUsage        = OCSPSigning
noCheck                 = yes
keyUsage                = critical,digitalSignature
subjectKeyIdentifier    = hash
```
* root ca generation
```
# Generate key and CSR
$ openssl req -new -config root-ca.conf -out root-ca.csr -keyout private/root-ca.key

# Create self signed certificate
$ openssl ca -selfsign -config root-ca.conf -in root-ca.csr -out root-ca.crt -extensions ca_ext
> y
> y
```
* Check certificate has been added to the db (plain text file)
  * db/index

## Create the Intermediate CA
* Setup intermediate directory structure and base files
```
$ cd root-ca
$ mkdir intermediate
$ cd intermediate
$ mkdir certs db private 
# NOTE: 
## certs holds all copies of certificates we issue
## private holds private key for CA
## db is used for the certificate database (index)
$ chmod 700 private # Never allow viewable or modifible by anyone else on the system
$ touch db/index
$ openssl rand -hex 16  > db/serial
$ echo 1001 > db/crlnumber
```

```
# Please refer to: https://www.feistyduck.com/library/openssl-cookbook/online/ch-openssl.html#root-ca-configuration
                   https://jamielinux.com/docs/openssl-certificate-authority/create-the-intermediate-pair.html
[default]
name                    = intermediate-ca
domain_suffix           = valtech.de
aia_url                 = http://$name.$domain_suffix/$name.crt
crl_url                 = http://$name.$domain_suffix/$name.crl	
ocsp_url                = http://ocsp.$name.$domain_suffix:9080
default_ca              = ca_default
name_opt                = utf8,esc_ctrl,multiline,lname,align

[ca_dn]
countryName             = "DE"
organizationName        = "Valtech GmbH"
commonName              = "Intermediate CA"

[ca_default]
home                    = .
database                = $home/db/index
serial                  = $home/db/serial
crlnumber               = $home/db/crlnumber
certificate             = $home/$name.crt
private_key             = $home/private/$name-private.pem
RANDFILE                = $home/private/random
new_certs_dir           = $home/certs
unique_subject          = no
copy_extensions         = none
default_days            = 1000
default_crl_days        = 365
default_md              = sha256
policy                  = policy_loose

[policy_c_o_match]
countryName             = match
stateOrProvinceName     = optional
organizationName        = match
organizationalUnitName  = optional
commonName              = supplied
emailAddress            = optional

[ policy_loose ]
# Allow the intermediate CA to sign a more diverse range of certificates.
# See the POLICY FORMAT section of the `ca` man page.
countryName             = optional
stateOrProvinceName     = optional
localityName            = optional
organizationName        = optional
organizationalUnitName  = optional
commonName              = supplied
emailAddress            = optional

[req]
default_bits            = 4096
encrypt_key             = yes
default_md              = sha256
utf8                    = yes
string_mask             = utf8only
prompt                  = no
distinguished_name      = ca_dn
req_extensions          = ca_ext

[ca_ext]
basicConstraints        = critical,CA:true
keyUsage                = critical,keyCertSign,cRLSign
subjectKeyIdentifier    = hash

[sub_ca_ext]
authorityInfoAccess     = @issuer_info
authorityKeyIdentifier  = keyid:always
basicConstraints        = critical,CA:true,pathlen:0
crlDistributionPoints   = @crl_info
extendedKeyUsage        = clientAuth,serverAuth
keyUsage                = critical,keyCertSign,cRLSign
nameConstraints         = @name_constraints
subjectKeyIdentifier    = hash

[crl_info]
URI.0                   = $crl_url

[issuer_info]
caIssuers;URI.0         = $aia_url
OCSP;URI.0              = $ocsp_url

[name_constraints]
permitted;DNS.0=valtech.com
permitted;DNS.1=valtech.de
permitted;DNS.2=valtech.org
excluded;IP.0=0.0.0.0/0.0.0.0
excluded;IP.1=0:0:0:0:0:0:0:0/0:0:0:0:0:0:0:0

[ocsp_ext]
authorityKeyIdentifier  = keyid:always
basicConstraints        = critical,CA:false
extendedKeyUsage        = OCSPSigning
noCheck                 = yes
keyUsage                = critical,digitalSignature
subjectKeyIdentifier    = hash
```




## References
* https://www.feistyduck.com/library/openssl-cookbook/
* https://en.wikipedia.org/wiki/RSA_(cryptosystem)
* https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm
* https://en.wikipedia.org/wiki/Transport_Layer_Security
* http://shop.oreilly.com/product/9780596002701.do
  * Network Security with OpenSSL Cryptography for Secure Communications
* https://www.phildev.net/ssl/creating_ca.html
* https://jamielinux.com/docs/openssl-certificate-authority/index.html
