# Container image that runs your code
FROM python:3

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
# https://github.com/actions/runner-images/issues/6775
RUN git config --system --add safe.directory ./

COPY . .

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]