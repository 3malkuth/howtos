## Setup
### Ubunut 16.04 LTS
* Download LPR and CUPS driver from:
  * http://support.brother.com/g/b/downloadlist.aspx?c=eu_ot&lang=en&prod=mfcl8650cdw_eu_cn&os=128#SelectLanguageType-559_0_1
  * In the above case I had pre-selected linux and the printer from:
    * http://support.brother.com/g/b/productsearch.aspx?c=eu_ot&lang=en&content=dl
```
sudo dpkg -i --force-all mfcl8650cdwlpr-1.1.2-1.i386.deb
sudo dpkg -i --force-all mfcl8650cdwcupswrapper-1.1.3-1.i386.deb
sudo dpkg  -l  |  grep  Brother # to check it was installed
```
* Navigate to:
  * http://localhost:631/printers/
  * Click on the printer you wish to configure
    * Click on Maintenance and Modify Printer
      * Username and password are your linux u/p
      * Choose the first option in discovered netwrok printers and save
      * Print...

## References
* https://sites.google.com/site/easylinuxtipsproject/15
