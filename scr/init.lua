uart.setup(0,115200,8,0,1)
gpio.mode(4, gpio.OUTPUT)
value = false
tmr.alarm(1, 50, 1, function()
  value = not value
  if wifi.sta.getip()== nil then
    if value == false then
      gpio.write(4, gpio.LOW)
    else
      gpio.write(4, gpio.HIGH)
    end
  else
    tmr.stop(1)
    gpio.write(4, gpio.HIGH)
    print("Config done, IP is "..wifi.sta.getip())
    --dofile("o_node.lua")
    --dofile("i_node.lua")
  end
end)
