import unittest
import requests
import csv

class BasicTests(unittest.TestCase):

    def test_signup(self):

        print("\nGet Scouts")
        url =  "http://127.0.0.1:5000/modifyInventory"

        cred = {'Name' : 'ABC Bakers', 'NameUpdate' : 'ModifyWorks', 'Price' : '5', 'Stock' : '85', 'Sold' : '25', 'Category' : 'OneCookie', 'Type_of_M' :'Box', 'ScoutID' : 25275}
        post_request_method = requests.post(url, data = cred)
        print(post_request_method.text)


if __name__ == "__main__":
    unittest.main()
