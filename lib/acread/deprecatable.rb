module Deprecatable

  def deprecate_attribute attr
    @@deprecated_attributes ||=[]
    @@deprecated_attributes << attr.to_s
    overide_accessors attr
  end

  def overide_accessors attr
    msg = "You can't access atribute #{attr}, it has been deprecated"
    [ '', '=', '?', '_changed?'].each do |term|
      define_method("#{attr}#{term}") do |e=nil|
      raise DeprecatedAttributeError, msg 
      end
    end
  end

end

class DeprecatedAttributeError < RuntimeError
end
