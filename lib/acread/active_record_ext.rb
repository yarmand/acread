require 'active_record'
require 'acread/deprecatable'

class ActiveRecord::Base
  include Deprecatable

  def self.deprecate_attribute cl, attr
    Deprecatable::deprecate_attribute cl,attr
  end


end
