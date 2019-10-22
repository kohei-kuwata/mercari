require 'nokogiri'
require 'open-uri'

mercari_search_url = "https://www.mercari.com/jp/search/?"

url_option_sort_price_lower = "sort_order=price_asc&"
url_option_sort_item_newer = "sort_order=created_desc&"

keyword = "keyword=速読速聴"

link = URI.encode(url +url_option_sort_item_newer + keyword)
charset = nil

html = open(link) do |f|
  charset = f.charset
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)
doc.css('section.items-box').each do |item|
  item_url = item.css('a')[0][:href]
  item_id = item_url.match(/https:\/\/item.mercari.com\/jp\/(m[0-9]*)\//)
  puts tem_id
  puts tem_id[1]

  puts item.css('h3.items-box-name').text
  puts item.css('div.items-box-price').text

  puts "==================================="
end
