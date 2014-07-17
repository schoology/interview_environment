require 'sinatra'

configure do
	enable :logging
end

get '/' do
  'Hello World!'
end
