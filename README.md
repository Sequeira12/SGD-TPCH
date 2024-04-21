# SGD---TPCH

Objectives:

For	each	engine	and	for	comparison	of	the	two	BD	engines:
1.	load	time	graph	(load	without	keys) - DONE
2.	query	time	graph	(search	without	keys),	well	identified	queries	and	their	times
3.	keys	times	(creation	time	for	each	PK	and	FK	key,	well	identified	in	each	case) - DONE
4.	query	times	(key	searches) - DONE
5.	Explain	plan	for	a	fast	and	a	slow	query.
6.	Explain	plan	mysql	VS	postgres	for	a	slow	query - DONE (Para a 17 e 20 que no postgres demoram bué)



The plan is as follows:

    - CreateDB.sh
    - CreateTables.sh
    - ImportData.sh (saves the result in the ImportTime.txt file)
    - DropColumnExtra.sh
    - Run Search.py ​​to perform searches with 5 threads in this case. (ExecuteTime.txt)
    - CreatePK.sh (saves the result in the PKCreation.txt)
    - CreateFK.sh (saves the result in the FKCreation.txt)
    - Run Search.py ​​again, now searching with primary keys and foreign keys.

    In case it is necessary to delete all keys, the DropPKFK.sh script deletes them.
