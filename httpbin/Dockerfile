FROM python:3.5
EXPOSE 8000
RUN pip install gunicorn httpbin
CMD gunicorn --bind=0.0.0.0:8000 httpbin:app
