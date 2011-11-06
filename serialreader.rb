#!/usr/local/rvm/bin/ruby

require 'rubygems'
require 'serialport'
require 'optparse'

allowed_serial_keys = ['A0','A1','A2','A3','A4','A5']

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  options[:device] = '/dev/ttyUSB0'
  opts.on( '-d DEVICE', '--device DEVICE', "'DEVICE to listen to. (default: #{options[:device]})" ) do |d|
    options[:device] = d
   end

  options[:mode]= 'raw'
  opts.on("-m MODE", "--mode MODE", "Possible modes are: 'raw', 'ruby' and 'munin'. (default: #{options[:mode]})") do |m|
    options[:mode] = m
  end


  opts.on("-v", "--verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end

  opts.on( '-h', '--help', 'Display this screen' ) do
    puts opts
    exit
  end

  opts.on("--debug", "Debug outputs (Developers only)") do |debug|
    options[:debug] = debug
    options[:verbose] = debug
  end

end.parse!

p options if options[:debug]

port_str = options[:device]

baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE
lastvalue = 1024/2

sp = SerialPort.new(options[:device], baud_rate, data_bits, stop_bits, parity)
# recieve part
Thread.new do
  while TRUE do
    while (serialdata = sp.gets) do

      puts serialdata if options[:verbose] || options[:mode].eql?('raw')

      row = Hash.new
      row['epoch']=Time.new.to_i
      row['time']=Time.new

      serialarray = serialdata.chomp.split(/\t/)

      p serialarray if options[:debug]

      serialarray.each_with_index do |item, index|
        p item if options[:debug]
        p index if options[:debug]
        if allowed_serial_keys.include?(item) && index+1 < serialarray.length
          row[item]= serialarray[index+1]
        end
      end

      p row if options[:debug]

      #format output fitting to output mode
      if options[:mode].eql?('ruby')
        p row
      end

      if options[:mode].eql?('munin')
        response = ""
        row.each do |key,value|
          if key.eql?('A0')
            response << "A0.value #{value.to_i}\n"
          end
        end

        # if valid : puts and quit
        if response.length>=10 && response.gsub(/A0.value \d+/)
          p response.length if options[:debug]
          puts response
          exit
        else
          puts "Invalid response for munin mode:" if options[:debug]
          p response if options[:debug]
        end

      end

    end
  end
end

# send part
begin
  while TRUE do
    sp.print STDIN.gets.chomp
  end
rescue Interrupt
  sp.close
  puts#insert a newline character after ^C
end 
