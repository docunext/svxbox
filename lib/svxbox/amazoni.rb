###
# Copyright: Savonix Corporation
# Author: Albert Lash
# License: Affero General Public License v3 or later
##

module SvxBox
  module Amazoni

    # From Rack::Utils / Camping
    def url_unescape(string)
      string.tr('+', ' ').gsub(/((?:%[0-9a-fA-F]{2})+)/n) do
        [$1.delete('%')].pack('H*')
      end
    end

    def search_aaws(cat, search)
      require 'amazon/aws'
      require 'amazon/aws/search'
      key = ENV[:AMAZON_KEY]
      id = ENV[:AMAZON_ID]
      return unless key && id
      cat ? mycat = cat : mycat = 'Books'
      puts "aaws: #{search} #{cat}" if ENV['RACK_ENV'] == 'development'
      begin
        req = Amazon::AWS::Search::Request.new(key, id, 'us', false)
        is = Amazon::AWS::ItemSearch.new( mycat, { 'Keywords' => search, 'MerchantId' => 'Amazon' } )
        is.response_group = Amazon::AWS::ResponseGroup.new( :Small, 'Images')
        resp = req.search( is )
        if resp.item_search_response[0]
          idx = 0
          item_sets = resp.item_search_response[0].items
          attribs = '<div>'
          item_sets.each do |item_set|
            mfr = Array.new
            item_set.item[0..6].each do |item|
              imfr = item.item_attributes[0].manufacturer
              unless mfr.include?(imfr) || idx > 3
                mfr << imfr
                idx = idx + 1
                iurl = url_unescape(item.item_links[0].item_link[0].url.to_s).gsub('&','&amp;')
                link = '<a rel="nofollow" href="' << iurl << '">'
                attribs << '<div style="margin-bottom:1em;" class="clearadiv">'
                if item.small_image
                  attribs << '<div class="flrt" style="clear:left;"><center>'+link+'<img alt="'+search+'" src="'+item.small_image[0].url+'"/></a><br />'
                  if item.large_image
                    attribs << '<a class="thickbox" href="'+item.large_image[0].url+'">zoom</a> / '
                  end
                  attribs << '<a href="'+iurl+'">buy</a></center>'
                  attribs << '</div>'
                end
                attribs << link
                attribs << item.item_attributes[0].title
                attribs << '</a><br />'

                if item.item_attributes[0].author
                  attribs << ' by '
                  item.item_attributes[0].author.each do |authors|
                    attribs << authors.to_s
                    unless authors == item.item_attributes[0].author.last
                      attribs << ", "
                    end
                  end
                end
                attribs << '</div>'
              end
            end
          end
          attribs << '</div>'
        end
      rescue
        attribs = ''
      end
      return attribs
    end
  end
end
