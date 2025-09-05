# Microsoft SQL Server

Build the image by executing this at the root of the project:

```
docker compose up mssql
```

When the image is running, execute this script to activate the databases:

```
docker compose exec mssql bash -c '/opt/mssql-tools18/bin/sqlcmd -C -U sa -P "superN3rd!" -i ./install-samples.sql'
```

Verify databases are present on the server:

```
docker compose exec mssql bash -c '/opt/mssql-tools18/bin/sqlcmd -C -U sa -P "superN3rd!" -i ./verify-databases.sql'
```

