#!/usr/bin/env ruby

require 'open-uri'
require 'nokogiri'

PREFIX = 'https://www.ted.com'
LIST_URL = '/talks?language=ja&page='
PER_PAGE = 36
@page = 1
@store = {}

def fetch_videos
  html = Nokogiri::HTML(open(PREFIX + LIST_URL + @page.to_s))
  result = html.xpath('//*[@id="browse-results"]/div/div')
  puts 'id. duration title'
  result.each_with_index do |video, i|
    break if i == PER_PAGE
    video_url = video.xpath('.//*/h4')[1].xpath('./a').first['href']
    title = video.xpath('.//*/h4')[1].xpath('./a').first.text.delete("\n")
    duration = video.xpath('.//*/span[@class="thumb__duration"]').text
    @store[i + 1] = video_url
    puts "#{format('%2d', i + 1)}. #{duration}  #{title}"
  end
end

def ted_id(video_url)
  html = Nokogiri::HTML(open(PREFIX + video_url))
  html.xpath('/html/head/meta').each do |meta|
    next unless meta['name'] == 'twitter:app:url:ipad'
    return meta['content'].match(/talkID=([0-9]+)&source/)[1].to_i
  end
end

def show_usage
  puts "\n"
  puts "[USAGE] 'next': show next videos, '[id]': show TED ID, 'exit': exit"
end

# main
fetch_videos
loop do
  show_usage
  cmd = gets.chomp
  if cmd == 'next'
    @page += 1
    puts "\n"
    fetch_videos
  elsif cmd == 'exit'
    break
  elsif 0 < cmd.to_i && cmd.to_i <= PER_PAGE
    puts "\n"
    puts "TED ID: #{ted_id(@store[cmd.to_i])}"
    break
  end
end
