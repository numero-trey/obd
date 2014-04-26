module OBD
  class Command
    include OBD::PIDs

    def self.add_pid(code, opts)
      @@pids[code.to_sym] = opts
    end

    def self.format_result command, result
      if is_command?(command) && result != "NO DATA"
        OBD::Result.new(command,
          @@pids[command.to_sym][:fmt].call(h(result), h(result).to_i(16)),
          units: @@pids[command.to_sym][:unit]
        )
      else
        result
      end
    end

    def self.to_hex command
      if is_command? command
        @@pids[command.to_sym][:pid]
      else
        command
      end
    end

    def self.is_command? command
      @@pids.keys.include? command.to_sym
    end

    def self.pid
      {
        "atrv" => [:battery_voltage, lambda {|x| x.to_s}],
        "0100" => [:pids_supported_1]
      }
    end

    def self.pids
      @@pids
    end

    def self.h response
      response[4..-1]
    end

  end
end
