from flask import Flask, Blueprint, request
import login_database

fundraiserGroups = Blueprint('fundraiserGroups', __name__)

@fundraiserGroups.route('/fundraiserGroups', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    token = request.form.get('ID')
    object = login_database.loginDatabase()
    return object.fundraiserGroups(token)
