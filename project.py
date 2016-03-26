import RPi.GPIO as GPIO
import time
import os

#connect kika to pin 14
KAKU_PIN = 14

#connect PIR VCC pin to pin 15
PIR_PIN = 15

#connect LDR to pin 4
#LDR_PIN = 8

#set GPIO pin numbering
GPIO.setmode(GPIO.BCM)

#set LDR_PIN as input
GPIO.setup(PIR_PIN,GPIO.IN)

#function to klik aan
def KlikAan():
    #command to go to correct directory and turn lights on
    os.system("cd klikaanklikuit/wiringPi/lights; ./kaku M 14 on")

#function to klik uit
def KlikUit():
    #go to correct directory
    os.system("cd klikaanklikuit/wiringPi/lights; ./kaku M 14 off")

def MOTION(PIR_PIN):
	#status = input from PIR PIN
	#1 = high = motion detected
	#0 = low = no motion detected
	status = GPIO.input(PIR_PIN)
	if(status == 1):
		print "motion detected!"
		#ToDO: check ldr
		KlikAan()
		
	else:
		print "no motion anymore!"
		KlikUit()

	#TO DO: CHECK IF DARK AND HANDLE LIGHT 
#print some text in terminal
print"PIR MODULE TEST (CTRL + C to exit"

#wait 2 seconds
time.sleep(2)

print"ready"
#fire event to start correct status
MOTION(PIR_PIN)

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
