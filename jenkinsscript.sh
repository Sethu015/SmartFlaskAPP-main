#!/bin/bash
. ~/.bashrc
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv versions

pyenv global 3.10.0
python3 -m venv myenv --without-pip
source myenv/bin/activate
python3 -V

echo '#### Install requirements ####'
pip install -r ./requirements.txt
pip install pytest-cov

echo '#### Run tests ####'
pytest --cov=main utests --junitxml=./xmlReport/output.xml
coverage xml -o coverage.xml

echo '### deactivate virtual environment ###'
deactivate

pyenv global system
