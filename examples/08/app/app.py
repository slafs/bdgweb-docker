# encoding: utf-8

import socket
import redis
from flask import Flask

app = Flask(__name__)
redis = redis.StrictRedis(host='redis_host', port=6379)


@app.route('/', methods=['GET'])
def incr():
    counter = redis.incr('counter', 1)
    host = socket.gethostname()
    return '{0} {1}\n'.format(counter, host)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
