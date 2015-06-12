-- Below commands are quick runtime calls to library.lua.
-- In order to do so, we keep lua scripts on board.

file.open("init.lua", "w+")
file.writeline([[uart.setup(0,115200,8,0,1)]])
file.close()

file.open("ls.lua", "w+")
file.writeline([[l = file.list()]])
file.writeline([[for k,v in pairs(l) do]])
file.writeline([[  print("name: "..k..",size: "..v)]])
file.writeline([[end]])
file.close()

file.open("cat.lua", "w+")
file.writeline([[local f=...]])
file.writeline([[print("args: "..f)]])
file.writeline([[]])
file.writeline([[file.open(f, "r")]])
file.writeline([[print(file.read(EOF))]])
file.writeline([[file.close()]])
file.close()

file.open("lsap.lua", "w+")
file.writeline([[function listap(t)]])
file.writeline([[  for k,v in pairs(t) do]])
file.writeline([[    print(k.. : ..v)]])
file.writeline([[  end]])
file.writeline([[end]])
file.writeline([[wifi.sta.getap(listap)]])
file.close()

file.open("mqtt_conn.lua", "w+")
file.writeline([[m = mqtt.Client("nodemcu", 120, nil, nil)]])
file.writeline([[]])
file.writeline([[m:on("connect", function(con)]])
file.writeline([[  print ("connected") end)]])
file.writeline([[m:on("offline", function(con)]])
file.writeline([[  print ("offline") end)]])
file.writeline([[]])
file.writeline([[m:on("message", function(conn, topic, data)]])
file.writeline([[  print(topic .. ":" )]])
file.writeline([[  if data ~= nil then]])
file.writeline([[    print(data)]])
file.writeline([[  end]])
file.writeline([[end)]])
file.writeline([[]])
file.writeline([[m:connect("IP_ADDR", 1883, 0, function(conn)]])
file.writeline([[  print("connected") end)]])
file.close()
file.open("mqtt_conn.lua", "r")
print(file.read(EOF))
file.close()

file.open("mqtt_pub.lua", "w+")
file.writeline([[m:publish("/nodemcu/report", "nodemcu: "..adc.read(0), 0, 0, function(conn)]])
file.writeline([[  print("sent") end)]])
file.close()

file.open("mqtt_pub_10s.lua", "w+")
file.writeline([[print("start publishing...")]])
file.writeline([[tmr.alarm(0, 1000, 1, function() dofile("mqtt_pub.lua") end)]])
file.writeline([[tmr.alarm(1, 10000, 0, function() print("stopping tmr 0") tmr.stop(0) end)]])
file.close()

file.open("mqtt_sub.lua", "w+")
file.writeline([[m:subscribe("+", 0, function(conn)]])
file.writeline([[  print("subscribe success") end)]])
file.close()

-- some quick script call
dofile("ls.lua")
assert(loadfile("cat.lua"))("cat.lua")
print(node.heap())
dofile("mqtt_conn.lua")
dofile("mqtt_pub_10s.lua")
dofile("mqtt_pub_300s.lua")
dofile("mqtt_pub_forever.lua")
dofile("mqtt_sub.lua")
