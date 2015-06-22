m = mqtt.Client("o_node", 120, nil, nil)

m:on("connect", function(con)
  print ("connected")
end)
m:on("offline", function(con)
  print ("offline")
end)

m:on("message", function(conn, topic, data)
  print("topic: "..topic)
  if data ~= nil then
    print("data: "..data)
    if topic == "/nodemcu/output" then
      print("output")
      if data == "1" then
        -- gpio low for led on
        --assert(loadfile("gpio_output.lua"))(4,0)
        gpio.write(4, gpio.LOW)
        gpio.mode(4, gpio.OUTPUT)
      else
        --assert(loadfile("gpio_output.lua"))(4,1)
        gpio.write(4, gpio.HIGH)
        gpio.mode(4, gpio.OUTPUT)
      end
    else
      print("ignore")
    end
  end
end)

m:connect("IP_ADDR", 1883, 0, function(conn)
  print("connected")
  m:subscribe("+", 0, function(conn)
    print("subscribe success")
  end)
end)

