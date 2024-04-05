# SGD---TPCH

Postgres is done.

The plan is as follows:

    - CreateDB.sh
    - CreateTables.sh
    - ImportData.sh (saves the result in the ImportTime.txt file)
    - DropColumnExtra.sh
    - Run Search.py ​​to perform searches with 5 threads in this case.
    - CreatePK.sh (saves the result in the PKCreation.txt)
    - CreateFK.sh (saves the result in the FKCreation.txt)
    - Run Search.py ​​again, now searching with primary keys and foreign keys.

    In case it is necessary to delete all keys, the DropPKFK.sh script deletes them.


MySQL is not complete yet.