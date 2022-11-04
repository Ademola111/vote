import os, math, random
from datetime import datetime, timedelta, date, time
from itertools import zip_longest
from flask import render_template, request, redirect, flash, session
from werkzeug.security import check_password_hash

from voteapp import app, db
from voteapp.models import Vote, Nacosid, Contestant, Admin

"""homepage"""
@app.route('/', methods=['GET', 'POST'])
def home():
    logid=session.get('nacosid')
    admin=session.get('admin')
    if request.method=='GET':
        if admin:
            return redirect('/logout/')
        else:
            presi=Contestant.query.filter(Contestant.cont_post).all()
            session.pop('nacosid', None)
            return render_template('index.html', presi=presi, logid=logid)
    
    if request.method=='POST':
        nactid = request.form.get('nacosid')
        print(nactid)
        if nactid =="":
            flash('Please enter a valid ID')
            return redirect('/')
        else:
            # checking database for confirmation
            if nactid !="":
                nacid = db.session.query(Nacosid).filter(Nacosid.na_nacosid==nactid).first()
                naid = nacid.na_nacosid
                if naid == nactid and nacid.na_studycenter.lower()=='mccarthy':
                    session['nacosid']=nacid.na_nacosid
                    flash('Login successful')
                    return redirect('/voting/')
                else:
                    flash(f"Your NACOS ID indicate you are from {nacid.na_studycenter} study center, therefore you cant vote")
                    return redirect('/')
            else:
                flash("Your NACOS ID cannot be found. Kindly register to become a member or enter valid ID")
                return redirect('/')

