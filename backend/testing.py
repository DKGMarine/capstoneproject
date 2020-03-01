import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
from flask import Flask

app = Flask(__name__)

cred = credentials.Certificate('auth.json')
firebase_admin.initialize_app(cred)

db = firestore.client()




@app.route('/')
def hello():
    doc_ref = db.collection(u'users').document(u'MainPage')
    doc_ref.set({
        u'first': u'Ada',
        u'last': u'Lovelace',
        u'born': 1915
    })
    return "Hello World!"

@app.route('/home')
def again():
    doc_ref = db.collection(u'users').document(u'HomeRoute')
    doc_ref.set({
        u'first': u'Ada',
        u'last': u'Lovelace',
        u'born': 1915
    })
    return "Hello Page"

if __name__ == '__main__':
    app.run()
