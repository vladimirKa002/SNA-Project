import json

from flask import Blueprint, render_template, abort, request
from flask_login import login_required
from jinja2 import TemplateNotFound

from __init__ import app, session

""" Course page script.
Course page displays current topic for the user. """
course_page = Blueprint('course_page', __name__, template_folder='./static/templates')


# Rendering course page with topic
@course_page.route('/course')
@login_required
def render_course():
    from models import Course, Progress, Topic
    from schemas import TopicSchema

    course_id = request.args.get('course_id')
    topic_id = request.args.get('topic_id')

    from flask_login import current_user
    user = current_user

    course = Course.query.filter_by(id=course_id).first()
    if course is None:
        try:
            return render_template('not_found.html', data={'object': 'course', 'id': course_id})
        except TemplateNotFound:
            abort(404)

    progresses = Progress.query.filter(Progress.course_id == course_id, Progress.user_id == user.login)

    progresses_topics_ids = []
    for p in progresses:
        progresses_topics_ids.append(p.topic.number)

    if topic_id is not None:
        topic = Topic.query.filter(Topic.id == topic_id).first()
        if topic is None:
            return render_template('not_found.html', data={'object': 'topic', 'id': topic_id})
    else:
        min_number = -1
        for t in course.topics:
            if (t.number < min_number or min_number == -1) and t.number not in progresses_topics_ids:
                min_number = t.number
        topic = Topic.query.filter(Topic.course_id == course_id, Topic.number == min_number).first()
    schema = TopicSchema()
    topic_json = schema.dumps(topic)
    topic = json.loads(topic_json)

    progresses_list = []
    if len(progresses_topics_ids) != 0:
        for p in progresses:
            progresses_list.append(p.topic_id)
    data = {'course': course, 'topic': topic, 'progresses': progresses_list}

    try:
        return render_template('course.html', data=data)
    except TemplateNotFound:
        abort(404)


@course_page.route('/check_answers')
@login_required
def check_answers():
    from models import Progress, Course, Topic, Question

    try:
        course_id = int(request.args.get('course'))
        topic_id = int(request.args.get('topic'))
    except Exception:
        return app.response_class(
            status=500,
            mimetype='application/json'
        )

    course = Course.query.filter_by(id=course_id).first()
    if course is None:
        return app.response_class(
            status=404,
            mimetype='application/json'
        )

    topic = Topic.query.filter_by(id=topic_id).first()
    if topic is None or topic.course_id != course.id:
        return app.response_class(
            status=404,
            mimetype='application/json'
        )

    answers = request.args.get('answers')

    correct = True
    try:
        answers = json.loads(answers)
        for question, answer in answers.items():
            question = int(question)
            question = Question.query.filter_by(id=question).first()
            correct = correct and (question.correct_answer_id == answer)
    except Exception:
        return app.response_class(
            status=500,
            mimetype='application/json'
        )
    correct = correct and len(answers.items()) == len(topic.questions)

    if correct:
        from flask_login import current_user
        user = current_user

        progress = Progress.query.filter_by(topic_id=topic_id, course_id=course_id, user_id=user.login).first()
        if progress is None:
            progress = Progress(topic_id=topic_id, course_id=course_id, user_id=user.login)
            session.add(progress)
            session.commit()

    return app.response_class(
        response=json.dumps({'correct': correct}),
        status=200,
        mimetype='application/json'
    )

