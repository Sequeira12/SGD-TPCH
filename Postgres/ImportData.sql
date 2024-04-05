COPY customer FROM '/Users/brunosequeira/Desktop/TPC-H V3.0.1/dbgen/customer.tbl' WITH DELIMITER AS '|'; 
COPY lineitem FROM '/Users/brunosequeira/Desktop/TPC-H V3.0.1/dbgen/lineitem.tbl' WITH DELIMITER AS '|'; 
COPY nation FROM '/Users/brunosequeira/Desktop/TPC-H V3.0.1/dbgen/nation.tbl' WITH DELIMITER AS '|';
COPY orders FROM '/Users/brunosequeira/Desktop/TPC-H V3.0.1/dbgen/orders.tbl' WITH DELIMITER AS '|'; 
COPY part FROM '/Users/brunosequeira/Desktop/TPC-H V3.0.1/dbgen/part.tbl' WITH DELIMITER AS '|';
COPY partsupp FROM '/Users/brunosequeira/Desktop/TPC-H V3.0.1/dbgen/partsupp.tbl' WITH DELIMITER AS '|'; 
COPY region FROM '/Users/brunosequeira/Desktop/TPC-H V3.0.1/dbgen/region.tbl' WITH DELIMITER AS '|'; 
COPY supplier FROM '/Users/brunosequeira/Desktop/TPC-H V3.0.1/dbgen/supplier.tbl' WITH DELIMITER AS '|';
