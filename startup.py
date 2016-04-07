import os
import time

os.system("cd miniproject-server; node app.js &")

time.sleep(15)

os.system("python project.py &")
