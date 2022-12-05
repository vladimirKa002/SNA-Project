from sqlalchemy.orm import relationship
from passlib.hash import bcrypt
from __init__ import Base
import sqlalchemy as db


class User(Base):
    __tablename__ = 'Users'
    login = db.Column(db.String(250), primary_key=True, nullable=False, unique=True)
    name = db.Column(db.String(250), nullable=False)
    surname = db.Column(db.String(250), nullable=False)
    password = db.Column(db.String(100), nullable=False)

    def __init__(self, request=None):
        self.name = request.form['name']
        self.surname = request.form['surname']
        self.login = request.form['login']
        self.password = bcrypt.hash(request.form['password'])

    @classmethod
    def authenticate(cls, request):
        user = cls.query.filter(cls.login == request.form['login']).one()
        if not bcrypt.verify(request.form['password'], user.password):
            return None
        return user

    def is_authenticated(self):
        return True

    def is_active(self):
        return True

    def is_anonymous(self):
        return False

    def get_id(self):
        return str(self.login)


class Course(Base):
    __tablename__ = 'Courses'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    description = db.Column(db.String(250), nullable=False)
    topics = relationship('Topic', cascade="all,delete", backref='Courses', lazy=True, order_by="Topic.number")


class Topic(Base):
    __tablename__ = 'Topics'
    id = db.Column(db.Integer, primary_key=True)
    course_id = db.Column(db.Integer, db.ForeignKey("Courses.id"), nullable=False)
    name = db.Column(db.String(50), nullable=False)
    content = db.Column(db.String(), nullable=False)
    number = db.Column(db.Integer, nullable=False)
    questions = relationship('Question', cascade="all,delete", backref='Topic', lazy=True)


class Progress(Base):
    __tablename__ = 'Progresses'
    user_id = db.Column(db.String(250), db.ForeignKey("Users.login"), primary_key=True, nullable=False)
    topic_id = db.Column(db.Integer, db.ForeignKey("Topics.id"), primary_key=True, nullable=False)
    topic = relationship("Topic", foreign_keys="Progress.topic_id")
    course_id = db.Column(db.Integer, db.ForeignKey("Courses.id"), primary_key=True, nullable=False)


class Question(Base):
    __tablename__ = 'Questions'
    id = db.Column(db.Integer, primary_key=True)
    topic_id = db.Column(db.Integer, db.ForeignKey("Topics.id"), nullable=False)
    correct_answer_id = db.Column(db.Integer, nullable=False)
    answers = relationship('Answer', cascade="all,delete", backref='Questions', lazy=True)
    text = db.Column(db.String(50), nullable=False)


class Answer(Base):
    __tablename__ = 'Answers'
    id = db.Column(db.Integer, primary_key=True)
    question_id = db.Column(db.Integer, db.ForeignKey("Questions.id"), nullable=False)
    text = db.Column(db.String(50), nullable=False)

