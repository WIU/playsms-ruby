require 'spec_helper'

describe 'Playsms::Client' do
  before do
    @user = 'user_xxx'
    @secret = 'secret_xxx'
    @base_url = 'http://playsms.example.com'
    @response_body = { body: '{"key":"value"}', headers: { 'Content-Type' => 'application/json;charset=utf-8' } }
    @response_object = { 'key' => 'value' }
    @client = Playsms::Client.new(key: @user, secret: @secret)
  end

  # describe 'send_message method' do
  #   it 'posts to the sms resource and returns the response object' do
  #     expect_post "#{@base_url}/index.php?app=ws&op=pv&u=#{@user}&h=#{@secret}&to=number&msg=Hey!"
  #
  #     @client.send_message(to: 'number', msg: 'Hey!').must_equal(@response_object)
  #   end
  # end
  #
  # it 'raises an authentication error exception if the response code is 401' do
  #   stub_request(:get, /#{@base_url}/).to_return(status: 401)
  #
  #   proc { @client.send_message(to: 'number', msg: 'Hey!') }.must_raise(Playsms::AuthenticationError)
  # end
  #
  # it 'raises a client error exception if the response code is 4xx' do
  #   stub_request(:get, /#{@base_url}/).to_return(status: 400)
  #
  #   proc { @client.send_message(to: 'number', msg: 'Hey!') }.must_raise(Playsms::ClientError)
  # end
  #
  # it 'raises a server error exception if the response code is 5xx' do
  #   stub_request(:get, /#{@base_url}/).to_return(status: 500)
  #
  #   proc { @client.send_message(to: 'number', msg: 'Hey!') }.must_raise(Playsms::ServerError)
  # end
  #
  # it 'includes a user-agent header with the library version number and ruby version number' do
  #   headers = { 'User-Agent' => "playsms-ruby/#{Playsms::VERSION} ruby/#{RUBY_VERSION}" }
  #
  #   stub_request(:get, /#{@base_url}/).with(headers: headers).to_return(@response_body)
  #
  #   @client.send_message(to: 'number', msg: 'Hey!')
  # end
  #
  # it 'provides an option for specifying a different hostname to connect to' do
  #   expect_get "http://playsms-sandbox.example.com/index.php?app=ws&op=pv&u=#{@user}&h=#{@secret}&to=number&msg=Hey!"
  #
  #   @client = Playsms::Client.new(key: @user, secret: @secret, host: 'playsms-sandbox.example.com')
  #
  #   @client.send_message(to: 'number', msg: 'Hey!')
  # end
  #
  # private
  #
  # def expect(method_symbol, url, body = nil)
  #   headers = { 'Authorization' => /\ABearer (.+)\.(.+)\.(.+)\z/ }
  #
  #   @request = stub_request(method_symbol, url)
  #
  #   if method_symbol == :delete
  #     @request.with(headers: headers).to_return(status: 204)
  #   elsif body.nil?
  #     @request.with(headers: headers).to_return(@response_body)
  #   else
  #     headers['Content-Type'] = 'application/json'
  #
  #     @request.with(headers: headers, body: body).to_return(@response_body)
  #   end
  # end
  #
  # def expect_get(url)
  #   @request = stub_request(:get, url).to_return(@response_body)
  # end
  #
  # def expect_post(url)
  #   # body = WebMock::Util::QueryMapper.query_to_values(data)
  #
  #   #headers = { 'Content-Type' => 'application/x-www-form-urlencoded' }
  #
  #   @request = stub_request(:post, url).to_return(@response_body)
  # end
  #
  # def expect_put(url, data)
  #   body = WebMock::Util::QueryMapper.query_to_values(data)
  #
  #   headers = { 'Content-Type' => 'application/x-www-form-urlencoded' }
  #
  #   @request = stub_request(:put, url).with(body: body, headers: headers).to_return(@response_body)
  # end
  #
  # def expect_delete(url)
  #   @request = stub_request(:delete, url).to_return(status: 204)
  # end
  #
  # after do
  #   assert_requested(@request) if defined?(@request)
  # end
end
