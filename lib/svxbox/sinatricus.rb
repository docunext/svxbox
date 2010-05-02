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

    def svx_debug(msg='')
      if ENV['RACK_ENV'] == 'development'
        puts yield if block_given?
        puts msg
      end
    end
    def svx_debug_t(msg='')
      svx_debug yield if block_given?
      svx_debug(msg)
    end
  end
end
