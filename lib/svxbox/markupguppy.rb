###
# Copyright: Savonix Corporation
# Author: Albert Lash
# License: Affero General Public License v3 or later
##

module SvxBox
  module MarkupGuppy

    def pagetitle(string)
      '<h3 id="page-title">' << string << '</h3>' << "\n\n"
    end

    def mdlistlink(label,href)
      "* [#{label}](#{href})"
    end


  end
end
