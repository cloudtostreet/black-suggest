# Container image that runs your code
FROM alpine:3.10

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
COPY apply_patches_as_suggestion.py /apply_patches_as_suggestion.py
COPY requirements.txt /requirements.txt

RUN apk add python3
RUN python3 -m pip install -r requirements.txt

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]