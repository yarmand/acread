require 'active_record'
require 'acread/deprecatable'

class ActiveRecord::Base
  extend Deprecatable
  
#  def patch_columns
#    columns_orig = columns
#    def self.columns
#      columns_orig.reject { |c| @@deprecated_attributes.include? c.name.to_s} 
#    end
#  end

  # ensure the deprecated attributes will be skip when serialize the record
#  define_method :serializable_hash_orig, serializable_hash
#  def serializable_hash(options={})
#    options = {} if options.nil?
#    options = { 
#      :only => self.attributes.keys.map(&:to_sym) - @@deprecated_attributes 
#    }.update(options)
#    serializable_hash_orig(options)
#  end

end
