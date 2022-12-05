import os

from flask import Flask

from flask_login import LoginManager

from sqlalchemy import create_engine
from sqlalchemy.orm import declarative_base, scoped_session, sessionmaker

from config import Config

"""
Launching script. Sets configuration of the app and bounds all blueprints.
"""

app = Flask(__name__, template_folder=os.environ['STATIC_PATH'] + '/templates')

# Reading configuration from Config class
app.config.from_object(Config())

engine = create_engine(os.environ['SQLALCHEMY_DATABASE_URI'],
    pool_size=app.config["SQLALCHEMY_POOL_SIZE"],
                           max_overflow=app.config["SQLALCHEMY_MAX_OVERFLOW"])
session = scoped_session(sessionmaker(autocommit=False, autoflush=False, bind=engine))

Base = declarative_base()
Base.query = session.query_property()


from models import *

Base.metadata.create_all(engine)


login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = '/login'


@login_manager.user_loader
def load_user(login):
    return User.query.filter_by(login=login).first()


from login_page import login_page
app.register_blueprint(login_page)


from dashboard_page import dashboard_page
app.register_blueprint(dashboard_page)


from course_page import course_page
app.register_blueprint(course_page)


# This line of code is used for working from IDE
if os.environ['Environment'] == "Dev":
    if __name__ == "__main__":
        app.run(debug=True)