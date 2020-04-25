import unittest
import requests
import csv

class BasicTests(unittest.TestCase):

    def test_signup(self):

        print("\nadd Scouts")
        url =  "http://127.0.0.1:5000/modifyInventory"

        cred = {'Name' : "a7a", 'ScoutID' : '111', 'NameUpdate' : 'ThinMints2', 'Price' : '255', 'Stock' : '123', 'Sold' : '5', 'Category' : 'Cookies' , 'Type_of_M' : 'Pounds'}
        post_request_method = requests.post(url, data = cred)
        print(post_request_method.text)


if __name__ == "__main__":
    unittest.main()
