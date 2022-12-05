import os


class Config(object):
    SECRET_KEY = '\x1a\xfd\xa5*N\x13\xc5\xa3\xc2z\x8f-\r\xc8\x82"\xe8\x0b.8\'D\x1eX'
    SQLALCHEMY_POOL_SIZE = 50
    SQLALCHEMY_MAX_OVERFLOW = 10
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SEND_FILE_MAX_AGE_DEFAULT = 0
    SQLALCHEMY_DATABASE_URI = os.environ['SQLALCHEMY_DATABASE_URI']
    APP_FOLDER = os.environ['APP_FOLDER']