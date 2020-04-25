import unittest
import requests
import csv

class BasicTests(unittest.TestCase):

    def test_signup(self):

        print("\nDelete Inventory")
        url =  "https://capstoneproject-271322.appspot.com/deletefundraiser"

        cred = {'ID': "1e6pF42HaR1XgzFK69uM"}
        post_request_method = requests.post(url, data = cred)
        print(post_request_method.text)


if __name__ == "__main__":
    unittest.main()
