#imports:

import RPi.GPIO as GPIO, time

GPIO.setmode(GPIO.BCM)

def RCtime(RCpin):
	#counter
	reading = 0
	#set sensor as output
	GPIO.setup(RCpin, GPIO.OUT)
	#set pin low
	GPIO.output(RCpin, GPIO.LOW)
	#wait 100 ms
	time.sleep(0.1)
	
	#set pin as input
	GPIO.setup(RCpin, GPIO.IN)
	
	#loop for counter
	#while input pin = low 
	while(GPIO.input(RCpin) == GPIO.LOW):
                reading +=1

        return reading

try:
        while True:
                #while forever: read sensor
      		time.sleep(1)
		print RCtime(10)
except KeyboardInterrupt:
        pass
finally:
        GPIO.cleanup()
