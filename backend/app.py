from flask import Flask, jsonify
from business import get_data

application = Flask(__name__)

@application.route('/')
def hello_world():
    return 'hello, world'

@application.route('/api', methods=['GET'])
def api():
    data = get_data()
    data = {'data': data}
    return jsonify(data)

if __name__ == '__main__':
    application.run(
        host='0.0.0.0',
        port=5000,
        debug=True
    )