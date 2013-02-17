module Acread
  def self.run_19?
    Gem::Version.new(String.new(RUBY_VERSION)) > Gem::Version.new('1.9')
  end
end

require 'acread/active_record_ext'
