from os import path

from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    database_file = '/app/conf/database'

    if path.isfile(database_file):
        with open('/app/conf/database') as f:
            database = f.read()
    else:
        database = 'Not configured'

    return "My database is: {}".format(database)

if __name__ == "__main__":
    # Only for debugging while developing
    app.run(host='0.0.0.0', debug=True, port=80)
