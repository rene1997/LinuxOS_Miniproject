import RPi.GPIO as GPIO
import time
import os

#connect kika to pin 14
KAKU_PIN = 14

#connect PIR VCC pin to pin 15
PIR_PIN = 15

#connect LDR to pin 18
LDR_PIN = 18

#kaku status, 0 = off, 1 = on
kakustate = 1

#set GPIO pin numbering
GPIO.setmode(GPIO.BCM)

#set LDR_PIN as input
GPIO.setup(PIR_PIN,GPIO.IN)

def CheckLightSensor():
	measurement = 0
	print"checks light sensor:"
	#reset capacitor
	GPIO.setup(LDR_PIN, GPIO.OUT)
	GPIO.output(LDR_PIN, GPIO.LOW)
	time.sleep(0.1)
	
	#set input
	GPIO.setup(LDR_PIN, GPIO.IN)

	while(GPIO.input(LDR_PIN) == GPIO.LOW):
		measurement += 1
	
	return measurement

#function to klik aan
def KlikAan():
	global kakustate
	if(kakustate == 0):
    		#command to go to correct directory and turn lights on
    		os.system("cd klikaanklikuit/wiringPi/lights; ./kaku M 14 on")
		
		kakustate += 1
#function to klik uit
def KlikUit():
	global kakustate
	if(kakustate == 1):
    		#go to correct directory
    		os.system("cd klikaanklikuit/wiringPi/lights; ./kaku M 14 off")
		#global kakusate
		kakustate -= 1

def MOTION():
	
	#status = input from PIR PIN
	#1 = high = motion detected
	#0 = low = no motion detected
	status = GPIO.input(PIR_PIN)
	if(status == 1):
		print "motion detected!"
		#check if dark enough
		lightstatus = CheckLightSensor()
		print "light: %s" % lightstatus
		#how higher, how darker
		if(lightstatus >  300):
			print"klik aan"	
			KlikAan()
		else:
			print"niet donker genoeg"
			KlikUit()
		
	else:
		print "no motion anymore!, klik uit"
		KlikUit()



#main:

 
#print some text in terminal
print"PIR MODULE TEST (CTRL + C to exit"

print"power on kaku in 2 seconds!"
#wait 2 seconds
time.sleep(3)

#talk to kaku to send connect
KlikUit()

print"ready"

try:
	#add gpio event when motion is detected from no motion
	#pin number, rising or falling edge, def to call by interrupt
	#GPIO.add_event_detect(PIR_PIN, GPIO.BOTH, callback=MOTION)

    	#while true
    	while True:
		MOTION()
		print"Kaku Status: %s" % kakustate	
        	time.sleep(5)
        	           
except KeyboardInterrupt:
           print"Quit"
           GPIO.cleanup()
