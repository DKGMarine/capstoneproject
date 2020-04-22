from flask import Flask, Blueprint, request
import login_database

teamMembers = Blueprint('teamMembers', __name__)

@teamMembers.route('/teamMembers', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    teamID = request.form.get('UniqueID')
    object = login_database.loginDatabase()
    return object.teamMembers(teamID)
