###
# Copyright: Savonix Corporation
# Author: Albert Lash
# License: Affero General Public License v3 or later
##

module SvxBox
  module MarkupGuppy

    def goback
      '<input type="button" onclick="history.go(-1);" value="Go Back" />'
    end

    def pagetitle(string)
      '<h3 id="page-title">' << string << '</h3>' << "\n\n"
    end

    def mdlistlink(label,href)
      "* [#{label}](#{href})"
    end

    def humanize(text)
      return text.gsub('_',' ').gsub(/\b\w/){$&.upcase}
    end
    
    def svxbasename(text)
      return text.downcase.gsub(' ','_').gsub(/[^a-z0-9_]/,'')
    end

    def svxprevnext(svxprev,svxnext)
      npkg = ''
      npkg << "<span class=\"flrt\"><a href=\"#{svxnext}\">Next &#8250;</a></span>"
      npkg << "<a href=\"#{svxprev}\">&#8249; Previous</a>\n\n"
    end
    
    alias :svxbn :svxbasename
    alias :svxpn :svxprevnext

  end
end
