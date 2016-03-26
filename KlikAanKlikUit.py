#!/usr/local/bin/python


#imports:

import RPi.GPIO as GPIO, time, os

#set pin counting (or something like that)
#just nessesary
GPIO.setmode(GPIO.BCM)

#function to klik aan
def KlikAan():
    #command to go to correct directory and turn lights on
    os.system("cd klikaanklikuit/wiringPi/examples/lights; ./kaku M 14 on")

#function to klik uit
def KlikUit():
    #go to correct directory
    os.system("cd klikaanklikuit/wiringPi/examples/lights; ./kaku M 14 off")


#turn klik on
KlikAan()

#wait 10 seconds
time.sleep(10)

#turn klik off
KlikUit()       
        
