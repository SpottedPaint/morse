# app.rb
require 'sinatra'
#require 'mustache/sinatra'
require 'rubygems'
require 'json'
require_relative 'Morse'

set :public_folder, File.dirname(__FILE__) + '/static'

def index
	
	if !@request.params['input']
		@request.params['input'] = ''
	end
		@m = Morse.new()
		@input = @request.params['input']
		@output = @m.translate(@input.gsub(/\+/,' '))
		erb :index
	
end 

get '/', :provides => :html do
    return index
end

post '/error/' do
	content_type :json
	params['t'] = 'ttt'
	entry = params.each { |key,value| puts "#{key}:#{value}\n" }.to_json
	File.open('log.txt', 'a') {|file| file.puts entry }
	return Time.now.getutc.to_json
end

get '/english/:english', :provides => :json do |e|
	content_type :json
	@m = Morse.new()
	{ 'input' => e, 'output' =>  @m.translate(e) }.to_json
end

get '/morse/:morse', :provides => :json do |m|
	content_type :json
	@m = Morse.new()
	{ 'input' => m, 'output' =>  @m.translate(m) }.to_json
end

get '/e' do
    halt 404, {'Content-Type' => 'text/plain'}, @params.inspect
end

not_found do
  'This is nowhere to be found.<br/>
	(....   ..   ...         ..   ...         -.   ---   .--   ....   .   .-.   .         -   ---         -...   .         ..-.   ---   ..-   -.   -..)'
end