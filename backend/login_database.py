#Error! does not read the information passed in HTTP

#Error Code: 10 for user Not Found
#Error Code: 11 is for bad information

import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
from flask import Flask, request, Blueprint
import json
import random
import string
import re

cred = credentials.Certificate('auth.json')
firebase_admin.initialize_app(cred)
db = firestore.client()



email_regex = "r(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)"

def signup_data_validation( password, DOB, firstName,lastName):
    data = ( password, DOB, firstName, lastName)

    for loop in data:
        if loop == "":
            return True

    for loop in data:
        if type(loop) != str:
            return True


    return False

def signup_email_validation(email):

    x = re.search(email_regex, email)

    if(x):
        return True
    else:
        return False


def signup_data_duplicate_check(email):
    doc_ref = db.collection(u'users')
    query_ref = doc_ref.where(u'email', u'==', email).stream()

    return_value = []

    for doc in query_ref:
        return_value = doc.to_dict()

    if (len(return_value) == 0):
        return True

    return False

def login_data_validation(username, password):
    if (username == "" or password == ""):
        return False

    if (type(username) != str or type(password) != str):
        return False

    return True

class loginDatabase:

    #Error Code: 10 for user Not Found
    #Error Code: 11 is for bad login information
    def login_function(self, username, password):


        if (login_data_validation(username,password) == False):
            return "Error Code 11"

        doc_ref = db.collection(u'users')
        query_ref = doc_ref.where(u'username',u'==',username).where(u'password', u'==', password).stream()


        data = []

        for doc in query_ref:
            data = doc.to_dict()

        if len(data) == 0:
            return "Error Code: 10"

        return json.dumps(data)


    #DONE
    def signup_function(self, password, email, DOB, FirstName, LastName):
        doc_ref = db.collection(u'users').document()

        if signup_data_duplicate_check(email):
            return "Error Code 10 Email"

        if signup_email_validation(str(email)):
            return "Enter a correct Email Format"

        if signup_data_validation(str(password), str(DOB), str(FirstName) ,str(LastName)):
            return "Error Code 10"

        data = {
            u'FirstName' : FirstName,
            u'LastName' : LastName,
            u'Password' : password,
            u'Email' : email,
            u'DOB' : DOB,
            u'scoutID' : doc_ref.id
        }

        #temp = doc_ref.id

        doc_ref.set(data)
        #self.create_overview(doc_ref.id)

        #doc_ref = db.collection(u'Overview').document()

        #data = {
        #    u'ScoutID': temp
        #}


        return "Success"

    def create_overview(self, token):

        return None

    def overview(self, token):

        doc_ref = db.collection(u'Overview')
        query_ref = doc_ref.where(u'ScoutID',u'==',str(token)).stream()

        data = []
        for docs in query_ref:
            data.append(docs.to_dict())

        if (len(data) == 0):
            return "Error Code: 10"

        return json.dumps(data)

    #Done ~ Karla
    def teams(self, token):
        doc_ref = db.collection(u'teams')
        query_ref = doc_ref.where(u'ScoutID',u'==',str(token)).stream()

        data = []
        for docs in query_ref:
            data.append(docs.to_dict())

        if (len(data) == 0):
            return "Error Code 10"

        return json.dumps(data)
    #Done

    def fundraiserGroups(self, token):
        doc_ref = db.collection(u'fundraiser')
        query_ref = doc_ref.where(u'ScoutID',u'==',str(token)).stream()

        data = []
        for docs in query_ref:
            data.append(docs.to_dict())

        if (len(data) == 0):
            return "Error Code 10"

        return json.dumps(data)

    #Done
    def addFundraiserGroup(self, MoneyRaised, Name, Number_of_teams, Start_Date, TargetGoal, ScoutID):

        if request.method == 'GET':
            return "Access Denied"

        doc_ref = db.collection(u'fundraiser').document()

        data = {
            u'Name' : Name,
            u'Location' : Location,
            u'Time': Time,
            u'StartDate' : StartDate,
            u'EndDate' : EndDate,
            u'MoneyRaised' : MoneyRaised,
            u'TargetGoal' : TargetGoal,
            u'fundraiserID' : doc_ref.id,
            u'ScoutID' : ScountID
        }

        doc_ref.set(data)

        return "Success"


    #See how to Delete Data
    def inventory_delete(self, Name, ScoutID):
        doc_ref = db.collection(u'inventory').where(u'Name', u'==', str(Name)).where(u'ScoutID', u'==', str(ScoutID)).stream()
        print("Hey")
        for i in doc_ref:
            print(i.to_dict())



        return "HEEEEY"

    def inventory_adding(self, Name, Price, Stock, Sold, Category, Type_of_M, ScoutID):

        if request.method == 'GET':
            return "Access Denied"

        doc_ref = db.collection(u'inventory').document()

        data = {
            u'Name' : Name,
            u'Price': Price,
            u'Stock': Stock,
            u'Sold' : Sold,
            u'Category' : Category,
            u'Measurement' : Type_of_M,
            u'ScoutID' : ScoutID
        }

        doc_ref.set(data)

        return "Success"

    def getting_inventory(self, ScoutID):
        doc_ref = db.collection(u'inventory')
        query_ref = doc_ref.where(u'ScoutID',u'==',str(ScoutID)).stream()

        data = []

        for docs in query_ref:
            data.append(docs.to_dict())

        if len(data) == 0:
            return "Error Code 10"

        return json.dumps(data)

    def Modify_inventory():
        doc_ref = db.collection(u'inventory').where(u'Name',u'==', str(Name)).where(u'ScoutID', u'==', str(ScoutID)).document()

        return None

    #Done
    def teamsWithNoFundraiser(self):

        doc_ref = db.collection(u'teams')
        query_ref = doc_ref.where(u'FundraiserID',u'==',"").stream()
        data = []
        for docs in query_ref:
            data.append(docs.to_dict())
            print(docs)

        if (len(data) == 0):
            return "Error Code 10"

        return json.dumps(data)

    #Finish Route
    #DONE
    def teamMembers(self, teamID):
        doc_ref = db.collection(u'TeamMember')
        query_ref = doc_ref.where(u'TeamID',u'==',str(teamID)).stream()

        data = []
        for docs in query_ref:
            data.append(docs.to_dict())
        if (len(data) == 0):
            return "Error Code 10"

        return json.dumps(data)


    #Get by ScoutID
    #DONE
    def teamWithOneFundraiser(self, fundraiserID):

        doc_ref = db.collection(u'teams')
        query_ref = doc_ref.where(u'FundraiserID',u'==',str(167)).stream()

        data = []
        for docs in query_ref:
            data.append(docs.to_dict())
        if (len(data) == 0):
            return "Error Code 10"

        return json.dumps(data)
    #Done
    def teamMembers(self, teamUniqueID):

        doc_ref = db.collection(u'TeamMember')
        query_ref = doc_ref.where(u'TeamUniqueID',u'==',"teamUniqueID").stream()

        data = []
        for docs in query_ref:
            data.append(docs.to_dict())
        if (len(data) == 0):
            return "Error Code 10"

        return json.dumps(data)
