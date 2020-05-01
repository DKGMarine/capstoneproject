from flask import Flask, Blueprint, request
import login_database

deletefundraiser = Blueprint('deletefundraiser', __name__)

@deletefundraiser.route('/deletefundraiser', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    fundraiserID = request.form.get('ID')
    object = login_database.loginDatabase()
    return object.delete_fundraiser(fundraiserID)
