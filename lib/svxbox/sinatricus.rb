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

    def svx_debug(msg)
      puts msg if ENV['RACK_ENV'] == 'development'
      return true
    end
  end
end
