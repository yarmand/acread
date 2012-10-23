require 'active_record'
require 'acread/deprecatable'

class ActiveRecord::Base
  extend Deprecatable
  
  def columns
    self.class.columns.reject { |c| (self.class.deprecated_attributes || []).include? c.name.to_s} 
  end

  # ensure the deprecated attributes will be skip when serialize the record
  def serializable_hash(options = {})
    options = {} if options.nil?
    options = { 
      :only => self.attributes.keys.map(&:to_sym) - (self.class.deprecated_attributes || []).map(&:to_sym)
    }.update(options)
    ActiveRecord::Serialization.instance_method( :serializable_hash ).bind( self ).call(options)
  end

end
