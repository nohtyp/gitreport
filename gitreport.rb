#!/usr/bin/env ruby
require 'curl'
require 'curb'

url = ["https://api.github.com/repos/nohtyp/linode"]

gitobj = Curl::Easy.new

url.each do |url|
	gitobj.headers["User-Agent"] = "mytest-0.0"
	gitobj.url = url
	gitobj.perform
	puts "#{gitobj.body_str}"
end
