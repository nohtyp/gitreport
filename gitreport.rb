#!/usr/bin/env ruby
require 'curl'
require 'curb'
require 'json'

commits=0
url = ["https://api.github.com/repos/nohtyp/linode/commits"]



gitobj = Curl::Easy.new

url.each do |url|
	gitobj.headers["User-Agent"] = "gitreport-0.0"
	gitobj.url = url
	gitobj.perform
	@test = JSON.parse(gitobj.body_str)
end

@test.each do |x| 
  commits += 1
  puts "Commit message: #{x["commit"]["message"]}"
  puts "Commit was push by: #{x["commit"]["committer"]["name"]} at #{x["commit"]["committer"]["date"]}"
  date = "#{x["commit"]["committer"]["date"]}".split("T")
  puts "The commit hash: #{x["sha"]}"
  puts "Message was pushed on: #{date[0]} at #{date[1]}"
  puts
end

puts "There are #{commits} commits"
