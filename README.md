# Sendblue

This is a client library for the [SendBlue](https://sendblue.co/) message service.  

[SendBlue](https://sendblue.co/) allows you to send iMessages programmatically.  The messages received show up blue as if they were sent from an iPhone.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sendblue'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sendblue

## Usage

```
# Look up your API key/secret 
#  https://sendblue.co/account

client   = Sendblue::Sendblue.new(<key>, <secret>)

message  = client.send_message(<phone number>, <message>)
status   = client.message_status(message.message_handle)
```

## Running the Tests
```                        
rspec spec/sendblue_spec.rb
```