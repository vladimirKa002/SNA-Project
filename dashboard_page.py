import json

from flask import Blueprint, render_template, abort
from flask_login import login_required
from jinja2 import TemplateNotFound

""" Dashboard page script.
Dashboard page displays courses information. """
dashboard_page = Blueprint('dashboard_page', __name__, template_folder='./static/templates')


# Rendering dashboard
@dashboard_page.route('/')
@dashboard_page.route('/dashboard')
@login_required
def render_dashboard():
    from models import Course, Progress
    from schemas import CourseSchema

    from flask_login import current_user
    user = current_user
    courses = Course.query.all()

    courses_info = []
    courses_progress = {}

    schema = CourseSchema()
    for course in courses:
        course_json = schema.dumps(course)
        data = json.loads(course_json)
        courses_info.append(data)
        progresses = Progress.query.filter(Progress.course_id == course.id, Progress.user_id == user.login).count()
        topics_num = len(course.topics)
        if topics_num > 0:
            courses_progress[course.id] = 100 * progresses / topics_num
        else:
            courses_progress[course.id] = 0

    data = {'user_name': user.name + " " + user.surname,
            'user': user.login,
            'courses': courses_info,
            'courses_progress': courses_progress}

    try:
        return render_template('dashboard.html', data=data)
    except TemplateNotFound:
        abort(404)

