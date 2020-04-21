from flask import Flask, Blueprint, request
import login_database

inventory = Blueprint('inventory', __name__)

@inventory.route('/inventory', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    Name = request.form.get('Name')
    Price = request.form.get('Price')
    Stock = request.form.get('Stock')
    Sold = request.form.get('Sold')
    Category = request.form.get('Category')
    Measurement = request.form.get('Measurement')
    ScoutID = request.form.get('ScoutID')
    object = login_database.loginDatabase()
    return object.inventory_adding(Name, Price, Stock, Sold, Category, Measurement, ScoutID)
