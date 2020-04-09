#Error! does not read the information passed in HTTP

import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
from flask import Flask, request, Blueprint
import json
import random
import string

cred = credentials.Certificate('auth.json')
firebase_admin.initialize_app(cred)
db = firestore.client()

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

        print(type(username))
        print(type(password))
        username1 = 'Weston'
        password1 = 'pass'
        print(type(username1))
        print(type(password1))

        if (login_data_validation(username1,password1) == False):
            return "11"

        doc_ref = db.collection(u'users')
        query_ref = doc_ref.where(u'username',u'==',username1).where(u'password', u'==', password1).stream()


        data = []

        for doc in query_ref:
            data = doc.to_dict()

        if len(data) == 0:
            return "10"

        return json.dumps(data)



    def signup_function(self, username, password, email, DOB):
        return None

    def overview(self, token):

        doc_ref = db.collection(u'Overview')
        query_ref = doc_ref.where(u'UniqueID',u'==',str(25275)).stream()

        data = []
        for docs in query_ref:
            data.append(docs.to_dict())
        if (len(data) == 0):
            return "NO DATA Found"

        return json.dumps(data)

    def teams(self, token):
        doc_ref = db.collection(u'teams')
        query_ref = doc_ref.where(u'scoutID',u'==',str(25275)).stream()

        data = []
        for docs in query_ref:
            data.append(docs.to_dict())
        if (len(data) == 0):
            return "NO DATA Found"

        return json.dumps(data)

    def fundraiserGroups(self, token):
        doc_ref = db.collection(u'fundraiser')
        query_ref = doc_ref.where(u'scoutID',u'==',str(25275)).stream()

        data = []
        for docs in query_ref:
            data.append(docs.to_dict())

        if (len(data) == 0):
            return "NO DATA Found"

        return json.dumps(data)

    def addFundraiserGroup(self, MoneyRaised, Name, Number_of_teams, Start_Date, TargetGoal, ScoutID):

        if request.method == 'GET':
            return "Access Denied"

        doc_ref   = db.collection(u'fundraiser')

        data = {
            u'MoneyRaised' : 555,
            u'Name' : "Testing",
            u'NumberOfTeams' : 3,
            u'Start Date' : "HELL",
            u'TargetGoal' : 400,
            u'fundraiserID' : 123,
            u'scoutID' : 25275
        }

        doc_ref.add(data)

        return "Done"
