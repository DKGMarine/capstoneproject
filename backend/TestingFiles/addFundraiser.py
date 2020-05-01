import unittest
import requests
import csv

class BasicTests(unittest.TestCase):

    def test_signup(self):

        print("\nadd Scouts")
        url =  "http://scoutboard.appspot.com/addFundraiserGroup"

        cred = {'MoneyRaised' : "750", 'Name' : 'Cookie Stand', 'NumberOfTeams' : '15', 'StartDate':'4/24/2020', 'EndDate':'4/25/2020', 'ScoutID' : 25275, 'TargetGoal' : '1000', 'Location' : 'Neighborhood', 'Time' : '4:50'}
        post_request_method = requests.post(url, data = cred)
        print(post_request_method.text)


if __name__ == "__main__":
    unittest.main()
