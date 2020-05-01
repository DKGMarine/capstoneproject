from flask import Flask, Blueprint, request
import login_database

addFundraiserGroup = Blueprint('addFundraiserGroup', __name__)

@addFundraiserGroup.route('/addFundraiserGroup', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    MoneyRaised = request.form.get('MoneyRaised')
    Name = request.form.get('Name')
    Number_of_teams = request.form.get('NumberOfTeams')
    Start_Date = request.form.get('StartDate')
    EndDate = request.form.get('EndDate')
    TargetGoal = request.form.get('TargetGoal')
    ScoutID = request.form.get('ScoutID')
    Location = request.form.get('Location')
    Time = request.form.get('Time')
    #fundraiserID is added
    object = login_database.loginDatabase()
    return object.addFundraiserGroup(MoneyRaised, Name, Number_of_teams, Start_Date, EndDate, TargetGoal, ScoutID, Location, Time)
