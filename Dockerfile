# Container image that runs your code
FROM python:3

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Let git know that this directory is safe. 
#  Necessary due to this debain patch that's affecting github CIs
# https://github.com/actions/runner-images/issues/6775
RUN git config --system --add safe.directory /github/workspace

COPY . .

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]