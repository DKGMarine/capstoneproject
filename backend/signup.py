from flask import Flask, Blueprint, request
import login_database

signup = Blueprint('signup', __name__)

@signup.route('/signup', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    username = request.form.get('username')
    password = request.form.get('password')
    object = login_database.loginDatabase()
    return object.login_function(username, password)
