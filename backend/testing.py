import unittest
import requests


username = [ 'users']#, 'abc']
password = ['pass']

class BasicTests(unittest.TestCase):


    def test_request_response(self):
        print("The Login Test \n")
        url =  "http://127.0.0.1:5000/login"
        for i in username:
            cred = {'username': i, 'password': 'pass'}
            x = requests.post(url, data = cred)
            if (x.text == 'No Data found. Please update User/Signup'):
                print('{} does not have data in the database'.format(i))
            else:
                print(x.text)

    def test_signup(self):

        print("\nThe Signup Test")

        url =  "http://127.0.0.1:5000/signup"

        cred = {'DOB' : '1900', 'username' : 'DemoTest', 'password':'Testin',
         'firstName':'Bassam', 'lastName': 'Metwally'}

        print("Get Method: ")
        get_request_test = requests.get(url)
        print(get_request_test.text)

        print("Post Method: ")
        post_request_method = requests.post(url, cred)
        print(post_request_method.text)


    def test_overview(self):

        print("\nThe Overview test")
        url =  "http://127.0.0.1:5000/overview"

        cred = {'ID' : '25275'}
        print("Post Method: ")
        post_request_method = requests.post(url, data = cred)

        print(post_request_method.text)

    def test_teams(self):
        print("\n The Teams Test")

        url =  "http://127.0.0.1:5000/teams"

        cred = {'ID' : '27275'}

        post_request_method = requests.post(url, data = cred)

        print(post_request_method.text)


    def test_fundraiser(self):
        print("\n The Fundraiser Test")
        url =  "http://127.0.0.1:5000/fundraisersGroups"
        post_request_method = requests.post(url)
        print(post_request_method.text)





if __name__ == "__main__":
    unittest.main()
