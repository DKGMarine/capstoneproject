import unittest
import requests
import csv
import random
cookie_name = ['ABC Bakers' , 'Little Brownie Bakers', 'Thin Mints', 'Samoas', 'Caramel deLites' , 'Peanut Butter Patties']

class BasicTests(unittest.TestCase):

    def test_signup(self):

        print("\nadd Scouts")
        url =  "http://127.0.0.1:5000/addinventory"
        for item in cookie_name:
            Sold = random.randrange(0, 15)
            Stock = random.randrange(25, 100)
            Price = random.randrange(1,10)

            cred = {'Name' : item, 'Price' : str(Price), 'Sold' : str(Sold), 'Stock' : str(Stock), 'ScoutID' : 25275, 'Category' : 'Cookies' , 'Type_of_M' : 'Box'}
            post_request_method = requests.post(url, data = cred)
            print(post_request_method.text)


if __name__ == "__main__":
    unittest.main()
