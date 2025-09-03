FROM mcr.microsoft.com/mssql/server:2022-latest

COPY install-samples.sql install-samples.sql
COPY verify-databases.sql verify-databases.sql

# Download .bak files
RUN <<EOT
  # check existence of directory
  mkdir /var/opt/mssql/backup
  # download to the new directory
EOT

# Execute when server is running
RUN <<EOT
  /opt/mssql-tools18/bin/sqlcmd -C -U sa -P "superN3rd!" -i ./install-samples.sql
  /opt/mssql-tools18/bin/sqlcmd -C -U sa -P "superN3rd!" -i ./verify-databases.sql
EOT