"""Voting Page"""
@app.route('/voting/', methods=['GET', 'POST'])
def voting():
    logid=session.get('nacosid')
    if logid == None:
        return redirect('/')
    vtnaid = Nacosid.query.filter(Nacosid.na_nacosid==logid).first()
    if request.method=='GET':
        presi=Contestant.query.filter(Contestant.cont_post).all()
        # checking if id has voted 
        if logid !="":
            nacid = db.session.query(Vote).filter(Vote.vt_nacosid==logid).first()
            if nacid == None:
                return render_template('voting.html', logid=logid, presi=presi, vtnaid=vtnaid)
            else:
                if nacid:  
                    if nacid.vt_nacosid == logid:
                        nov2 = db.session.query(Vote).filter(Vote.vt_category=="president", Vote.vt_contestantid==1).all()
                        nov = db.session.query(Vote).filter(Vote.vt_category=="president", Vote.vt_contestantid==2).all()
                        nov2i = db.session.query(Vote).filter(Vote.vt_category=="president", Vote.vt_contestantid==3).all()
                        nov3 = db.session.query(Vote).filter(Vote.vt_category=='vice president',Vote.vt_contestantid==1).all()
                        nov3i = db.session.query(Vote).filter(Vote.vt_category=='vice president',Vote.vt_contestantid==2).all()
                        nov3i1 = db.session.query(Vote).filter(Vote.vt_category=='vice president',Vote.vt_contestantid==3).all()
                        # nov4 = db.session.query(Vote).filter(Vote.vt_category=='vice president special duties',Vote.vt_contestantid==1).all()
                        # nov4i = db.session.query(Vote).filter(Vote.vt_category=='vice president special duties',Vote.vt_contestantid==2).all()
                        # nov4ii = db.session.query(Vote).filter(Vote.vt_category=='vice president special duties',Vote.vt_contestantid==3).all()
                        nov5 = db.session.query(Vote).filter(Vote.vt_category=='general secretary',Vote.vt_contestantid==1).all()
                        nov5i = db.session.query(Vote).filter(Vote.vt_category=='general secretary',Vote.vt_contestantid==2).all()
                        nov5ii = db.session.query(Vote).filter(Vote.vt_category=='general secretary',Vote.vt_contestantid==3).all()
                        nov6 = db.session.query(Vote).filter(Vote.vt_category=='financial secretary',Vote.vt_contestantid==1).all()
                        nov6i = db.session.query(Vote).filter(Vote.vt_category=='financial secretary',Vote.vt_contestantid==2).all()
                        nov6ii = db.session.query(Vote).filter(Vote.vt_category=='financial secretary',Vote.vt_contestantid==3).all()
                        nov7 = db.session.query(Vote).filter(Vote.vt_category=='pro1',Vote.vt_contestantid==1).all()
                        nov7i = db.session.query(Vote).filter(Vote.vt_category=='pro1',Vote.vt_contestantid==2).all()
                        nov7ii = db.session.query(Vote).filter(Vote.vt_category=='pro1',Vote.vt_contestantid==3).all()
                        nov8 = db.session.query(Vote).filter(Vote.vt_category=='pro2',Vote.vt_contestantid==1).all()
                        nov8i = db.session.query(Vote).filter(Vote.vt_category=='pro2',Vote.vt_contestantid==2).all()
                        nov8ii = db.session.query(Vote).filter(Vote.vt_category=='pro2',Vote.vt_contestantid==3).all()
                        nov9 = db.session.query(Vote).filter(Vote.vt_category=='software director r&i',Vote.vt_contestantid==1).all()
                        nov9i = db.session.query(Vote).filter(Vote.vt_category=='software director r&i',Vote.vt_contestantid==2).all()
                        nov9ii = db.session.query(Vote).filter(Vote.vt_category=='software director r&i',Vote.vt_contestantid==3).all()
                        nov10 = db.session.query(Vote).filter(Vote.vt_category=='developers lead',Vote.vt_contestantid==1).all()
                        nov10i = db.session.query(Vote).filter(Vote.vt_category=='developers lead',Vote.vt_contestantid==2).all()
                        nov10ii = db.session.query(Vote).filter(Vote.vt_category=='developers lead',Vote.vt_contestantid==3).all()
                        nov11 = db.session.query(Vote).filter(Vote.vt_category=='welfare director',Vote.vt_contestantid==1).all()
                        nov11i = db.session.query(Vote).filter(Vote.vt_category=='welfare director',Vote.vt_contestantid==2).all()
                        nov11ii = db.session.query(Vote).filter(Vote.vt_category=='welfare director',Vote.vt_contestantid==3).all()
                        nov12 = db.session.query(Vote).filter(Vote.vt_category=='social director',Vote.vt_contestantid==1).all()
                        nov12i = db.session.query(Vote).filter(Vote.vt_category=='social director',Vote.vt_contestantid==2).all()
                        nov12ii = db.session.query(Vote).filter(Vote.vt_category=='social director',Vote.vt_contestantid==3).all()
                        nov13 = db.session.query(Vote).filter(Vote.vt_category=='sport director',Vote.vt_contestantid==1).all()
                        nov13i = db.session.query(Vote).filter(Vote.vt_category=='sport director',Vote.vt_contestantid==2).all()
                        nov13ii = db.session.query(Vote).filter(Vote.vt_category=='sport director',Vote.vt_contestantid==3).all()
                        flash('Thank you for exercising your civic responsibilities. Note! You can only vote once.')
                        return render_template('voted.html', logid=logid, nov=nov, nov2=nov2, nov2i=nov2i, nov3=nov3, nov3i=nov3i, nov3i1=nov3i1, nov5=nov5, nov5i=nov5i, nov5ii=nov5ii, nov6=nov6, nov6i=nov6i, nov6ii=nov6ii, nov7=nov7, nov7i=nov7i, nov7ii=nov7ii, nov8=nov8, nov8i=nov8i, nov8ii=nov8ii, nov9=nov9, nov9i=nov9i, nov9ii=nov9ii, nov10=nov10, nov10i=nov10i, nov10ii=nov10ii, nov11=nov11, nov11i=nov11i, nov11ii=nov11ii, nov12=nov12, nov12i=nov12i, nov12ii=nov12ii, nov13=nov13, nov13i=nov13i, nov13ii=nov13ii)
                    
             
    if request.method=='POST':
        getform=request.form
        post1=getform.get('post1')
        post2=getform.get('post2')
        # post3=getform.get('post3')
        post4=getform.get('post4')
        post5=getform.get('post5')
        post6=getform.get('post6')
        post7=getform.get('post7')
        post8=getform.get('post8')
        post9=getform.get('post9')
        post10=getform.get('post10')
        post11=getform.get('post11')
        post12=getform.get('post12')
        votecat1=getform.get('votecat1')
        votecat2=getform.get('votecat2')
        # votecat3=getform.get('votecat3')
        votecat4=getform.get('votecat4')
        votecat5=getform.get('votecat5')
        votecat6=getform.get('votecat6')
        votecat7=getform.get('votecat7')
        votecat8=getform.get('votecat8')
        votecat9=getform.get('votecat9')
        votecat10=getform.get('votecat10')
        votecat11=getform.get('votecat11')
        votecat12=getform.get('votecat12')
        
        
        if logid !="":
            nacid = db.session.query(Vote).filter(Vote.vt_nacosid==logid).first()
            if nacid == None:
                if post1 !="" or post2 !="" or post4 !="" or post5 !="" or post6 !="" or post7 !="" or post8 !="" or post9 !="" or post10 !="" or post11!=""or post12 !=""  or votecat1 !="" or votecat2 !="" or votecat4 !="" or votecat5 !="" or votecat6 !="" or votecat7 !="" or votecat8 !="" or votecat9 !="" or votecat10 !="" or votecat11 !="" or votecat12 !="":
                    vo1=Vote(vt_category=post1, vt_contestantid=votecat1, vt_nacosid=logid, vt_nacosidid=vtnaid.na_id)
                    db.session.add(vo1)
                    db.session.commit()
                    vo2=Vote(vt_category=post2, vt_contestantid=votecat2, vt_nacosid=logid, vt_nacosidid=vtnaid.na_id)
                    db.session.add(vo2)
                    db.session.commit()
                    # vo3=Vote(vt_category=post3, vt_contestantid=votecat3, vt_nacosid=logid, vt_nacosidid=vtnaid.na_id)
                    # db.session.add(vo3)
                    # db.session.commit()
                    vo4=Vote(vt_category=post4, vt_contestantid=votecat4, vt_nacosid=logid, vt_nacosidid=vtnaid.na_id)
                    db.session.add(vo4)
                    db.session.commit()
                    vo5=Vote(vt_category=post5, vt_contestantid=votecat5, vt_nacosid=logid, vt_nacosidid=vtnaid.na_id)
                    db.session.add(vo5)
                    db.session.commit()
                    vo6=Vote(vt_category=post6, vt_contestantid=votecat6, vt_nacosid=logid, vt_nacosidid=vtnaid.na_id)
                    db.session.add(vo6)
                    db.session.commit()
                    vo7=Vote(vt_category=post7, vt_contestantid=votecat7, vt_nacosid=logid, vt_nacosidid=vtnaid.na_id)
                    db.session.add(vo7)
                    db.session.commit()
                    vo8=Vote(vt_category=post8, vt_contestantid=votecat8, vt_nacosid=logid, vt_nacosidid=vtnaid.na_id)
                    db.session.add(vo8)
                    db.session.commit()
                    vo9=Vote(vt_category=post9, vt_contestantid=votecat9, vt_nacosid=logid, vt_nacosidid=vtnaid.na_id)
                    db.session.add(vo9)
                    db.session.commit()
                    vo10=Vote(vt_category=post10, vt_contestantid=votecat10, vt_nacosid=logid, vt_nacosidid=vtnaid.na_id)
                    db.session.add(vo10)
                    db.session.commit()
                    vo11=Vote(vt_category=post11, vt_contestantid=votecat11, vt_nacosid=logid, vt_nacosidid=vtnaid.na_id)
                    db.session.add(vo11)
                    db.session.commit()
                    vo12=Vote(vt_category=post12, vt_contestantid=votecat12, vt_nacosid=logid, vt_nacosidid=vtnaid.na_id)
                    db.session.add(vo12)
                    db.session.commit()                    
                    return redirect('/voted/')
                else:
                    flash('one or more field is empty')
                    return redirect('/voting/')
            else:
                if nacid:
                    session.pop('nacosid', None)
                    flash("You cant vote twice", 'warning')
                    return redirect('/')


