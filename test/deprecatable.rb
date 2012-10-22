require 'test/unit'
require 'acread'

class Person < ActiveRecord::Base
  establish_connection :adapter => 'sqlite3', :database => 'foobar.db'
  connection.create_table table_name, :force => true do |t|
    t.string :name
    t.string :long_name
  end
  deprecate_attribute :long_name
end

class DeprecatableTest < Test::Unit::TestCase
  def setup
    @bob = Person.create!(:name => 'bob')
  end

  def test_cretor_with_deprecated_field_raise_exception
    assert_raise(RuntimeError) { Person.create(:long_name => 'should not see this')    }
  end

  def test_read_deprecated_raise_exception
    assert_raise(RuntimeError) { @bob.long_name }
  end

  def test_write_deprecated_raise_exception
    assert_raise(RuntimeError) { @bob.long_name = 'Bon' }
  end


  def test_hash_without_deprecated_attributes
    h = @bob.serializable_hash
    puts s
  end
end


