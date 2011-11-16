#!/usr/local/rvm/bin/ruby

f=File.open("/home/x42/serialreader.git/current/A1",'r') # light sensor (NTC) is at Arduinos analog pin A1
raw=f.readline
puts "Darkness.value #{raw.to_i}\n"
 
