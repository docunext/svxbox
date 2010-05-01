###
# Copyright: Savonix Corporation
# Author: Albert Lash
# License: Affero General Public License v3 or later
##
require 'pony'

module SvxBox
  module PonyBoy

    def svx_email(to=nil,from='',subject='',text='')
      Pony.mail(:to => to, :from => from, :subject => subject, :body => text) unless to.nil?
    end

  end
end
