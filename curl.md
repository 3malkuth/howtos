# Curl

## Notes
* By default curl works as all unix commands
 * Output goes to STDOUT

## Install
* Ubuntu
```
sudo apt-get install curl
```

## Debug
```
# Starting point for getting more info on curl and server interop
curl --verbose "http://example.com/"

# Powerful in depth logging
# Shows all info curls sends and receives
curl --trace-ascii debugdump.txt "http://www.example.com/"
curl --trace debugdump.txt "http://www.example.com/"

# Logging with timing
curl --trace-ascii d.txt --trace-time "http://example.com/"

# Use another IP Address for a domain instead of the DNS resolved one
curl --resolve www.example.org:80:127.0.0.1 "http://www.example.org/"
```

## Proxy
* Use a proxy
```
curl --proxy "http://proxy.example.org:4321 "http://remote.example.org/"
```

## Authentication
* HTTP Simple
```
curl "http://user:password@example.org/"
# OR
curl -u user:password "http://example.org/"
```
* Digest
  * With Json
```
cat file.json | curl --digest --user username:Passwd -X POST -H "Content-Type:text/json" -d @- "http://localhost:8088/path" --verbose; echo -e "n"
```

## GET
```
# Default behaviour
# Pulls entire webpage and returns to STDOUT
curl 

# Include the HTTP headers
curl -i "https://curl.haxx.se/"
curl --include "https://curl.haxx.se/"
```

## POST
* Post with json
```
curl -X POST -H "Content-Type:text/json" -d '{some json...}' "http://localhost/app"
# Or place the json in a text file and do the following...
cat file.json | curl -X POST -H "Content-Type:text/json" -d @- "http://localhost/app" --verbose; echo -e "\n"
```

* Post with gzipped data
```
gzip < file | curl -X POST -H "Content-Encoding:gzip"   -H "Content-Type:application/octet-stream" --data-binary @- "http://some.domain.com/app" --verbose; echo -e "\n"

```
## HEAD
```
# Ask remote server only for HTTP Headers
curl -I "https://curl.haxx.se/"
curl --head "https://curl.haxx.se/"
```

## Send Protobuf Serialized Message
* Assume the Messages are in a messages.pb file in binary format
```
cat messages.pb | curl -X POST --data-binary @- "http://example.com/session?blah=blah"
```
## Redirect response
* Pipe
* -o or -O # to redirect elsewhere

## Redirect response to a browser
```
curl "https://google.com" | firefox "data:text/html;base64,$(base64 -w 0 <&0)"
curl "https://google.com" | google-chrome "data:text/html;base64,$(base64 -w 0 <&0)"
```

## Format Output that is in JSON
```
curl ... | python -m json.tool
curl ... | ppjson
```

## References
* https://ec.haxx.se/
* https://curl.haxx.se/docs/httpscripting.html#Background
* http://www.yilmazhuseyin.com/blog/dev/curl-tutorial-examples-usage/
* https://gist.github.com/joyrexus/85bf6b02979d8a7b0308
