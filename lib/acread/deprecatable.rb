module Deprecatable

  ACCESSORS = [ '', '=', '_before_type_cast', '?', '_changed?', '_change', '_will_change!', '_was'] 

  def deprecate_attribute attr
    @deprecated_attributes ||=[]
    @deprecated_attributes << attr.to_s
    overide_accessors attr
  end

  def deprecated_attributes
    @deprecated_attributes
  end

  def accessors
    # TODO: replace this constant by an ActiveRecord inspection
    ACCESSORS
  end

  def overide_accessors attr
    msg = "You can't access atribute #{attr}, it has been deprecated"
    accessors.each do |term|
      define_method("#{attr}#{term}") do |e=nil|
      raise DeprecatedAttributeError, msg 
      end
    end
  end

end

class DeprecatedAttributeError < RuntimeError
end
