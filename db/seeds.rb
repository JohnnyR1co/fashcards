# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "nokogiri"
require "open-uri"

doc = Nokogiri::HTML(open("http://www.papahuhu.com/vocabulary/itwords.html"))
  
doc.css("tr").each do |tr|
  Card.create(original_text: tr.css("td:nth-child(1)").text,
              translated_text: tr.css("td:nth-child(3)").text,
              review_date: (DateTime.now.to_date + 3))
end
