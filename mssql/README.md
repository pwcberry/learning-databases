# Microsoft SQL Server

Once you have downloaded the sample backups, copy them to the running container:

```
docker compose exec database bash -c 'mkdir /var/opt/mssql/backup'
docker compose cp ~/Downloads/AdventureWorks2022.bak database:/var/opt/mssql/backup/AdventureWorks2022.bak
docker compose cp ~/Downloads/WideWorldImporters-Full.bak database:/var/opt/mssql/backup/WideWorldImporters-Full.bak
```

Copy the SQL scripts and execute:

```
docker compose cp ./install-samples.sql database:/install-samples.sql
docker compose cp ./verify-databases.sql database:/verify-databases.sql
docker compose exec database bash -c '/opt/mssql-tools18/bin/sqlcmd -C -U sa -P "superN3rd!" -i ./install-samples.sql'
```

Verify databases are present on the server:

```
docker compose exec database bash -c '/opt/mssql-tools18/bin/sqlcmd -C -U sa -P "superN3rd!" -i ./verify-databases.sql'
```

