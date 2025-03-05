import pymysql
from flask import Flask, request, jsonify
from flaskext.mysql import MySQL

app = Flask(__name__)

mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'root'
app.config['MYSQL_DATABASE_DB'] = 'cycle'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

@app.route("/")
def home():
    return """
    <h2>Flask API (Cycle DB)</h2>
    <p><a href='/cycle'>ดูข้อมูลทั้งหมด</a></p>
    <p>Endpoints:</p>
    <ul>
        <li><b>GET</b> /cycle - ดูข้อมูลทั้งหมด</li>
        <li><b>GET</b> /cycle/&lt;id&gt; - ดูข้อมูลตาม ID</li>
        <li><b>POST</b> /create - เพิ่มข้อมูลใหม่</li>
        <li><b>PUT</b> /update/&lt;id&gt; - อัปเดตข้อมูล</li>
        <li><b>DELETE</b> /delete/&lt;id&gt; - ลบข้อมูล</li>
    </ul>
    """

@app.route('/cycle', methods=['GET'])
def get_all_cycle():
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute("SELECT * FROM cycle")
        data = cursor.fetchall()
        return jsonify(data), 200
    except Exception as e:
        print(e)
        return jsonify({'error': str(e)}), 500
    finally:
        if cursor:
            cursor.close() 
        if conn:
            conn.close()

@app.route('/cycle/<int:cycle_id>', methods=['GET'])
def get_cycle_by_id(cycle_id):
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute("SELECT * FROM cycle WHERE id = %s", (cycle_id,))
        data = cursor.fetchone()
        if data:
            return jsonify(data), 200
        else:
            return jsonify({'error': 'Record not found'}), 404
    except Exception as e:
        print(e)
        return jsonify({'error': str(e)}), 500
    finally:
        if cursor:
            cursor.close() 
        if conn:
            conn.close()

@app.route('/create', methods=['POST'])
def create_cycle():
    try:        
        _json = request.json
        _name = _json['name']
        _age = _json['age']
        _email = _json['email']
        _status = _json['status']
        _weight = _json['weight']
        _height = _json['height']
        
        if _name and _age and _email and _status and _weight and _height:
            conn = mysql.connect()
            cursor = conn.cursor()
            sqlQuery = "INSERT INTO cycle(name, age, email, status, weight, height) VALUES(%s, %s, %s, %s, %s, %s)"
            cursor.execute(sqlQuery, (_name, _age, _email, _status, _weight, _height))
            conn.commit()
            return jsonify({'message': 'Record added successfully!'}), 201
        else:
            return jsonify({'error': 'Invalid input'}), 400
    except Exception as e:
        print(e)
        return jsonify({'error': str(e)}), 500
    finally:
        if cursor:
            cursor.close() 
        if conn:
            conn.close()

@app.route('/update/<int:cycle_id>', methods=['PUT'])
def update_cycle(cycle_id):
    try:
        _json = request.json
        _name = _json['name']
        _age = _json['age']
        _email = _json['email']
        _status = _json['status']
        _weight = _json['weight']
        _height = _json['height']

        if _name and _age and _email and _status and _weight and _height:
            conn = mysql.connect()
            cursor = conn.cursor()
            sqlQuery = "UPDATE cycle SET name=%s, age=%s, email=%s, status=%s, weight=%s, height=%s WHERE id=%s"
            cursor.execute(sqlQuery, (_name, _age, _email, _status, _weight, _height, cycle_id))
            conn.commit()
            return jsonify({'message': 'Record updated successfully!'}), 200
        else:
            return jsonify({'error': 'Invalid input'}), 400
    except Exception as e:
        print(e)
        return jsonify({'error': str(e)}), 500
    finally:
        if cursor:
            cursor.close() 
        if conn:
            conn.close()

@app.route('/delete/<int:cycle_id>', methods=['DELETE'])
def delete_cycle(cycle_id):
    try:
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM cycle WHERE id = %s", (cycle_id,))
        conn.commit()
        return jsonify({'message': 'Record deleted successfully!'}), 204
    except Exception as e:
        print(e)
        return jsonify({'error': str(e)}), 500
    finally:
        if cursor:
            cursor.close() 
        if conn:
            conn.close()

if __name__ == '__main__':
    app.run(host='localhost', port=3000, debug=True)
