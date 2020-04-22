from flask import Flask, Blueprint, request
import login_database

addinventory = Blueprint('addinventory', __name__)

@addinventory.route('/addinventory', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    Name = request.form.get('Name')
    Price = request.form.get('Price')
    Stock = request.form.get('Stock')
    Sold  = request.form.get('Sold')
    Category = request.form.get('Category')
    Type_of_M = request.form.get('Type_of_M')
    ScoutID = request.form.get('ScoutID')
    object = login_database.loginDatabase()
    return object.inventory_adding(Name, Price, Stock, Sold, Category, Type_of_M, ScoutID)
