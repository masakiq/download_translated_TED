#!/usr/bin/env ruby

require 'open-uri'
require 'nokogiri'

base_url = 'https://www.ted.com/talks/'
down_load_url = 'http://download.ted.com/talks/'
url = "#{base_url}#{ARGV[0]}"
page = open(url)
target = page.map do |p|
  p if p.include?(down_load_url)
end.compact.first

base_index = 0
urls = []

while true do
  index = target.index(down_load_url, base_index)
  break unless index
  str = target[index, index + 100]
  ind = str.index('.mp4')
  break unless ind
  urls << str[0, ind + 4]
  base_index = index + ind + 4
end

result = urls.select do |url|
  url.include?('480p.mp4')
end

puts result.first
