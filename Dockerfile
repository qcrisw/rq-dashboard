FROM python:3.6-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
		git \
		gcc \
		libc-dev \
	&& rm -rf /var/lib/apt/lists/*

RUN pip3 install setuptools==45
RUN mkdir /app
WORKDIR /app
ADD . /app
RUN pip3 install -r /app/requirements.txt
RUN python3 setup.py develop

ENV PORT 9181
EXPOSE $PORT

ENTRYPOINT [ "rq-dashboard" ]