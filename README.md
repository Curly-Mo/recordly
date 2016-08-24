# Recordly
Input and store your record collection.  

Live at: http://recordly.cfahy.com


[![Build Status](https://travis-ci.org/Curly-Mo/recordly.svg?branch=master)](https://travis-ci.org/Curly-Mo/recordly) 
[![Coverage Status](https://coveralls.io/repos/github/Curly-Mo/recordly/badge.svg?branch=master)](https://coveralls.io/github/Curly-Mo/recordly?branch=master)


## Installation
```
git clone https://github.com/Curly-Mo/recordly.git
cd recordly
bundle install
```


## Setup Database
```
psql -c 'create database recordly_development' -U postgres
```


## Run locally
```
rails server Puma
```

## Testing
```
RAILS_ENV=test bundle exec rake db:migrate --trace
RAILS_ENV=test bundle exec rake db:test:prepare
rails test
```
