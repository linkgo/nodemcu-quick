m = mqtt.Client("i_node", 120, nil, nil)

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
  end
end)

m:connect("IP_ADDR", 1883, 0, function(conn)
  print("connected")
  -- gpio[2] low, indicates connected
  gpio.write(4, gpio.LOW)
  gpio.mode(4, gpio.OUTPUT)
  dofile("mqtt_pub_forever.lua")
end)

