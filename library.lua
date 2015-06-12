-- init.lua
uart.setup(0,115200,8,0,1)

-- ls()
l = file.list()
for k,v in pairs(l) do
  print("name: "..k..",size: "..v)
end

-- cat()
local f=...
print(args: ..f)

file.open(f, r)
print(file.read(EOF))
file.close()

-- list nearby APs
function listap(t)
  for k,v in pairs(t) do
    print(k.. : ..v)
  end
end
wifi.sta.getap(listap)

-- mqtt connect, replace IP_ADDR to real world value
open("mqtt_conn.lua", "w+")
m = mqtt.Client("nodemcu", 120, nil, nil)

m:on("connect", function(con)
  print ("connected") end)
m:on("offline", function(con)
  print ("offline") end)

m:connect("IP_ADDR", 1883, 0, function(conn)
  print("connected") end)

-- mqtt publish
m:publish("/nodemcu/report", "nodemcu: "..adc.read(0), 0, 0, function(conn)
  print("sent") end)

-- mqtt publish, keep doing so for 10 sec, with a 1 sec interval
print("start publishing...")
tmr.alarm(0, 1000, 1, function() dofile("mqtt_pub.lua") end)
tmr.alarm(1, 10000, 0, function() print("stopping tmr 0") tmr.stop(0) end)

-- mqtt subscribe, message will be handled in m:on()
m:on("message", function(conn, topic, data)
  print(topic .. ":" )
  if data ~= nil then
    print(data)
  end
end)

m:subscribe("+", 0, function(conn)
  print("subscribe success") end)

-- after mqtt things done, close connection
m:close()
