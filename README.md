Playsms Client Library for Ruby
=============================

Borrowed heavily from Nexmo Ruby Library: https://github.com/Nexmo/nexmo-ruby

[![Gem Version](https://badge.fury.io/rb/playsms.svg)](https://badge.fury.io/rb/playsms) [![Build Status](https://api.travis-ci.org/Playsms/playsms-ruby.svg?branch=master)](https://travis-ci.org/Playsms/playsms-ruby)

This is the Ruby client library for PlaySMS's API. To use it you'll
need a PlaySMS system setup.

* [Installation](#installation)
* [Usage](#usage)
* [SMS API](#sms-api)
* [Coverage](#api-coverage)
* [License](#license)

Installation
------------

To install the Ruby client library using Rubygems:

    gem install playsms

Alternatively you can clone the repository:

    git clone git@github.com:WIU/playsms-ruby.git


Usage
-----

Begin by requiring the playsms library:

```ruby
require 'playsms'
```

Then construct a client object with your user and secret:

```ruby
client = Playsms::Client.new(user: 'YOUR-API-USER', secret: 'YOUR-API-SECRET')
```

For production you can specify the `PLAYSMS_API_USER` and `PLAYSMS_API_SECRET`
environment variables instead of specifying the key and secret explicitly.

## SMS API

### Send a text message

```ruby
response = client.send_message(to: 'YOUR NUMBER', msg: 'Hello world')

if response['messages'][0]['status'] == '0'
  puts "Sent message #{response['messages'][0]['message-id']}"
else
  puts "Error: #{response['messages'][0]['error-text']}"
end
```

Docs: [https://github.com/antonraharja/playSMS/blob/master/documents/development/WEBSERVICES.md](https://github.com/antonraharja/playSMS/blob/master/documents/development/WEBSERVICES.md)

API Coverage
------------

* Messaging
    * [X] Send
    * [ ] Delivery Receipt
    * [ ] Inbound Messages
    * [ ] Search
        * [ ] Message
        * [ ] Messages
        * [ ] Rejections


License
-------

This library is released under the [MIT License][license]

[license]: LICENSE.txt
