-- Setup local s2 table
CREATE TABLE s2 (s_pk INT, i INT);
ALTER TABLE s2 ADD CONSTRAINT s2_pk PRIMARY KEY (s_pk);
INSERT INTO s2 VALUES (2, 100), (3, 77);

-- Setup local t2 table
CREATE TABLE t2 (t_pk INT, t_fk INT, s VARCHAR(10));
ALTER TABLE t2 ADD CONSTRAINT t2_pk PRIMARY KEY (t_pk);
INSERT INTO t2 VALUES (2, 3, 'hij'), (3, 1, 'klm');
