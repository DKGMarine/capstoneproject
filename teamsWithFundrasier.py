from flask import Flask, Blueprint, request
import login_database

teamsWithFundraiser = Blueprint('teamsWithFundraiser', __name__)

@teamsWithFundraiser.route('/teamsWithFundraiser', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    username = request.form.get('username')
    password = request.form.get('password')
    fundraiserID = request.form.get('ID')
    object = login_database.loginDatabase()
    return object.teamWithOneFundraiser("Hey")
