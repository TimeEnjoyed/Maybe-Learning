FROM python:3.10.11

WORKDIR /app

COPY . .

#RUN apt-get update \
# && apt install software-properties-common -y \
# && add-apt-repository ppa:deadsnakes/ppa -y \
# && apt-get update \
# && apt-get install python3.10 python3-pip -y \
# && python3 -m pip install -e .

RUN python3 -m venv .venv \
 && . .venv/bin/activate \
 && pip install -e '.[dev]'

# install npm
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -  \
 && apt-get install -y nodejs \
 && cd twitch-plays-llm \
 && npm install

EXPOSE 3000
EXPOSE 9511

CMD ["/bin/bash", "docker_init.sh"]
