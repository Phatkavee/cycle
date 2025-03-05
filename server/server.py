import pymysql
from werkzeug.wrappers import Request, Response
from flask import flash, render_template, request
from flask import jsonify
from flask import Flask
from flaskext.mysql import MySQL

app = Flask(__name__)
mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'emp'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

@app.route("/")
def hello():
    return """
    Flask API !<br>
    <a href='/new_user'>add</a>insert new<br>
    <a href='/emp'>emp</a>Show all<br>
    <b>/create</b> Insert new Record<br>
    <b>/emp/<id></b> get by ID<br>
    <b>/update/<id></b> Edit info<br>
    <b>/delete/<id></b> Delete by  ID<br>
    """
# @app.route('/new_user')
# def add_user_view():
#     return render_template('add.html')

@app.route('/create', methods=['POST'])
def create_emp():
    try:        
        _json = request.json
        print(_json)
        _name = _json['name']
        _email = _json['email']
        _weight = _json['weight']
        _height = _json['height']
        _status = _json['status']
        if _name and _email and _weight and _height and _status and request.method == 'POST':
            conn = mysql.connect()
            cursor = conn.cursor(pymysql.cursors.DictCursor)
            sqlQuery = "INSERT INTO emp2(name, email, weight, height, status) VALUES(%s, %s, %s, %s, %s)"
            bindData = (_name, _email, _weight, _height, _status)            
            cursor.execute(sqlQuery, bindData)
            conn.commit()
            respone = jsonify('Employee added successfully!')
            respone.status_code = 200
            #flash('User added successfully!')
            #redirect('/')
            return respone
        else:
            return showMessage()
    except Exception as e:
        print(e)
    finally:
        if cursor:
            cursor.close() 
        if conn:
            conn.close()
        
@app.route('/emp')
def emp():
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute("SELECT id, name, email, weight, height, status FROM emp2")
        empRows = cursor.fetchall()
        respone = jsonify(empRows)
        respone.status_code = 200
        return respone
    except Exception as e:
        print(e)
    finally:
        if cursor:
            cursor.close() 
        if conn:
            conn.close() 

@app.route('/emp/<int:emp_id>')
def emp_details(emp_id):
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute("SELECT id, name, email, weight, height, status FROM emp2 WHERE id =%s", emp_id)
        empRow = cursor.fetchone()
        respone = jsonify(empRow)
        respone.status_code = 200
        return respone
    except Exception as e:
        print(e)
    finally:
        if cursor:
            cursor.close() 
        if conn:
            conn.close()

@app.route('/update/<int:emp_id>', methods=['PUT'])
def update_emp(emp_id):
    try:
        _json = request.json
        # _id = _json['id']
        _name = _json['name']
        _email = _json['email']
        _weight = _json['weight']
        _height = _json['height']
        _status = _json['status']
        if _name and _email and _weight and _height and _status and emp_id and request.method == 'PUT':
            sqlQuery = "UPDATE emp2 SET name=%s, email=%s, weight=%s, height=%s, status=%s WHERE id=%s"
            bindData = (_name, _email, _weight, _height, _status, emp_id,)
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.execute(sqlQuery, bindData)
            conn.commit()
            respone = jsonify('Employee updated successfully!')
            respone.status_code = 200
            return respone
        else:
            return showMessage()
    except Exception as e:
        print(e)
    finally:
        if cursor:
            cursor.close() 
        if conn:
            conn.close()

@app.route('/delete/<int:emp_id>', methods=['DELETE'])
def delete_emp(emp_id):
    try:
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM emp2 WHERE id =%s", (emp_id,))
        conn.commit()
        respone = jsonify('Employee deleted successfully!')
        respone.status_code = 200
        return respone
    except Exception as e:
        print(e)
    finally:
        if cursor:
            cursor.close() 
        if conn:
            conn.close()      

if __name__ == '__main__':
    from werkzeug.serving import run_simple
    app.debug = True
    run_simple('127.0.0.1', 3000, app) # change port number
    