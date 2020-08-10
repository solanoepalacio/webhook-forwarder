FROM python:3.6

WORKDIR /code

COPY ./server.py /code/server.py

COPY ./runservers.sh /code/runservers.sh

RUN chmod u+x ./runservers.sh

CMD [ "bash", "./runservers.sh" ]