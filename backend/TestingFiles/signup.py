import unittest
import requests
import csv

class BasicTests(unittest.TestCase):

    def test_signup(self):

        print("\nThe signup test")
        url =  "http://127.0.0.1:5000/signup"

        with open('data.csv') as csv_file:
            csv_reader = csv.reader(csv_file, delimiter=',')
            line_count = 0
            for row in csv_reader:
                if line_count == 0:
                    line_count += 1
                    continue

                else:

                    FirstName = row[0]
                    LastName  = row[1]
                    Email     = row[2]
                    Password  = row[3]
                    DOB       = row[4]

                    cred = {'Email' : str(Email), 'Password': str(Password), 'DOB' : str(DOB), 'FirstName' : str(FirstName), 'LastName' : str(LastName)}
                    post_request_method = requests.post(url, data = cred)
                    print(post_request_method.text)


if __name__ == "__main__":
    unittest.main()
