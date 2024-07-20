ARG IMAGE_VERSION=3.12-alpine

FROM python:${IMAGE_VERSION}

RUN pip install flask redis

WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
EXPOSE 5000
COPY . .

ENTRYPOINT [ "flask" ]
CMD ["run"]