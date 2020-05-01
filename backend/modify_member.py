from flask import Flask, Blueprint, request
import login_database

modify_member = Blueprint('modify_member', __name__)

@modifyInventory.route('/modify_member', methods = ['POST', 'GET'])
def main_index():

    if request.method == 'GET':
        return "Access Denied"

    FirstName = request.form.get('FirstName')
    LastName = request.form.get('LastName')
    NumberOfSales = request.form.get('NumberOfSales')
    StockHad = request.form.get('StockHad')
    Rank = request.form.get('Rank')
    memberID = request.form.get('memberID')
    object = login_database.loginDatabase()
    return object.modify_Members(memberID, FirstName, LastName, NumberOfSales, StockHad, Rank)
