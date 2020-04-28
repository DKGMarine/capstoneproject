from flask import Flask, Blueprint, request
import login_database

forgot_password = Blueprint('forgot_password', __name__)

@forgot_password.route('/forgot_password', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    Email = request.form.get('Email')
    object = login_database.loginDatabase()
    return object.forgot_password(Email)
