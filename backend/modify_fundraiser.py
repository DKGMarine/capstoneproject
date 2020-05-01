from flask import Flask, Blueprint, request
import login_database

modify_fundraiser = Blueprint('modify_fundraiser', __name__)

@modify_fundraiser.route('/modify_fundraiser', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    MoneyRaised = request.form.get('MoneyRaised')
    Name = request.form.get('Name')
    Number_of_teams = request.form.get('NumberOfTeams')
    Start_Date = request.form.get('StartDate')
    EndDate = request.form.get('EndDate')
    TargetGoal = request.form.get('TargetGoal')
    Location = request.form.get('Location')
    Time = request.form.get('Time')
    fundraiserID = request.form.get('fundraiserID')

    object = login_database.loginDatabase()
    return object.Modify_fundraiser(fundraiserID, Name, Location, Time, Start_Date, EndDate, MoneyRaised, TargetGoal)
