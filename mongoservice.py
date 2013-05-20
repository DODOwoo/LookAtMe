from pymongo import Connection
from bson.json_util import dumps
from datetime import datetime

conn = Connection()
db = conn.pairtalk
user = db.user
secret = db.secret
log = db.log
crazy = db.crazy


def insert_user(data):
	user.insert(data)

# data:{"name":name,"score":score}
def update_score(data):
    #insert_log(data)
    user.update({"name":data["name"]},{"$set":{"score":data["score"]}})

# data:{"name":name,"pairname":pairname}
# def update_score(data):
# 	user.update({"name":data["name"]},{"$set":{"pairname":data["pairname"]}})
def update_pair(data):
	user.update({"name":data["name"]},{"$set":{"pairname":data["pairname"]}})

def update_user(data):
    user.update({"name":data["name"]},{"$set":{"pairname":data["pairname"],"password":data["password"],"phone":data["phone"],"gtalk":data["gtalk"]}})

def find_someone_log(name):
	return log.find({"name":name})

def find_someone(name):
	cursor = user.find({"name":name})
	if cursor.count() >0:
		return cursor[0]
	else:
		return None

def find_pair(name):
    user = find_someone(name)
    if user and "pairname" in user and user["pairname"] <> '':
        return find_someone(user["pairname"])
    return dict(name='',score=0)


def check_user_credentials(name,password):
	checkeduser = user.find({"name":name,"password":password})
	return checkeduser.count()> 0

def insert_log(data):
    data["adddate"] = datetime.now()
    log.insert(data)

def find_and_remove_crazy():
	w = dumps(crazy.find())
	crazy.remove()
	return w

def modify_crazy(data):
	crazy.update({"name":data["name"]},{"$set":{"data":data}},upsert=True)



