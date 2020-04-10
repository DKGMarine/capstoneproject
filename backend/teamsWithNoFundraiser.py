from flask import Flask, Blueprint, request
import login_database

teamsWithNoFundraiser = Blueprint('teamsWithNoFundraiser', __name__)

@teamsWithNoFundraiser.route('/teamsWithNoFundraiser', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    object = login_database.loginDatabase()
    return object.teamsWithNoFundraiser("token")
