import unittest
import requests
import csv

class BasicTests(unittest.TestCase):

    def test_signup(self):

        print("\nadd Scouts")
        url =  "http://127.0.0.1:5000/fundraiserGroups"

        cred = {'ID' : 25275}
        post_request_method = requests.post(url, data = cred)
        print(post_request_method.text)


if __name__ == "__main__":
    unittest.main()