"""Voted page with results"""
@app.route('/voted/', methods=['GET', 'POST'])
def voted():
    logid=session.get('nacosid')
    if logid == None:
        return redirect('/')
    
    if request.method=='GET':
        if logid:
            nov2 = db.session.query(Vote).filter(Vote.vt_category=="president", Vote.vt_contestantid==1).all()
            nov = db.session.query(Vote).filter(Vote.vt_category=="president", Vote.vt_contestantid==2).all()
            nov2i = db.session.query(Vote).filter(Vote.vt_category=="president", Vote.vt_contestantid==3).all()
            nov3 = db.session.query(Vote).filter(Vote.vt_category=='vice president',Vote.vt_contestantid==1).all()
            nov3i = db.session.query(Vote).filter(Vote.vt_category=='vice president',Vote.vt_contestantid==2).all()
            nov3i1 = db.session.query(Vote).filter(Vote.vt_category=='vice president',Vote.vt_contestantid==3).all()
            # nov4 = db.session.query(Vote).filter(Vote.vt_category=='vice president special duties',Vote.vt_contestantid==1).all()
            # nov4i = db.session.query(Vote).filter(Vote.vt_category=='vice president special duties',Vote.vt_contestantid==2).all()
            # nov4ii = db.session.query(Vote).filter(Vote.vt_category=='vice president special duties',Vote.vt_contestantid==3).all()
            nov5 = db.session.query(Vote).filter(Vote.vt_category=='general secretary',Vote.vt_contestantid==1).all()
            nov5i = db.session.query(Vote).filter(Vote.vt_category=='general secretary',Vote.vt_contestantid==2).all()
            nov5ii = db.session.query(Vote).filter(Vote.vt_category=='general secretary',Vote.vt_contestantid==3).all()
            nov6 = db.session.query(Vote).filter(Vote.vt_category=='financial secretary',Vote.vt_contestantid==1).all()
            nov6i = db.session.query(Vote).filter(Vote.vt_category=='financial secretary',Vote.vt_contestantid==2).all()
            nov6ii = db.session.query(Vote).filter(Vote.vt_category=='financial secretary',Vote.vt_contestantid==3).all()
            nov7 = db.session.query(Vote).filter(Vote.vt_category=='pro1',Vote.vt_contestantid==1).all()
            nov7i = db.session.query(Vote).filter(Vote.vt_category=='pro1',Vote.vt_contestantid==2).all()
            nov7ii = db.session.query(Vote).filter(Vote.vt_category=='pro1',Vote.vt_contestantid==3).all()
            nov8 = db.session.query(Vote).filter(Vote.vt_category=='pro2',Vote.vt_contestantid==1).all()
            nov8i = db.session.query(Vote).filter(Vote.vt_category=='pro2',Vote.vt_contestantid==2).all()
            nov8ii = db.session.query(Vote).filter(Vote.vt_category=='pro2',Vote.vt_contestantid==3).all()
            nov9 = db.session.query(Vote).filter(Vote.vt_category=='software director r&i',Vote.vt_contestantid==1).all()
            nov9i = db.session.query(Vote).filter(Vote.vt_category=='software director r&i',Vote.vt_contestantid==2).all()
            nov9ii = db.session.query(Vote).filter(Vote.vt_category=='software director r&i',Vote.vt_contestantid==3).all()
            nov10 = db.session.query(Vote).filter(Vote.vt_category=='developers lead',Vote.vt_contestantid==1).all()
            nov10i = db.session.query(Vote).filter(Vote.vt_category=='developers lead',Vote.vt_contestantid==2).all()
            nov10ii = db.session.query(Vote).filter(Vote.vt_category=='developers lead',Vote.vt_contestantid==3).all()
            nov11 = db.session.query(Vote).filter(Vote.vt_category=='welfare director',Vote.vt_contestantid==1).all()
            nov11i = db.session.query(Vote).filter(Vote.vt_category=='welfare director',Vote.vt_contestantid==2).all()
            nov11ii = db.session.query(Vote).filter(Vote.vt_category=='welfare director',Vote.vt_contestantid==3).all()
            nov12 = db.session.query(Vote).filter(Vote.vt_category=='social director',Vote.vt_contestantid==1).all()
            nov12i = db.session.query(Vote).filter(Vote.vt_category=='social director',Vote.vt_contestantid==2).all()
            nov12ii = db.session.query(Vote).filter(Vote.vt_category=='social director',Vote.vt_contestantid==3).all()
            nov13 = db.session.query(Vote).filter(Vote.vt_category=='sport director',Vote.vt_contestantid==1).all()
            nov13i = db.session.query(Vote).filter(Vote.vt_category=='sport director',Vote.vt_contestantid==2).all()
            nov13ii = db.session.query(Vote).filter(Vote.vt_category=='sport director',Vote.vt_contestantid==3).all()
            session.pop('nacosid', None)
            flash(f'Thank you {logid} for exercising your Civic Right.')
            return render_template('voted.html', logid=logid, nov=nov, nov2=nov2, nov2i=nov2i, nov3=nov3, nov3i=nov3i, nov3i1=nov3i1, nov5=nov5, nov5i=nov5i, nov5ii=nov5ii, nov6=nov6, nov6i=nov6i, nov6ii=nov6ii, nov7=nov7, nov7i=nov7i, nov7ii=nov7ii, nov8=nov8, nov8i=nov8i, nov8ii=nov8ii, nov9=nov9, nov9i=nov9i, nov9ii=nov9ii, nov10=nov10, nov10i=nov10i, nov10ii=nov10ii, nov11=nov11, nov11i=nov11i, nov11ii=nov11ii, nov12=nov12, nov12i=nov12i, nov12ii=nov12ii, nov13=nov13, nov13i=nov13i, nov13ii=nov13ii)
        else:
            flash('login to view result.')
            return redirect('/')

