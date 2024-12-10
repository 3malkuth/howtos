# Netcat

# Man-in-the-Middle Debugging
* Setup and start netcat to listen on localhost port 12345
```
nc -l -p 12345 
```
* Open up a browser and navigate to http://localhost:12345
* You should see an http GET request in the netcat window
* Copy the request and change the "Host" to example.com:80
```
GET / HTTP/1.1
Host: example.com:80
User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36
Upgrade-Insecure-Requests: 1
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8
```
* Start another netcat listener
```
nc example.com 80
```
* Copy the http GET from above
  * Paste it into the the first netcat session and the browser will update
     * This is because it awaits a response from the netcat session
