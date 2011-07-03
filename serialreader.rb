require 'rubygems'
require 'serialport'
require 'sqlite3'

port_str = "/dev/tty.usbserial-A9007V3T"  #may be different for you
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE
lastvalue = 1024/2

db = SQLite3::Database.new( 'data/data.db')
while true do

sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
values = Hash.new
lines = Array.new
while lines.size<=11 do # 2 measurements * 5 arduino analog ports +1 fault at the beginning
  line=sp.readline;
  puts line;
  lines<<line
end

values = Hash.new;

lines.each do |line|
  if (line =~ /A\w\t\d{1,4}/)
  (key,value) = line.split /\t/
  key = key
    if not values.has_key?(key)
    values[key]=Array.new
    end
    value=value.gsub(/\s/,"").to_i
    
    if value < 0 || value > 1023
      value = lastvalue
    end
    values[key] << value
  end
  lastvalue = value
end

#p values;

values.each do |key,value|
    values[key]=value.inject(:+).fdiv(value.size).round
end

#p values;

File.open("data/analog.current", "w") do |file|
  values.each do |key,value|
    file.puts "#{key}\t#{value}"
    
    db.execute("CREATE TABLE IF NOT EXISTS #{key}(timestamp INTEGER, value INTEGER)") || die
    
    db.execute("INSERT INTO #{key} (timestamp,value) VALUES (#{Time.now.to_i},#{value})") || die
    
  end
end
sp.close
end