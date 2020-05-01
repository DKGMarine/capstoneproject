from flask import Flask, Blueprint, request
import login_database

overview = Blueprint('overview', __name__)

@overview.route('/overview', methods = ['POST', 'GET'])
def main_index():
    if request.method == 'GET':
        return "Access Denied"

    token    = request.form.get('ScoutID')
    print(token)
    object = login_database.loginDatabase()
    return object.overview(token)
