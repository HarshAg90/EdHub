from flask import Flask, request, jsonify
import json
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
# define the path to the text file database
# DB_FILE = "database.txt"

DB_FILE = "API/feeds.json"
DB_OBJECT = {}

All_users = {}
API_KEYS = {"firebase_auth": "", "others": ""}


class user:
    def __init__(self, email, password, username) -> None:
        self.username = username
        self.email = email
        self.password = password
        self.college = None
        self.cource = None
        self.stream = None
        self.interests = []

    def personanl_details(self, college, cource, stream, interests):
        self.college = college
        self.cource = cource
        self.stream = stream
        self.interests = interests

    def get_interest_based_feeds(self):
        fetch_All_feeds()
        recomended = {}
        remaining = {}

        for i in DB_OBJECT:
            print(i)
            if DB_OBJECT[i]["topics"] in self.interests:
                recomended[i] = DB_OBJECT[i]
            elif DB_OBJECT[i]["cource"] == self.cource:
                recomended[i] = DB_OBJECT[i]
            else:
                remaining[i] = DB_OBJECT
        return dict(**recomended,**remaining)


@app.route("/auth_key")
def get_key():
    return "key"


@app.route("/")
def home():
    return "welcome to EdHub"


@app.route('/signup', methods=['POST'])
def signup():
    data = request.json.get("data")
    print(data)
    new_user = user(
        username=data['username'],
        password=data['password'],
        email=data['email'])
    All_users[data['username']] = new_user
    print(All_users)
    return jsonify({
        'status': "True",
        "user_details": {
            "username": new_user.username,
            "email": new_user.email}
    })
    return "nice", 201


'''
{
	"data":{
	"username": "harsh",
	"password":"password1",
	"email":"test@123"
	}
}
'''


@app.route('/details_form', methods=['POST'])
def detail_fill():
    data = request.json.get('data')
    current_user = All_users[data["username"]]
    current_user.personanl_details(
        college=data["college"],
        cource=data["cource"],
        stream=data["Stream"],
        interests=data["interests"]
    )
    return jsonify({"status": "True", "message": "Success"})


'''
{
	"data":{
    "username":"harsh",
    "college":"college",
    "cource":"XYZ",
    "Stream":"CS / Business / Science",
    "interests" :["AI","ML"]
}
}
'''


@app.route('/login', methods=['POST'])
def login():

    data = request.json.get('data')

    if All_users[data["username"]]:
        if All_users[data["username"]].password == data["password"]:
            return "login successfull", 200
    # get some kind of id from frontend to include in data

    pass


'''
{
	"data":{
	"username": "harsh",
	"password":"password1",
	"email":"test@123"
	}
}
'''


@app.route('/append', methods=['POST'])
def append_data():
    data = request.json.get('data')
    # add post based on types of posts we decide to have
    return jsonify({'message': 'Data appended to database.'})

# get_recomendation?username=harsh


@app.route("/get_recomendation")
def preference_recomendataions():
    username = request.args.get('username')
    data = json.dumps(All_users[username].get_interest_based_feeds())
    # do something with the query parameter
    # ...

    return data


@app.route("/letest_feeds")
def get_all():
    return fetch_All_feeds()


def fetch_All_feeds():
    global DB_OBJECT

    with open(DB_FILE, 'r') as f:
        DB_OBJECT = json.load(f)

    return DB_OBJECT

# fetch_All_feeds()


if __name__ == '__main__':
    app.run(host="0.0.0.0", port=80)
