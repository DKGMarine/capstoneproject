import unittest
import requests
import csv

class BasicTests(unittest.TestCase):

    def test_signup(self):

        print("\nDelete Inventory")
        url =  "http://127.0.0.1:5000/inventoryDelete"

        cred = {'Name' : str("ThinMints"), 'ID': str(25275)}
        post_request_method = requests.post(url, data = cred)
        print(post_request_method.text)


if __name__ == "__main__":
    unittest.main()
