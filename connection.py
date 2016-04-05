import requests

def getRequest():
	r = requests.get('http://httpbin.org/get')
	print"got:  %s" % r
	print(r.json)

getRequest()
