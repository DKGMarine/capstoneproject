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
import datetime
import os
from sendgrid import SendGridAPIClient
from sendgrid.helpers.mail import Mail

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
    query_ref = doc_ref.where(u'Email', u'==', str(email)).stream()

    return_value = []

    for doc in query_ref:
        return_value.append(doc.to_dict())

    if (len(return_value) == 0):
        return False

    return True

def login_data_validation(username, password):
    if (username == "" or password == ""):
        return False

    if (type(username) != str or type(password) != str):
        return False

    return True

class loginDatabase:

    #Error Code: 10 for user Not Found
    #Error Code: 11 is for bad login information
    def login_function(self, Email, password):


        if (login_data_validation(Email,password) == False):
            return "Error Code 11"

        doc_ref = db.collection(u'users')
        query_ref = doc_ref.where(u'Email',u'==',Email).where(u'Password', u'==', password).stream()


        data = []

        for doc in query_ref:
            data = doc.to_dict()

        if len(data) == 0:
            return "Error Code: 10"

        return json.dumps(data)


    #DONE
    def signup_function(self, password, email, DOB, FirstName, LastName):
        doc_ref = db.collection(u'users').document()

        print(signup_data_duplicate_check(email))
        if (signup_data_duplicate_check(email)):
            return "Error Code 10 Email Duplicate"

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

        doc_ref.set(data)

        self.create_overview(doc_ref.id)

        return "Success"

    def create_overview(self, token):
        doc_ref = db.collection(u'overview').document()

        data = {
            u'NumberOfFundraiser' : '0',
            u'PercentageOfSold' : '0',
            u'UpcomingFundraiser' : 'Add a Fundraiser!',
            u'ScoutID'   : str(token)
        }

        doc_ref.set(data)
        return "Success"

    def overview(self, token):

        doc_ref = db.collection(u'overview')
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
    def addFundraiserGroup(self, MoneyRaised, Name, Number_of_teams, StartDate, EndDate, TargetGoal, ScoutID, Location, Time):

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
            u'ScoutID' : ScoutID
        }

        doc_ref.set(data)

        return "Success"


    #See how to Delete Data
    def inventory_delete(self, Name, ScoutID):
        doc_ref = db.collection(u'Inventory').where(u'Name', u'==', str(Name)).where(u'ScoutID', u'==', str(ScoutID)).stream()
        for doc in doc_ref:
            doc.reference.delete()

        return "Success"

    def delete_fundraiser(self, fundraiserID):
        doc_ref = db.collection(u'fundraiser').where(u'fundraiserID', u'==', str(fundraiserID)).stream()
        for doc in doc_ref:
            doc.reference.delete()

        return "Success"


    def inventory_adding(self, Name, Price, Stock, Sold, Category, Type_of_M, ScoutID):

        if request.method == 'GET':
            return "Access Denied"

        doc_ref = db.collection(u'Inventory').document()

        data = {
            u'Name' : str(Name),
            u'Price': str(Price),
            u'Stock': str(Stock),
            u'Sold' : str(Sold),
            u'Category' : str(Category),
            u'Measurement' : str(Type_of_M),
            u'ScoutID' : str(ScoutID)
        }

        doc_ref.set(data)

        return "Success"

    def getting_inventory(self, ScoutID):
        doc_ref = db.collection(u'Inventory')
        query_ref = doc_ref.where(u'ScoutID',u'==',str(ScoutID)).stream()

        data = []

        for docs in query_ref:
            data.append(docs.to_dict())

        if len(data) == 0:
            return "Error Code 10"


        return json.dumps(data)

    def Modify_inventory(self, Name, ScoutID, NameUpdate, PriceUpdate, StockUpdate, SoldUpdate, CategoryUpdate, MeasureUpdate):
        doc_ref = db.collection(u'Inventory').where(u'Name',u'==', str(Name)).where(u'ScoutID', u'==', str("25275")).stream()
        for doc in doc_ref:
            doc.reference.update({
                u'Name' : str(NameUpdate),
                u'Price' : str(PriceUpdate),
                u'Stock' : str(StockUpdate),
                u'Sold'  : str(SoldUpdate),
                u'Category' : str(CategoryUpdate),
                u'Measurement' : str(MeasureUpdate)
                })

        return "Success"

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
    def members(self, ScoutID):
        doc_ref = db.collection(u'member')
        query_ref = doc_ref.where(u'ScoutID',u'==',str(ScoutID)).stream()

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
    def addScoutMembers(self, FirstName, LastName, NumberOfSales,StockHad, Rank, ScoutID):

        doc_ref = db.collection(u'member').document()

        data = {
            u'FirstName' : str(FirstName),
            u'LastName'  : str(LastName),
            u'NumberOfSales' : str(NumberOfSales),
            u'StockHad' : str(StockHad),
            u'Rank' : str(Rank),
            u'ScoutID' : str(ScoutID)
        }


        doc_ref.set(data)
        return "Success"

    def getting_closestEvent(self, ScoutID):

        doc_ref = db.collection(u'fundraiser')
        query_ref = doc_ref.where(u'ScoutID',u'==',str(ScoutID)).stream()

        data = []
        for docs in query_ref:
            data.append(docs.to_dict())

        now = datetime.date.today()
        event_date = datetime.date(1000, 5, 5)
        temp = datetime.date.today()
        object = []

        for item in data:
            object_date = item['StartDate']
            object_date = object_date.split('/')
            current_event = datetime.date(int(object_date[2]), int(object_date[0]), int(object_date[1]))

            first = now - current_event
            second = now - event_date
            if abs(first) < abs(second):
                event_date = current_event
                object = item

        if object is None:
            return "No Fundraisers"

        return json.dumps(object)

    def forgot_password(self, Email):

        doc_ref = db.collection(u'users')
        query_ref = doc_ref.where(u'Email', u'==', str(Email)).stream()

        data = []
        password = ''
        for docs in query_ref:
            data.append(docs.to_dict())
            password = docs['Password']


        if len(data) == 0:
            return "Email Not Found"

        message = Mail(
            from_email='metwally.bassam@gmail.com',
            to_emails=str(Email),
            subject='Password Reset for ScoutBoard',
            html_content='Your Password is : {}'.format(password))
        try:
            sg = SendGridAPIClient(os.environ.get('SENDGRID_API_KEY'))
            response = sg.send(message)
        except Exception as e:
           return str(e)


    def change_password(self, Email, Password, UpdatedPassword):

        doc_ref = db.collection(u'users')
        query_ref = doc_ref.where(u'Email',u'==',Email).where(u'Password', u'==', Password).stream()

        #query_ref.update()

        return "None"


    def delete_fundraiser(self, Name, ScoutID):
        doc_ref = db.collection(u'members').where(u'Name', u'==', str(Name)).where(u'ScoutID', u'==', str(ScoutID)).stream()
        for doc in doc_ref:
            doc.reference.delete()

        return "Success"
