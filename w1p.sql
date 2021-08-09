-- Setup local s1 table
CREATE TABLE s1 (s_pk INT, i INT);
ALTER TABLE s1 ADD CONSTRAINT s1_pk PRIMARY KEY (s_pk);
INSERT INTO s1 VALUES (0, 23), (1, 42);

-- Setup local t1 table
CREATE TABLE t1 (t_pk INT, t_fk INT, s VARCHAR(10));
ALTER TABLE t1 ADD CONSTRAINT t1_pk PRIMARY KEY (t_pk);
INSERT INTO t1 VALUES (0, 0, 'abc'), (1, 2, 'efg');
