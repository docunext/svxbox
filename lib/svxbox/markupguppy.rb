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


  end
end
