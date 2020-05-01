from flask import Flask, Blueprint, request
import login_database

inventory = Blueprint('inventory', __name__)

@inventory.route('/inventory', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    ScoutID = request.form.get('ScoutID')
    object = login_database.loginDatabase()
    return object.getting_inventory(ScoutID)
