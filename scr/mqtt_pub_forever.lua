print("start publishing...")
tmr.alarm(0, 1000, 1, function() print("time: "..tmr.now()) dofile("mqtt_pub.lua") end)
