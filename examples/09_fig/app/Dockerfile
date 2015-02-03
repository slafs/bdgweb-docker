FROM python:2.7

MAINTAINER ja

RUN mkdir /code

WORKDIR /code

ADD requirements.txt /code/

RUN pip install -r ./requirements.txt

ADD app.py /code/

CMD ["python", "app.py"]

EXPOSE 8080
