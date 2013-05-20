from pymongo import Connection
from datetime import datetime

conn = Connection()
db = conn.pairtalk
user = db.user
secret = db.secret
log = db.log

def insert_user(data):
	user.insert(data)

# data:{"name":name,"score":score}
def update_score(data):
	insert_log(data)
	user.update({"name":data["name"]},{"$set":{"score":data["score"]}})

# data:{"name":name,"pairname":pairname}
def update_pair(data):
	user.update({"name":data["name"]},{"$set":{"pairname":data["pairname"]}})

def update_user(data):
    user.update({"name":data["name"]},{"$set":{"pair":data["pair"],"password":data["password"],"phone":data["phone"]}})

def find_someone_log(name):
	return log.find({"name":name})

def find_someone(name):
	return user.find({"name":name})

def check_user_credentials(name,password):
	checkeduser = user.find({"name":name,"password":password})
	return checkeduser.count()> 0

def insert_log(data):
    data["adddate"] = datetime.now()
    log.insert(data)



