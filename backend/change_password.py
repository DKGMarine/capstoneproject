from flask import Flask, Blueprint, request
import login_database

change_password = Blueprint('change_password', __name__)

@change_password.route('/change_password', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    Email = request.form.get('Email')
    password = request.form.get('Password')
    UpdatedPassword = request.form.get('UpdatedPassword')
    object = login_database.loginDatabase()
    return object.forgot_password(Email, password, UpdatedPassword)
