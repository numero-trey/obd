require 'obd'

OBD_DEVICE = '/dev/tty.obd'
OBD_BAUD = 38400

print "Opening OBDII connection..."
obd = OBD.connect OBD_DEVICE, OBD_BAUD
puts 'OK'

# OBD::Command.add_pid :oil_pressure, {
#   pid: 'F043',
#   fmt: lambda {|x,d| (d.to_f * 3.2) - 1.6 },
#   unit: 'psi'
# }


loop do

  puts "\033[2J\033[0;0H", # Clear screen and return cursor to 0,0
    obd[:engine_rpm].inspect,
    obd[:vehicle_speed].inspect,
    obd.voltage.inspect,
    obd[:timing_advance].inspect,
    obd[:engine_coolent_temperature].inspect,
    obd[:calculated_engine_load].inspect,
    obd[:throttle_position].inspect,
    obd[:aux_input_status]
end
