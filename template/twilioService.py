from twilio.rest import TwilioRestClient
 
account_sid = "AC140d2eea98e5722059f702d38a668be7"
auth_token = "c41cd9a9428c339754154397e8cea498"
from_= "+14242851285"
client = TwilioRestClient(account_sid, auth_token)

def sendSMSMsg(msg,to):
	client.sms.messages.create(to=to,from_=from_,body=msg)
