#!/usr/bin/env ruby

require 'open-uri'
require 'nokogiri'

base_url = 'https://www.ted.com/talks/'
url = "#{base_url}#{ARGV[0]}"
page = open(url)
redirect_url = page.base_uri.to_s
redirect_url.slice!(base_url)
puts redirect_url
