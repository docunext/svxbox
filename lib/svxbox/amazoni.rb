###
# Copyright: Savonix Corporation
# Author: Albert Lash
# License: Affero General Public License v3 or later
##

require "amazon_product"

module SvxBox
  module Amazoni
    # From Rack::Utils / Camping
    def url_unescape(string)
      string.tr('+', ' ').gsub(/((?:%[0-9a-fA-F]{2})+)/n) do
        [$1.delete('%')].pack('H*')
      end
    end

    def search_aaws(cat, search)
      req = AmazonProduct["us"]

      req.configure do |c|
        c.key = ENV['AMAZON_KEY']
        c.secret = ENV['AMAZON_SECRET']
        c.tag = ENV['AMAZON_TAG']
      end

      puts "aaws: #{search} #{cat}" unless ENV['RACK_ENV'] == 'production'

      req << {:search_index => 'Books', :operation => 'ItemSearch', :response_group => ['Small','Images'],             :keywords  => search, :total_results => 5 }
      #req.search(search)
      resp = req.get
      puts resp.to_hash.to_yaml

      puts resp.errors.inspect
      if resp.valid?
        attribs = '<div>'
        puts resp.to_hash.to_yaml
        i = 0 
        resp.each('Item') do |item|
          i = i + 1
          unless i > 4
            mfr = Array.new
            imfr = item['Manufacturer']
            unless mfr.include?(imfr)
              mfr << imfr
              iurl = url_unescape(item['ItemLinks']['ItemLink'][0]["URL"].to_s)
              link = '<a rel="nofollow" href="' << iurl << '">'
              attribs << '<div style="margin-bottom:1em;" class="clearadiv">'
              if item['SmallImage']
                attribs << '<div class="flrt" style="clear:left;"><center>'+link+'<img alt="'+search+'" src="'+item['SmallImage']['URL']+'"/></a><br />'
                if item['LargeImage']
                  attribs << '<a class="thickbox" href="'+item['LargeImage']['URL']+'">zoom</a> / '
                end
                attribs << '<a href="'+iurl+'">buy</a></center>'
                attribs << '</div>'
              end
              attribs << link
              attribs << item['ItemAttributes']['Title']
              attribs << '</a><br />'

              if item['ItemAttributes']['Author']
                author = item['ItemAttributes']['Author']
                authors = author.is_a?(Array) ? author.map { |author| author.to_s } : [author]
                attribs << ' by ' << authors.join(", ")
              end
              attribs << '</div>'
            end
          end
        end
        attribs << '</div>'
      end
      return attribs.gsub('&','&amp;')
    end
  end
end
