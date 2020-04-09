from flask import Flask, Blueprint, request
import login_database

addFundraiserGroup = Blueprint('addFundraiserGroup', __name__)

@addFundraiserGroup.route('/addFundraiserGroup', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    money_raised = request.form.get('MoneyRaised')
    name = request.form.get('Name')
    Number_of_teams = request.form.get('NumberOfTeams')
    Start_Date = request.form.get('StartDate')
    Target_Goal = request.form.get('TargetGoal')
    scoutID = request.form.get('ScoutID')
    #fundraiserID is added
    object = login_database.loginDatabase()
    return object.addFundraiserGroup(money_raised, name, Number_of_teams, Start_Date, Target_Goal, scoutID)
