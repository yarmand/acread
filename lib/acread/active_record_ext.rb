require 'active_record'
require 'acread/deprecatable'

class ActiveRecord::Base
  include Deprecatable

  def self.deprecate_attribute attr
    @@deprecated_attributes ||=[]
    @@deprecated_attributes << attr.to_s
    Deprecatable.overide_accessors attr
  end


end
