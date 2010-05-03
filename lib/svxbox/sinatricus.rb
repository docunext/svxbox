###
# Copyright: Savonix Corporation
# Author: Albert Lash
# License: Affero General Public License v3 or later
##

module SvxBox
  module Sinatricus

    # Just the usual Sinatra redirect with App prefix
    def mredirect(uri)
      redirect settings.uripfx+uri, 301
    end

    def svx_debug(msg=nil)
      unless ENV['RACK_ENV'] == 'production'
        puts msg unless msg.nil?
        puts yield if block_given?
      end
    end
    def svx_debug_t(msg=nil)
      svx_debug(msg) unless msg.nil?
      svx_debug { yield } if block_given?
    end
  end
end
