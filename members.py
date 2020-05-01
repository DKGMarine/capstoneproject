from flask import Flask, Blueprint, request
import login_database

members = Blueprint('members', __name__)

@members.route('/members', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    teamID = request.form.get('ScoutID')
    object = login_database.loginDatabase()
    return object.members(teamID)
