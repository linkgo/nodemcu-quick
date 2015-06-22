local gpio=...
print("gpio: "..gpio)
gpio.write(gpio, gpio.LOW)
gpio.mode(gpio, gpio.OUTPUT)
