#!/usr/bin/ruby1.9.3

f=File.open("/mnt/RAID5_intern/bernd/documents/Projekte/serialreader.git/current/A0",'r') # temperatur sensor (NTC) is at Arduinos analog pin A0
raw=f.readline
#calibration                                                                                                                                                           
# 530 => 23                                                                                                                                                            
# 616 => 15                                                                                                                                                            
# 408 => 34                                                                                                                                                            
# => m =-0.0913                                                                                                                                                        
# => b =71.28                                                                                                                                                          
puts "Temp.value #{raw.to_i*(-0.0913)+71.28}\n"
