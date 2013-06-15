#!/usr/bin/ruby1.9.3

f=File.open("/mnt/RAID5_intern/bernd/documents/Projekte/serialreader.git/current/A1",'r') # light sensor (NTC) is at Arduinos analog pin A1
raw=f.readline
puts "Light.value #{raw.to_i}\n"
