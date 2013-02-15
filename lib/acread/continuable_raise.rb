require 'continuation'

module ContinuableRaise

  def raise(*args)
    callcc do |continuation|
      begin
        super
      rescue ContinuableException => e
        e.continuation = continuation
        super(e)
      end
    end
  end

  class ContinuableException < Exception
    attr_accessor :continuation
    def continue
      @continuation.call
    end
  end
end
