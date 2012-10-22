module Deprecatable


  # ensure the deprecated attributes will be skip when serialize the record
  def serializable_hash(options={})
    options = {} if options.nil?
    options = { 
      :only => self.attributes.keys.map(&:to_sym) - @@deprecated_attributes 
    }.update(options)
    super(options)
  end

  def self.overide_accessors attr
    msg = "You can't access atribute #{attr}, it has been deprecated"
    [ '', '=', '?', '_changed?'].each do |term|
      define_method("#{attr}#{term}") do |e=nil|
        raise RuntimeError, msg 
      end
    end
    hack_columns
  end

  def self.hack_columns
    unless methods.include? :original_columns
      define_method(:columns) do 
        puts "[colunms]"
        super.columns.reject { |c| @@deprecated_attributes.include? c.name.to_s} 
      end
    end
  end


end



