import datetime
from voteapp import db

class Nacosid(db.Model):
    na_id = db.Column(db.Integer(), primary_key=True, autoincrement=True)
    na_studentname = db.Column(db.String(255), nullable=True)
    na_nacosid = db.Column(db.String(255), nullable=True)
    na_studycenter = db.Column(db.String(255), nullable=True)
    na_time = db.Column(db.DateTime(), default=datetime.datetime.utcnow())
    # relationship
    voteobj1 = db.relationship('Vote', back_populates="nacosidobj")


class Vote(db.Model):
    vt_id = db.Column(db.Integer(), primary_key=True, autoincrement=True)
    vt_category = db.Column(db.String(255), nullable=True)
    vt_nacosid = db.Column(db.String(255), nullable=True)
    vt_contestantid = db.Column(db.Integer(), db.ForeignKey("contestant.cont_id"))
    vt_nacosidid = db.Column(db.ForeignKey("nacosid.na_id"))
    vt_time = db.Column(db.DateTime(), default=datetime.datetime.utcnow())
    
    # relationship
    contobj = db.relationship('Contestant', back_populates="voteobj2")
    nacosidobj = db.relationship('Nacosid', back_populates="voteobj1")

class Contestant(db.Model):
    cont_id=db.Column(db.Integer(), primary_key=True, autoincrement=True)
    cont_name = db.Column(db.String(255), nullable=False)
    na_nacosid = db.Column(db.String(255), nullable=False)
    na_nacoslevel = db.Column(db.String(255), nullable=False)
    cont_post = db.Column(db.Enum("none","president","vp","vp special duties", "software director r&i", "developers lead", "gen sec","fin sec","pro1","pro2", "welfare director", "social director", "sport director"), nullable=False, server_default=("none"))
    cont_department = db.Column(db.Enum("none","cs","cse","csm","it"), nullable=False, server_default=("none"))
    cont_studycenter = db.Column(db.String(255), nullable=False)
    cont_pic = db.Column(db.String(255), nullable=False)
    cont_membershipcert = db.Column(db.String(255), nullable=False)
    cont_nominationform = db.Column(db.String(255), nullable=False)
    cont_date =  db.Column(db.DateTime(), default=datetime.datetime.utcnow())
    # relationship
    voteobj2 = db.relationship('Vote', back_populates="contobj")

class Admin(db.Model):
    ad_id = db.Column(db.Integer(), primary_key=True, autoincrement=True)
    ad_name = db.Column(db.String(255), nullable=False)
    ad_email = db.Column(db.String(255), nullable=False)
    ad_pass = db.Column(db.String(255), nullable=False)
    ad_date =  db.Column(db.DateTime(), default=datetime.datetime.utcnow())
    
    