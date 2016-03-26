import RPi.GPIO as GPIO
import time

#connect PIR VCC pin to pin 7
PIR_PIN = 15

#connect LDR to pin 4
#LDR_PIN = 8


#set GPIO pin numbering
GPIO.setmode(GPIO.BCM)

#set LDR_PIN as input
GPIO.setup(PIR_PIN,GPIO.IN)

def MOTION(PIR_PIN):
	#status = input from PIR PIN
	#1 = high = motion detected
	#0 = low = no motion detected
	status = GPIO.input(PIR_PIN)
	if(status == 1):
		print "motion detected!"
	else:
		print "no motion anymore!"

	#TO DO: CHECK IF DARK AND HANDLE LIGHT 
#print some text in terminal
print"PIR MODULE TEST (CTRL + C to exit"

#wait 2 seconds
time.sleep(2)

print"ready"

try:
	#add gpio event when motion is detected from no motion
	#pin number, rising or falling edge, def to call by interrupt
	GPIO.add_event_detect(PIR_PIN, GPIO.BOTH, callback=MOTION)

    	#while true
    	while True:
        	time.sleep(100)
        	           
except KeyboardInterrupt:
           print"Quit"
           GPIO.cleanup()
