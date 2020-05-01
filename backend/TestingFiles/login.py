import unittest
import requests
import csv

class BasicTests(unittest.TestCase):

    def test_signup(self):

        print("\nThe login test")
        url =  "http://scoutboard.appspot.com/login"

        with open('data.csv') as csv_file:
            csv_reader = csv.reader(csv_file, delimiter=',')
            line_count = 0
            for row in csv_reader:
                if line_count == 0:
                    line_count += 1
                    continue

                else:

                    Email     = row[2]
                    Password  = row[3]

                    cred = {'Email' : str(Email), 'password': str(Password)}
                    post_request_method = requests.post(url, data = cred)
                    print(post_request_method.text)


if __name__ == "__main__":
    unittest.main()
