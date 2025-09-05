FROM mcr.microsoft.com/mssql/server:2022-latest
USER root

COPY ./install-samples.sql ./install-samples.sql
COPY ./verify-databases.sql ./verify-databases.sql

RUN mkdir /var/opt/mssql/backup

ADD https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2022.bak  /var/opt/mssql/backup/AdventureWorks2022.bak
ADD https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImporters-Full.bak /var/opt/mssql/backup/WideWorldImporters-Full.bak 

CMD [ "/opt/mssql/bin/sqlservr" ]
