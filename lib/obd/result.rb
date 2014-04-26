module OBD
  # Presenter for results
  class Result
    attr_accessor :value, :code, :opts

    @@defaults = {
      precision: 2
    }

    def self.set_defaults(opts = {})
      @@defaults.merge!(opts)
    end

    def initialize(code, value, opts = {})
      @code = code
      @value = value
      @opts = @@defaults.dup.merge(opts)
    end

    def to_s(opts = {})
      opts = opts.merge(@opts)

      val = if opts[:precision] && @value.kind_of?(Float)
        "%0.#{opts[:precision]}f" % @value
      else
        @value
      end
      
      [val.to_s, opts[:units]].compact.join()
    end

    def inspect
      "#{@code} => #{to_s}"
    end
  end
end
