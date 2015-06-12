print("start publishing...")
tmr.alarm(0, 1000, 1, function() dofile("mqtt_pub.lua") end)
tmr.alarm(1, 300000, 0, function() print("stopping tmr 0") tmr.stop(0) end)
