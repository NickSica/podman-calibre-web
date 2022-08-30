FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y python3 python3-pip
RUN mkdir /opt/calibre-web && \
		cd tmp && \
		git clone https://github.com/janeczku/calibre-web.git && \
		cp calibre-web/requirements.txt ~/opt/calibre-web/ && \
		cp calibre-web/optional-requirements.txt ~/opt/calibre-web/

RUN && \
		cd /opt/calibre-web && \
		python3 -m pip install -r requirements.txt && \
		python3 -m pip install -r optional-requirements.txt && \
		python3 -m pip install calibreweb && \
		python3 -m pip install calibreweb[gdrive] && \
		python3 -m pip install calibreweb[gmail] && \
		python3 -m pip install calibreweb[goodreads] && \
		python3 -m pip install calibreweb[ldap] && \
		python3 -m pip install calibreweb[oauth] && \
		python3 -m pip install calibreweb[metadata] && \
		python3 -m pip install calibreweb[comics] && \
		python3 -m pip install calibreweb[kobo] && \

ENV XDG_CONFIG_HOME=/config

CMD cps
EXPOSE 8083
VOLUME /config
