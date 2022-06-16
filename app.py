# This file is part of the Housing Cooperative.
#
# Copyright (c) 2022 Serghei Iakovlev
#
# For the full copyright and license information, please view
# the LICENSE file that was distributed with this source code.

from flask import Flask, render_template
from flask import request
from flask_bootstrap import Bootstrap

app = Flask(__name__)
bootstrap = Bootstrap(app)


@app.route('/')
def index():
    user_agent = request.headers.get('User-Agent', 'Undefined')

    return render_template(
        'index.html',
        method=request.method,
        url=request.url,
        user_agent=user_agent,
        remote_addr=request.remote_addr,
    )

@app.route('/user/<name>')
def user(name):
    return render_template('user.html', name=name)

@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html', error=e), 404

@app.errorhandler(500)
def internal_server_error(e):
    return render_template('500.html', error=e), 500
