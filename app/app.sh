#!/bin/bash

source bin/boss.sh

get '/' && {
	header 'Content-Type' 'text/html'
	cat www/index.html
}

get '/api/say/:word/to/:name' && {
	echo Say $word to $name
}

get '/api/redirect' && {
	status 302
	header 'Location' 'https://github.com/'
}

get '/api/env' && { printenv; }

post '/api/*' && {
	echo $QUERY_STRING | sed 's/&/\n/g'
	echo $REQUEST_BODY | sed 's/&/\n/g'
}
