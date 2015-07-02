data = adc.read(0)
m:publish("/nodemcu/input", data, 0, 0, function(conn)
  print("["..string.format("%8.3f", tmr.now()/1000000).."] sent: "..data)
end)
