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

app = Flask(__name__)

app.register_blueprint(login)
app.register_blueprint(signup)
app.register_blueprint(overview)
app.register_blueprint(teams)
app.register_blueprint(fundraiserGroups)
app.register_blueprint(addFundraiserGroup)
#app.register_blueprint(addTeams)
#app.register_blueprint(forgotPassword)
#app.register_blueprint(changePassword)
app.register_blueprint(teamMembers)
app.register_blueprint(teamsWithNoFundraiser)
app.register_blueprint(teamsWithFundraiser)

if __name__ == '__main__':
    app.run(debug=True)
    #Port 8080
