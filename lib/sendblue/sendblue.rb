require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'ostruct'

module Sendblue
  class Sendblue
    attr_reader :key, :secret

    def initialize(key, secret)
      @key = key
      @secret = secret
    end

    def send_message(phone_number, content)
      response = request("https://api.sendblue.co/api/send-message", method: :Post,
                          params: {number: phone_number, content: content})

      return OpenStruct.new(JSON.parse(response.read_body))
    end

    def message_status(message_handle)
      response = request("https://api.sendblue.co/api/status?handle=#{message_handle}")
      body     = response.read_body

      raise "Invalid message handle" if body =~ /invalid/i

      return OpenStruct.new(JSON.parse(body))
    end

    def request(url, method: :Get, params: {})
      url  = URI(url)

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      klass = Object.const_get("Net::HTTP::#{method}")
      request = klass.new(url)

      request["sb-api-key-id"] = @key
      request["sb-api-secret-key"] = @secret
      
      request["content-type"] = 'application/json'
      request["accept"] = 'application/json'

      request.body = params.to_json unless params.empty?

      http.request(request)
    end
  end
end