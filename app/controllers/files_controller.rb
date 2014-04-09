class FilesController < ApplicationController

require 'net/http'
require 'json'

def create
	email = params[:email]
	password = params[:password]
	app_id = ENV['WORKSHARE_ID']

	url = URI('https://my.workshare.com/api/open-v1.0/user_sessions.json')
	response = Net::HTTP.post_form(url, {"user_session[email]" => email, "user_session[password]" => password, "device[app_uid]" => app_id})


	 cred = JSON.parse(response.body)["device_auth_token"]
	 test = response['set-cookie']

	url2 = URI('https://my.workshare.com/api/open-v1.0/files.json')
	params = { "credentials" => cred, "Cookie" => test }
	url2.query = URI.encode_www_form(params)
	res = Net::HTTP.get_response(url2)
	puts res.body if res.is_a?(Net::HTTPSuccess)

	# res.each {|a| p a}

	# files = Net::HTTP.get(url2, {"credentials" => cred, "Cookie" => test})

	# hello = JSON.parse(files.body)["files"]

	# hello.each {|h| p h}

	redirect_to '/files'
	# hello.each do |file|
	# 	file
	# end
end	

def index
	@files = Files.all
end

def new
	@file = Files.new 
end


end