"""Contestant Page"""
@app.route("/contestant/", methods=['GET', 'POST'])
def contestant():
    if request.method=='GET':
        return render_template('contestant.html')

    if request.method=='POST':
        const_name=request.form.get('const_name')
        nacosid=request.form.get('nacosid')
        studycent=request.form.get('studycent')
        level=request.form.get('level')
        posti=request.form.get('post')
        dept=request.form.get('dept')
        pic=request.files.get('pic')
        member=request.files.get('member')
        nomination=request.files.get('nomination')
        original_name = pic.filename
        original_name2 = member.filename
        original_name3 = nomination.filename
        
        if const_name!="" or nacosid!="" or studycent!="" or level!="" or posti!="" or dept!="" or pic!="" or member!="":
            #checking if file is not empty
            if original_name !="" or original_name2 !="" or original_name3 !="":
                extension = os.path.splitext(original_name)
                extension2 = os.path.splitext(original_name2)
                extension3 = os.path.splitext(original_name3)
                if extension[1].lower() in ['.jpg','.png','gif'] and extension2[1].lower() in ['.jpg','.png','gif'] and extension3[1].lower() in ['.jpg','.png','gif']:
                    fn=math.ceil(random.random()*10000000000)
                    fn2=math.ceil(random.random()*10000000000)
                    fn3=math.ceil(random.random()*10000000000)
                    save_as=str(fn)+extension[1]
                    save_as2=str(fn2)+extension2[1]
                    save_as3=str(fn2)+extension3[1]                    
                    pic.save(f'voteapp/static/images/contestant/{save_as}')
                    member.save(f'voteapp/static/images/contestant/{save_as2}')
                    nomination.save(f'voteapp/static/images/contestant/{save_as3}')
                    
                    #inserting into the database
                    contst = Contestant(cont_name=const_name, na_nacosid=nacosid, na_nacoslevel=level, cont_post=posti, cont_department=dept, cont_studycenter=studycent, cont_pic=save_as, cont_membershipcert=save_as2, cont_nominationform=save_as3)
                    db.session.add(contst)
                    db.session.commit()
                    flash('Thank you for your interest. Your record has been saved')
                    return redirect("/")
                else:
                    flash("File Type Not Allowed")
                    return redirect("/contestant/")
            else:
                flash('image field is empty')
                return redirect('/contestant')
        else:
            flash('one or more field is empty')
            return redirect('/contestant/')   


