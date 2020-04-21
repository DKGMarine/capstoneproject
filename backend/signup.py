from flask import Flask, Blueprint, request
import login_database

signup = Blueprint('signup', __name__)

@signup.route('/signup', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    email = request.form.get('Email')
    password = request.form.get('Password')
    DOB = request.form.get('DOB')
    FirstName = request.form.get('FirstName')
    LastName = request.form.get('LastName')
    object = login_database.loginDatabase()
    return object.signup_function(password, email, DOB, FirstName, LastName)
