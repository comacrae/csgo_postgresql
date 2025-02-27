FROM postgres:latest
ENV POSTGRES_USER=csgo
ENV POSTGRES_PASSWORD=csgo
ENV PORESGRES_DB=csgo
COPY ./dump/csgo_project.tar /docker-entrypoint-initdb.d/
COPY restore.sh /docker-entrypoint-initdb.d/restore.sh
RUN chmod +x /docker-entrypoint-initdb.d/restore.sh