"""Admin Login"""
@app.route('/admin/login/', methods=['GET', 'POST'])
def adminlogin():
    admin = session.get('admin')
    
    # rendering login template
    if request.method == 'GET':
        adm=Admin.query.get(admin)
        return render_template('admin.html', adm=adm, admin=admin)
    
    if request.method == 'POST':
        # getting form data
        email=request.form.get('email')
        pwd = request.form.get('pwd')
        # validating form data field
        if email=="" or pwd=="":
            flash('Invalid Credentials', 'danger')
            return redirect('/admin/login/')
        if len(pwd) < 8:
            flash('Password should be 8 character long', 'danger')
            return redirect('/admin/login/')
        if email !="" or pwd !="":
            # quering Customer by filtering with email
            admi=db.session.query(Admin).filter(Admin.ad_email==email).first()
            formated_pwd=admi.ad_pass
            formated_email = admi.ad_email
            # checking password hash
            
            if formated_pwd==pwd and formated_email==email:
                session['admin']=admi.ad_id
                return redirect('/idportal/')
            else:
                flash('kindly supply a valid email address and password', 'warning')
                return render_template('admin.html', admin=admin, admi=admi)


"""student portal"""
@app.route('/idportal/', methods=['GET', 'POST'])
def portal():
    admin = session.get('admin')
    if admin == None:
        return redirect('/')

    # rendering login template
    if request.method == 'GET':
        return render_template('portal.html', admin=admin)
    
    if request.method=='POST':
        idnas=request.form.get('nacosid')
        cent=request.form.get('center')
        name = request.form.get('nacosname')
        
        if idnas !="" or cent !="" or name !="":
            nac=Nacosid(na_nacosid=idnas, na_studycenter=cent, na_studentname=name)
            db.session.add(nac)
            db.session.commit()
            flash('data added, add more or logout below', 'success')
            return redirect('/idportal/')
        else:
            flash('one or more field is empty', 'danger')
            return redirect('/idportal/')

