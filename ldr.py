#imports:

import RPi.GPIO as GPIO, time

GPIO.setmode(GPIO.BCM)

LDR_PIN = 18

def checkldrsensor():
	measurement = 0
	print"checks light sensor"
	#reset capacitor
	GPIO.setup(LDR_PIN, GPIO.OUT)
	GPIO.output(LDR_PIN, GPIO.LOW)
	time.sleep(0.1)
	
	#set input
	GPIO.setup(LDR_PIN, GPIO.IN)
	#count loops until voltage across
	
	while(GPIO.input(LDR_PIN) == GPIO.LOW):
		measurement += 1
	

	return measurement

try:
	while True :
		status = checkldrsensor()
		print"ldr = %s" % status
		time.sleep(3)



except KeyboardInterrupt:
        pass
finally:
        GPIO.cleanup()
