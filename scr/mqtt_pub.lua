m:publish("/nodemcu/input", adc.read(0), 0, 0, function(conn)
  print("sent")
end)
