from flask import Flask, request, Blueprint
from login import login
from signup import signup
from overview import overview
from teams import teams
from fundraiserGroups import fundraiserGroups
from addFundraiserGroup import addFundraiserGroup
from teamsWithFundrasier import teamsWithFundraiser
from teamMembers import teamMembers
from teamsWithNoFundraiser import teamsWithNoFundraiser
from inventory import inventory
from inventoryDelete import inventoryDelete
from deletefundraiser import deletefundraiser
from addinventory import addinventory
from addScoutMembers import addScoutMembers

app = Flask(__name__)

#Weston
app.register_blueprint(login)
app.register_blueprint(inventoryDelete)
app.register_blueprint(inventory)
app.register_blueprint(signup)
app.register_blueprint(fundraiserGroups)
app.register_blueprint(addFundraiserGroup)
app.register_blueprint(deletefundraiser)
app.register_blueprint(addinventory)
app.register_blueprint(addScoutMembers)
#Rename This to ScoutMembers
app.register_blueprint(teamMembers)

#Ask Weston about Data
app.register_blueprint(overview)

#Added but not used
app.register_blueprint(teamsWithNoFundraiser)
app.register_blueprint(teamsWithFundraiser)
app.register_blueprint(teams)

#inventory ~ Modfiy ~ Done Just routes

#Next
#app.register_blueprint(forgotPassword)
#app.register_blueprint(changePassword)
#Encryption

if __name__ == '__main__':
    app.run(debug=True)
    #Port 8080
