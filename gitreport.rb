#!/usr/bin/env ruby
require 'curl'
require 'curb'
require 'json'

c=0
url = ["https://api.github.com/repos/nohtyp/linode/commits"]



gitobj = Curl::Easy.new

url.each do |url|
	gitobj.headers["User-Agent"] = "gitreport-0.0"
	gitobj.url = url
	gitobj.perform
	@test = JSON.parse(gitobj.body_str)
end

@test.each do |x| 
  puts x["comments_url"]
  c += 1
  hash = x["sha"]
  puts "The hashes #{hash}"
end

puts "There are #{c} commits"
