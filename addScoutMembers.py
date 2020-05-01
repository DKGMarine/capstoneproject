from flask import Flask, Blueprint, request
import login_database

addScoutMembers = Blueprint('addScoutMembers', __name__)

@addScoutMembers.route('/addScoutMembers', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    FirstName = request.form.get('FirstName')
    LastName  = request.form.get('LastName')
    NumberOfSales = request.form.get('Sold')
    StockHad = request.form.get('Stock')
    Rank = request.form.get('Rank')
    ScoutID = request.form.get('ScoutID')
    object = login_database.loginDatabase()
    return object.addScoutMembers(FirstName, LastName, NumberOfSales, StockHad, Rank, ScoutID)
