import requests, json

token = 0



def getToken():
	jsondata = {'username':'testuser', 'password': 'testpassword'}
	r = requests.post('http://localhost:8080/apiv2/login', data = jsondata)
	#data = json.loads(r)
	global token
	print"gettoken returns: %s" % r.text
	
	#print(r.json)
	resp_dict = json.loads(r.text)
	#resp_dict['token']
	token = resp_dict["token"]
	print "token is: %s" %  token

def postPower(value):
	global token
	if(token == 0):
		getToken()
	url = 'http://localhost:8080/apiv2/postpower'
	jsondata = {'power':value}
	jsonheaders = {'X-Access-Token': token}
	r = requests.post(url,data = jsondata, headers = jsonheaders)
	print"posting power returns: %s" % r.text
		

def getPower():
	global token
	if(token ==0):
		getToken()
	url = 'http://localhost:8080/apiv2/getpowerstatus'
	jsonheader = {'X-Access-Token': token}
	r = requests.get(url, headers = jsonheader)
	print"getPower form api return: %s " %  r.text
	object = r.text.replace("]","")
	object = object.replace("[", "")
	
	resp = json.loads(object)
	
	power = resp['power']
	print"actual power: %s " % power
	return power
	

getToken()

postPower(1)

getPower()
