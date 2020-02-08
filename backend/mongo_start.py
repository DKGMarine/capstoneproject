import pymongo
import re

connection = pymongo.MongoClient('mongodb+srv://BassamMetwally:<password>@androidcluster-rrixv.mongodb.net/test?retryWrites=true&w=majority')
db = connection['test-database']
courses = db.courses

#for x in courses.find():
#    print(x)


#Global Values:
regex         = '^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$'
alpha_numeric = '\w'



class User:

    def __init__(self):
        self.email=""
        self.password=""
        self.auth_flag = False

    def passCredentials(self, user_email=None, user_password=None):
        if(re.search(regex, user_email)):
            self.email    = user_email

        else:
            return False

        if(re.search(alpha_numeric, user_password)):
            self.password = user_password
        else:
            return False
        return True


    def userExists(self):
        for x in courses.find({}, {"_id":0 ,"username": 1, "password": 1}):
            print(x)
            if x['username'] == self.email and x['password'] == self.password:
                print("Auth.")
                auth_flag = True
            else:
                print("Not Auth.")



user = User()
print(user.passCredentials("<MOCK>", 'abcd123'))
user.userExists()
