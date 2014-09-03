#! python3 

from flask import Flask
from flask import render_template
from flaskext.mysql import MySQL

mysql = MySQL()
app = Flask(__name__)
app.config['MYSQL_DATABASE_USER'] = 'interview'
app.config['MYSQL_DATABASE_PASSWORD'] = 'interview'
app.config['MYSQL_DATABASE_DB'] = 'interview'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

@app.route('/')
def index():	
	return render_template('home.html', arg="My Python Solution")

if __name__=="__main__":
    app.run(host='0.0.0.0', port=8080,debug=True)
