from flask import Flask, request, Blueprint
from login import login
from signup import signup
from overview import overview
from teams import teams
from fundraiserGroups import fundraiserGroups
from addFundraiserGroup import addFundraiserGroup

app = Flask(__name__)

app.register_blueprint(login)
app.register_blueprint(signup)
app.register_blueprint(overview)
app.register_blueprint(teams)
app.register_blueprint(fundraiserGroups)
app.register_blueprint(addFundraiserGroup)


if __name__ == '__main__':
    app.run(debug=True)
    #Port 8080
