import datetime
today = datetime.date.today()
another_day = datetime.date(2019, 5, 2)
final = today-another_day

another = datetime.date(2015, 5, 2)
final2 = today-another

if final > final2:
    print(final2)
    print("BOOm")
else:
    print(final)
    print("hey")
