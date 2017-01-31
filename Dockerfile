
FROM python
RUN apt-get update && apt-get install -y vim
RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi 
RUN pip install --upgrade pip && pip install flask && pip install uWSGI && pip install requests && pip install redis
WORKDIR /app

COPY app /app
COPY cmd.sh /
EXPOSE 9090 9191

USER uwsgi
CMD ["/cmd.sh"]
