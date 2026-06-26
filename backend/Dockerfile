FROM python:3.8-slim-buster

ADD requirement.txt /app/requirement.txt

RUN pip install -r /app/requirement.txt
ADD . /app
WORKDIR /app
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]
 