from flask import Flask, Blueprint, request
import login_database

login = Blueprint('login', __name__)

@login.route('/login', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    Email = request.form.get('Email')
    password = request.form.get('password')
    object = login_database.loginDatabase()
    return object.login_function(Email, password)
