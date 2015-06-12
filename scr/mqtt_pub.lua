m:publish(/nodemcu/report, nodemcu: ..adc.read(0), 0, 0, function(conn)
  print(sent)
end)
