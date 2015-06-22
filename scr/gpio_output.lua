local args={...}
local pin=tonumber(args[1])
local value=tonumber(args[2])
print("pin: "..pin..", value: "..value)
if value == 0 then
  gpio.write(pin, gpio.LOW)
else
  gpio.write(pin, gpio.HIGH)
end
gpio.mode(pin, gpio.OUTPUT)
