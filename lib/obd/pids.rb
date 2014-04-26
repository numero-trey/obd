module OBD
  module PIDs
    @@pids = { 
      pids_supported_1: {
        pid: '0100',
        fmt: lambda {|x,d| d.to_s(2).split('').each_with_index.map{|b,i| pids.keys[i] if b == '1'}}
      },
      monitor_status_since_clear: {
        pid: '0101',
        fmt: lambda {|x,d| x}
      },
      freeze_dtc: {
        pid: '0102',
        fmt: lambda {|x,d| x}
      },
      fuel_system_status: {
        pid: '0103',
        fmt: lambda {|x,d| x}
      },
      calculated_engine_load: {
        pid: '0104',
        fmt: lambda {|x,d| d * 100.0 / 255.0},
        unit: '%'
      },
      engine_coolent_temperature: {
        pid: '0105',
        fmt: lambda {|x,d| d * 1.8 - 104},
        unit: 'C'
      },
      short_term_fuel_trim_bank_1: {
        pid: '0106',
        fmt: lambda {|x,d| d * 0.78125 - 100},
        unit: '%'
      },
      long_term_fuel_trim_bank_1: {
        pid: '0107',
        fmt: lambda {|x,d| d * 0.78125 - 100},
        unit: '%'
      },
      short_term_fuel_trim_bank_2: {
        pid: '0108',
        fmt: lambda {|x,d| d * 0.78125 - 100},
        unit: '%'
      },
      long_term_fuel_trim_bank_2: {
        pid: '0109',
        fmt: lambda {|x,d| d * 0.78125 - 100},
        unit: '%'
      },
      fuel_pressure: {
        pid: '010A',
        fmt: lambda {|x,d| d * 3 * 0.145},
        unit: 'psi'
      },
      intake_manifold_absolute_pressure: {
        pid: '010B',
        fmt: lambda {|x,d| d * 0.145},
        unit: 'psi'
      },
      engine_rpm: {
        pid: '010C',
        fmt: lambda {|x,d| d / 4.0},
        unit: 'rpm'
      },
      vehicle_speed: {
        pid: '010D',
        fmt: lambda {|x,d| d * 0.621371192},
        unit: 'mph'
      },
      timing_advance: {
        pid: '010E',
        fmt: lambda {|x,d| d / 2.0 - 64},
        unit: 'deg'
      },
      intake_air_temperature: {
        pid: '010F',
        fmt: lambda {|x,d| d * 1.8 - 104},
        unit: 'C'
      },
      maf_air_flow_rate: {
        pid: '0110',
        fmt: lambda {|x,d| d / 100.0},
        unit: 'grams/sec'
      },
      throttle_position: {
        pid: '0111',
        fmt: lambda {|x,d| d * 100 / 255.0},
        unit: '%'
      },
      commanded_secondary_air_status: {
        pid: '0112',
        fmt: lambda {|x,d| x}
      }, # bit enhexd
      oxygen_sensors_present: {
        pid: '0113',
        fmt: lambda {|x,d| x}
      }, 
      # [A0..A3] == Bank 1,Sensors 1-4.[A4..A7]
      bank_1_sensor_1_oxygen_sensor_voltage: {
        pid: '0114',
        fmt: lambda {|x,d| x},
        unit: '%'
      },
      bank_1_sensor_2_oxygen_sensor_voltage: {
        pid: '0115',
        fmt: lambda {|x,d| x},
        unit: '%'
      },
      bank_1_sensor_3_oxygen_sensor_voltage: {
        pid: '0116',
        fmt: lambda {|x,d| x},
        unit: '%'
      },
      bank_1_sensor_4_oxygen_sensor_voltage: {
        pid: '0117',
        fmt: lambda {|x,d| x},
        unit: '%'
      },
      bank_2_sensor_1_oxygen_sensor_voltage: {
        pid: '0118',
        fmt: lambda {|x,d| x},
        unit: '%'
      },
      bank_2_sensor_2_oxygen_sensor_voltage: {
        pid: '0119',
        fmt: lambda {|x,d| x},
        unit: '%'
      },
      bank_2_sensor_3_oxygen_sensor_voltage: {
        pid: '011A',
        fmt: lambda {|x,d| x},
        unit: '%'
      },
      bank_2_sensor_4_oxygen_sensor_voltage: {
        pid: '011B',
        fmt: lambda {|x,d| x},
        unit: '%'
      },
      obd_standards_vehicle_conforms_to: {
        pid: '011C',
        fmt: lambda {|x,d| x}
      }, 
      # bit encoded
      oxygen_sensors_present_2: {
        pid: '011D',
        fmt: lambda {|x,d| x}
      }, 
      # complicated...
      aux_input_status: {
        pid: '011E',
        fmt: lambda {|x,d| (x == 1).inspect}
      }, 
      # Power Take Off (PTO) status is active?
      run_time_since_engine_start: {
        pid: '011F',
        fmt: lambda {|x,d| d}
      }, 
      # seconds
      pids_supported_2: {
        pid: '0120',
        fmt: lambda {|x,d| d.to_s(2).split('').each_with_index.map{|b,i| pids.keys[i+33] if b == '1'}}
      }, 
      # bit encoded
      distance_traveled_with_mil_on: {
        pid: '0121',
        fmt: lambda {|x,d| d.to_s},
        unit: 'km'
      },
      fuel_level_input: {
        pid: '012F',
        fmt: lambda {|x,d| d * 100.0 / 255.0 },
        unit: '%'
      },
      barometric_pressure: {
        pid: '0133',
        fmt: lambda {|x,d| x },
        unit: 'kPa'
      },
      ambient_air_temperature: {
        pid: '0166',
        fmt: lambda {|x,d| x - 40 },
        unit: 'C'
      },
      engine_oil_temperature: {
        pid: '015C',
        fmt: lambda {|x,d| x - 40 },
        unit: 'C'
      },
      engine_fuel_rate: {
        pid: '015E',
        fmt: lambda {|x,d| },
        unit: 'L/h'
      }
      # code: {
      #   pid: '',
      #   fmt: lambda {|x,d| },
      #   unit: ''
      # },
    }
  end
end