###
# Copyright: Savonix Corporation
# Author: Albert Lash
# License: Affero General Public License v3 or later
##

module SvxBox
  module MongoBongo

    def make_oid(oid)
      begin
        obj = Mongo::ObjectID.from_string(oid)
      rescue Mongo::InvalidObjectID
        halt 404
      end
    end

  end
end
