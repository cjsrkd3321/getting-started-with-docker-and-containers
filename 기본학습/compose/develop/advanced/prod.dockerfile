ARG IMAGE_VERSION=3.12-alpine
FROM python:${IMAGE_VERSION}

WORKDIR /code

RUN pip install flask redis

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

COPY . .

EXPOSE 5000

ENTRYPOINT [ "flask" ]
CMD ["run"]