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
  dofile("mqtt_pub_forever.lua")
end)

