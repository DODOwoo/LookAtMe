from pymongo import Connection

conn = Connection()
db = conn.pairtalk
user = db.user
secret = db.secret
log = db.log

def insert_user(data):
	user.insert(data)

# data:{"name":name,"score":score}
def update_score(data):
	user.update({"name":data["name"]},{"$set":{"score":data["score"]}})

# data:{"name":name,"pairname":pairname}
def update_score(data):
	user.update({"name":data["name"]},{"$set":{"pairname":data["pairname"]}})

def find_someone_log(name):
	return log.find({"name":name})

def find_someone(name):
	return user.find({"name":name})

def insert_log(data):
	log.insert(data)

