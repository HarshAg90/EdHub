from flask import Flask, request, jsonify

app = Flask(__name__)

# define the path to the text file database
# DB_FILE = "database.txt"

DB_FILE = "feeds.json"
DB_OBJECT = {}

All_users = {}
API_KEYS = {"firebase_auth":"","others":""}

class user:
    def __init__(self, email, password, username)  -> None:
        self.username = username
        self.email = email
        self.password= password
        self.college = None
        self.cource = None
        self.stream = None
        self.interests = []

    def personanl_details(self,college,cources,stream,interests):
        self.college = college
        self.cource = cources
        self.stream = stream
        self.interests = interests
        
    def get_interest_based_feeds(self):
        
        pass

    def get_letest_feeds(self):

        pass

@app.route("/auth_key")
def get_key():
    return "key"

@app.route('/signup', methods=['POST'])
def signup():
    data = request.json.get('data')
    
    new_user = user(username= data['username'],password= data['password'],email= data['email'])
    All_users[data['username']]= new_user

    return jsonify({'status':"True", "user_details":{"username": new_user.username, "email":new_user.email}})


@app.route('/login', methods=['POST'])
def login():

    data = request.json.get('data')
    
    # get some kind of id from frontend to include in data
    
    pass

@app.route('/append', methods=['POST'])
def append_data():
    data = request.json.get('data')

    # add post based on types of posts we decide to have

    return jsonify({'message': 'Data appended to database.'})


@app.route("/get_recomendation", method=["GET"])
def preference_recomendataions():

    # sort through data

    pass


if __name__ == '__main__':
    app.run(debug=True)