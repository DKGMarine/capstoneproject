import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
from flask import Flask, request

app = Flask(__name__)

cred = credentials.Certificate('auth.json')
firebase_admin.initialize_app(cred)

db = firestore.client()




@app.route('/login', methods = ['POST', 'GET'])
def hello():
#    doc_ref = db.collection(u'users').document(u'MainPage')
#    doc_ref.set({
#        u'first': u'Ada',
#        u'last': u'Lovelace',
#        u'born': 1915
    #})
    language = request.args.get('username')
    doc_ref = db.collection(u'users')
    query_ref = doc_ref.where(u'first', u'==', u'Ada').stream()
    #
    if request.method == 'POST':
        for doc in query_ref:
            return "You Sent a post request {}".format(doc.to_dict())
    if request.method == 'GET':
        return "You sent a GET request"
    return "Hello World!{}".format(language)


@app.route('/signup', methods = ['POST', 'GET'])
def again():
    doc_ref = db.collection(u'users')
    query_ref = doc_ref.where(u'first', u'==', u'Ada').stream()
    for doc in query_ref:
        print(u'{} => {}'.format(doc.id, doc.to_dict()))


    return "Heyy"

if __name__ == '__main__':
    app.run(debug=True)
