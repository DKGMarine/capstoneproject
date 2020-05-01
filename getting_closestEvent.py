from flask import Flask, Blueprint, request
import login_database

getting_closestEvent = Blueprint('getting_closestEvent', __name__)

@getting_closestEvent.route('/getting_closestEvent', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    ScoutID = request.form.get('ScoutID')
    object = login_database.loginDatabase()
    return object.getting_closestEvent(ScoutID)
