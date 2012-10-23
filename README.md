# acread
[![Build Status](https://secure.travis-ci.org/yarmand/acread.png?branch=master)](http://travis-ci.org/yarmand/acread)

acread is a gem that helps you deprecating ActiveRecord attributes.

When you deprecate an attribute, acread can helps you in 3 ways :

1. helps you finding where you are using this attribute by creating glue to raise a `DeprecatedAttributeError`.
1. ignore this atribute when serializing the object through to_json, to_xml ...
1. helps your zero downtime migration by ignoring the attribute for objects already in memory when saving to database.

# Usage

## Installation
add to your Gemfile :

    gem 'acread'

## deprecate an attribute

    class Person < ActiveRecord::Base
      ...
      deprecate_attribute :long_name
      ...
    end

## find attribute usage
you can catch the `DeprecatedAttributeError` exception and for example put a backtrace in a specific logger.

    class ApplicationController
    	rescue_from DeprecatedAttributeError, :with => :log_deprecate
    	
    	private
    	
    	def deprecated_logger
    		@@deprecated_logger ||= Logger.new("#{Rails.root}/log/deprecated_calls.log")
  		end
    	
    	def log_deprecated e
    		deprecated_logger.error(e.stacktrace.join("\n"))
    	end
    end
    
## zero downtime migration
When you are done with cleaning your code from any usage of deprecated attributes, you can prepare a migration including some drop_columns.

example :

    class RemoveLongNames < ActiveRecord::Migration
      def self.up
        remove_column :Person, :long_name

      end

      def self.down
        raise ActiveRecord::IrreversibleMigration
      end
    end
    
Then you can safely follow the steps :


1. Deploy your code with deprecation declaration in it
1. Run the migration
2. Remove deprecation declarations from your code
3. Deploy your final clean version of code

# Contributing to acread
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

# Copyright

Copyright (c) 2012 yann ARMAND under MIT See LICENSE.txt for
further details.