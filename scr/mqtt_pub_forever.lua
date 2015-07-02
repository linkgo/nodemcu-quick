print("start publishing...")
tmr.alarm(0, 1000, 1, function() dofile("mqtt_pub.lua") end)
