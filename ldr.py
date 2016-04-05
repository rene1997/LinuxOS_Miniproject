#imports:

import RPi.GPIO as GPIO, time

GPIO.setmode(GPIO.BCM)

LDR_PIN = 10

def checkldrsensor():
	print"checks light sensor"
	status = GPIO.input(LDR_PIN)
	return status


GPIO.setmode(GPIO.BCM)

GPIO.setup(LDR_PIN, GPIO.IN)

try:
	while True :
		status = checkldrsensor()
		print"ldr = %s" % status
		time.sleep(1)



except KeyboardInterrupt:
        pass
finally:
        GPIO.cleanup()
