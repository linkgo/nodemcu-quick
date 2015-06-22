m = mqtt.Client(nodemcu, 120, nil, nil)

m:on(connect, function(con)
  print ("connected") end)
m:on(offline, function(con)
  print ("offline") end)

m:on(message, function(conn, topic, data)
  print(topic.." : ")
  if data ~= nil then
    print(data)
  end
end)

m:connect(IP_ADDR, 1883, 0, function(conn)
  print("connected")
end)
