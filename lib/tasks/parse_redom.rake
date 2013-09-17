require 'nokogiri'
require 'open-uri'

namespace :afisha do
  desc 'redom.ru parsing'
  task parse_redom: :environment do
    require "#{Rails.root}/lib/tasks/parse_redom/init.rb"

    doc =  Nokogiri::XML(open('http://www.redom.ru/export/sibnews/afisha.xml'))
    doc.encoding = 'utf-8'

    `bundle exec rake db:mongoid:drop `
    ParseRedom::EventParser.new(doc).parse
    ParseRedom::PlaceParser.new(doc).parse
    ParseRedom::SeanceParser.new(doc).parse
  end
end