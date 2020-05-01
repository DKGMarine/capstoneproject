from flask import Flask, request, Blueprint
from login import login
from signup import signup
from overview import overview
from teams import teams
from fundraiserGroups import fundraiserGroups
from addFundraiserGroup import addFundraiserGroup
from teamsWithFundrasier import teamsWithFundraiser
from members import members
from teamsWithNoFundraiser import teamsWithNoFundraiser
from inventory import inventory
from inventoryDelete import inventoryDelete
from deletefundraiser import deletefundraiser
from addinventory import addinventory
from addScoutMembers import addScoutMembers
from modifyInventory import modifyInventory
from getting_closestEvent import getting_closestEvent
from delete_member import delete_member
from modify_fundraiser import modify_fundraiser
from forgot_password import forgot_password

app = Flask(__name__)

app.register_blueprint(login) #Done
app.register_blueprint(inventoryDelete) #Done
app.register_blueprint(inventory)#Done
app.register_blueprint(signup)#Done
app.register_blueprint(fundraiserGroups)#Done
app.register_blueprint(addFundraiserGroup)#Done
app.register_blueprint(deletefundraiser)#Done
app.register_blueprint(addinventory)#Done
app.register_blueprint(addScoutMembers)#done
app.register_blueprint(members)#Done
app.register_blueprint(overview) #Done
app.register_blueprint(getting_closestEvent) #Done
app.register_blueprint(modifyInventory) #Done
app.register_blueprint(delete_member) #Done
app.register_blueprint(modify_fundraiser)#Done

#Added but not used
app.register_blueprint(teamsWithNoFundraiser)
app.register_blueprint(teamsWithFundraiser)
app.register_blueprint(teams)


#Encryption

if __name__ == '__main__':
    app.run(debug=True)
    #Port 8080
