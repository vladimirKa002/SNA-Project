from flask_apispec import marshal_with
from flask import request, Blueprint, render_template, abort
from jinja2 import TemplateNotFound
from werkzeug.utils import redirect

from __init__ import session
from schemas import AuthSchema
from flask_login import login_user, logout_user


""" Login page script.
Login and registration of a user."""
login_page = Blueprint('login_page', __name__, template_folder='./static/templates')


@login_page.route('/login')
def render_login():
    try:
        return render_template('login.html')
    except TemplateNotFound:
        abort(404)


@login_page.route('/logout', methods=['POST'])
def logout():
    logout_user()
    return render_template('login.html')


@login_page.route('/register')
def render_register():
    try:
        return render_template('register.html')
    except TemplateNotFound:
        abort(404)


@login_page.route('/user_register', methods=['POST'])
@marshal_with(AuthSchema)
def register():
    from models import User

    login = request.form.get('login')
    user = User.query.filter_by(login=login).first()
    if user:
        return redirect('/register')

    user = User(request)
    session.add(user)
    session.commit()
    if user:
        login_user(user)
    return redirect('/dashboard')


@login_page.route('/user_login', methods=['POST'])
@marshal_with(AuthSchema)
def login():
    from models import User

    try:
        user = User.authenticate(request)
    except Exception as e:
        print(e)
        return redirect('/login')

    if user:
        login_user(user)

    return redirect('/dashboard')