"""Admin logout"""
@app.route('/logout/', methods=['GET'])
def logout():
    admin = session.get('admin')
    if admin == None:
        return redirect('/')

    # rendering login template
    if request.method == 'GET':
        session.pop('admin', None)
        return redirect('/')

"""Error 404 page"""
@app.errorhandler(404)
def page_not_found(error):
    # logid = session.get('nacosid')
    # admin = session.get('admin')
    # if admin==None and logid== None:
    #     return redirect('/')
    # else:
    # adm=Admin.query.get(admin)
    # nac=Nacosid.query.get(logid)
    return render_template('error.html',  error=error),404


"""homepage"""
@app.route('/confirmid', methods=['GET', 'POST'])
def confirmid():
    logid=session.get('nacosid')
    if request.method=='GET':
        if logid==None:
            return redirect('/')
    
    if request.method=='POST':
        nactid = request.form.get('nacosid')
        print(nactid)
        if nactid =="":
            flash('Please enter a valid ID')
            return redirect('/')
        else:
            # checking database for confirmation
            if nactid !="":
                nacid = db.session.query(Nacosid).filter(Nacosid.na_nacosid==nactid).first()
                if nacid ==None:
                    flash(f"Your NACOS ID {nactid} is not available kindly contact the National PRO with your details")
                    return redirect('/')
                else:
                    naid = nacid.na_nacosid                    
                    if naid and naid == nactid:
                        session['nacosid']=nacid.na_nacosid
                        flash(f'Your ID {nacid.na_nacosid} from {nacid.na_studycenter} is available.')
                        return redirect('/')
            else:
                flash("Your NACOS ID {nactid} is not available kindly contact the National PRO with your details")
                return redirect('/')