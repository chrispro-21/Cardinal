#!/bin/bash

# Cardinal - An Open Source Cisco Wireless Access Point Controller

# MIT License

# Copyright © 2019 Cardinal Contributors

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

pythonTests() {
    echo "INFO: Running Cardinal Python Test Suite..."
    flake8 lib/scout/*.py --count --select=E9,F63,F72,F82 --show-source --statistics
    flake8 bin/scout-cli/*.py --count --select=E9,F63,F72,F82 --show-source --statistics
    flake8 lib/setup.py --count --select=E9,F63,F72,F82 --show-source --statistics
    flake8 ci/tests/*.py --count --select=E9,F63,F72,F82 --show-source --statistics
    flake8 webapp/wsgi.py --count --select=E9,F63,F72,F82 --show-source --statistics
    flake8 webapp/cardinal/system/*.py --count --select=E9,F63,F72,F82 --show-source --statistics
    flake8 webapp/cardinal/views/*.py --count --select=E9,F63,F72,F82 --show-source --statistics
    bandit -s B603,B404 -r bin/scout-cli/* ci/* lib/* webapp/*
}

cardinalTests() {
    python3 ci/tests/testsql.py
    python3 ci/tests/testregex.py
}

pythonTests
cardinalTests
