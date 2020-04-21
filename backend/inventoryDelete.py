from flask import Flask, Blueprint, request
import login_database

inventoryDelete = Blueprint('inventoryDelete', __name__)

@inventoryDelete.route('/inventoryDelete', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    Name = request.form.get('Name')
    ID = request.form.get('ID')
    object = login_database.loginDatabase()
    return object.inventory_delete(Name, ID)
