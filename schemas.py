from marshmallow import Schema, validate, fields


class CourseSchema(Schema): pass


class UserSchema(Schema):
    name = fields.String(required=True, validate=[validate.Length(max=250)])
    surname = fields.String(required=True, validate=[validate.Length(max=250)])
    login = fields.String(required=True, dump_only=True, validate=[validate.Length(max=250)])
    password = fields.String(required=True, dump_only=True, validate=[validate.Length(max=100)], load_only=True)


class UserInfoSchema(Schema):
    login = fields.String(required=True, dump_only=True, validate=[validate.Length(max=250)])


class AnswerSchema(Schema):
    id = fields.Integer(dump_only=True)
    text = fields.String(required=True, validate=[validate.Length(max=50)])
    question_id = fields.Integer(required=True, dump_only=True)


class QuestionSchema(Schema):
    id = fields.Integer(dump_only=True)
    topic_id = fields.Integer(required=True, dump_only=True)
    text = fields.String(required=True, validate=[validate.Length(max=50)])
    answers = fields.Nested(AnswerSchema, many=True)


class TopicSchema(Schema):
    id = fields.Integer(dump_only=True)
    name = fields.String(required=True, validate=[validate.Length(max=50)])
    content = fields.String(required=True)
    course_id = fields.Integer(dump_only=True)
    number = fields.Integer(dump_only=True)
    questions = fields.Nested(QuestionSchema, many=True)


class TopicInfoSchema(Schema):
    id = fields.Integer(dump_only=True)
    name = fields.String(required=True, validate=[validate.Length(max=50)])
    number = fields.Integer(dump_only=True)


class CourseSchema(Schema):
    id = fields.Integer(dump_only=True)
    name = fields.String(required=True, validate=[validate.Length(max=50)])
    description = fields.String(required=True, validate=[validate.Length(max=250)])
    topics = fields.Nested(TopicInfoSchema, many=True)


class ProgressSchema(Schema):
    user_id = fields.String(required=True, dump_only=True)
    course_id = fields.Integer(required=True, dump_only=True)
    topic_id = fields.Integer(required=True, dump_only=True)
    topic = fields.Nested(TopicInfoSchema, many=False)


class AuthSchema(Schema):
    access_token = fields.String(dump_only=True)
    message = fields.String(dump_only=True)

