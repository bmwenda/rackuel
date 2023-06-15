# rackuel
A simple demonstration of rack

## About
Rack is a modular ruby web server interface, i.e it is an (API) interface between web servers and web applications. An application written in ruby needs to be rack compliant to be hosted in the web. Thus, frameworks like Rails, Sinatra etc are rack compliant.

## Characteristics
A rack app has an object that responds to a `call` method that takes environment as an argument. The environment describes information like:
- HTTP request method
- redirect url
- rack version
- an object to report errors

It returns a response with the following parameters:
1. HTTP status code
2. Response header
3. Response body with data

A app rack also makes it possible to add middleware between the web server and application.

## Implementation
This project is a simple MVC like app. It is aware of 2 paths - `/` and `/joke`. For the root path, it serves a welcome page and for the joke path, it returns a random joke. Any other path will return a 404 page.
Typically, the entry point for a rack app is `config.ru` and this is places at the root folder.
