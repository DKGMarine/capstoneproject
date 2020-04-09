from flask import Flask, Blueprint, request
import login_database

teams = Blueprint('teams', __name__)

@teams.route('/teams', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    ID = request.form.get('ID')
    object = login_database.loginDatabase()
    return object.teams(ID)
