#first open init beside the template folder which is the top root init. 
# after the init inside the template next is config.py not in instance
from flask import Flask
from flask_wtf.csrf import CSRFProtect

from flask_sqlalchemy import SQLAlchemy

#instantiate an object of Flask app
app = Flask(__name__, instance_relative_config=True)
csrf=CSRFProtect(app)


#Load the config file
from voteapp import config
app.config.from_object(config.ProductionConfig)
app.config.from_pyfile('config.py', silent=False) #this is the config in instance folders

#database connection
db=SQLAlchemy(app)

#load your routes here
from voteapp.myroutes import routes #since routes is now a module on its own


#load models
from voteapp import models

