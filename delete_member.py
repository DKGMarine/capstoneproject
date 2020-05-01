from flask import Flask, Blueprint, request
import login_database

delete_member = Blueprint('delete_member', __name__)

@delete_member.route('/delete_member', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    fundraiserID = request.form.get('ID')
    member_name = request.form.get('Name')
    ScoutID     = request.form.get('ScoutID')
    object = login_database.loginDatabase()
    return object.delete_fundraiser(fundraiserID)
