require 'playsms/version'
require 'playsms/params'
require 'playsms/errors/error'
require 'playsms/errors/client_error'
require 'playsms/errors/server_error'
require 'playsms/errors/authentication_error'
require 'net/http'
require 'json'

module Playsms
  class Client
    attr_accessor :user, :secret

    def initialize(options = {})
      @user = options.fetch(:key) { ENV.fetch('PLAYSMS_API_USER') }
      @secret = options.fetch(:secret) { ENV.fetch('PLAYSMS_API_SECRET') }
      @host = options.fetch(:host) { 'http://playsms.example.com' }
      @user_agent = "playsms-ruby/#{VERSION} ruby/#{RUBY_VERSION}"
    end

    def send_message(params)
      post(@host, '/index.php?app=ws&op=pv' + Params.encode(params))
    end

    # def get_balance
    #   get(@host, '/account/get-balance')
    # end
    #
    # def update_settings(params)
    #   post(@host, '/account/settings', params)
    # end
    #
    # def get_message(id)
    #   get(@host, '/search/message', id: id)
    # end
    #
    # def get_message_rejections(params)
    #   get(@host, '/search/rejections', params)
    # end
    #
    # def search_messages(params)
    #   get(@host, '/search/messages', Hash === params ? params : {ids: Array(params)})
    # end

    private

    def get(host, request_uri, params = {})
      uri = URI(host + request_uri)
      uri.query = Params.encode(params.merge(u: @user, h: @secret))

      message = Net::HTTP::Get.new(uri.request_uri)

      request(uri, message)
    end

    def post(host, request_uri)
      uri = URI(host + request_uri)

      message = Net::HTTP::Post.new(uri.request_uri)
      # message.form_data = params.merge(u: @user, h: @secret)

      request(uri, message)
    end

    def put(host, request_uri, params)
      uri = URI(host + request_uri)

      message = Net::HTTP::Put.new(uri.request_uri)
      message.form_data = params.merge(u: @user, h: @secret)

      request(uri, message)
    end

    def delete(host, request_uri)
      uri = URI(host + request_uri)
      uri.query = Params.encode(u: @user, h: @secret)

      message = Net::HTTP::Delete.new(uri.request_uri)

      request(uri, message)
    end

    def request(uri, message)
      http = Net::HTTP.new(uri.host, Net::HTTP.https_default_port)
      http.use_ssl = true

      message['User-Agent'] = @user_agent

      http_response = http.request(message)

      case http_response
      when Net::HTTPNoContent
        :no_content
      when Net::HTTPSuccess
        if http_response['Content-Type'].split(';').first == 'application/json'
          JSON.parse(http_response.body)
        else
          http_response.body
        end
      when Net::HTTPUnauthorized
        fail AuthenticationError, "#{http_response.code} response from #{uri.host}"
      when Net::HTTPClientError
        fail ClientError, "#{http_response.code} response from #{uri.host}"
      when Net::HTTPServerError
        fail ServerError, "#{http_response.code} response from #{uri.host}"
      else
        fail Error, "#{http_response.code} response from #{uri.host}"
      end
    end
  end
end
