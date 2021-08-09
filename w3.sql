-- Add all remote tables for s (make sure they match their counterparts)
CREATE REMOTE TABLE s1 (s_pk INT, i INT) on 'mapi:monetdb://localhost:60001/mdb1';
ALTER TABLE s1 ADD CONSTRAINT s1_pk PRIMARY KEY (s_pk);
CREATE REMOTE TABLE s2 (s_pk INT, i INT) on 'mapi:monetdb://localhost:60002/mdb2';
ALTER TABLE s2 ADD CONSTRAINT s2_pk PRIMARY KEY (s_pk);

-- Setup the comb s table
CREATE MERGE TABLE s_combined (s_pk INT, i INT);
ALTER TABLE s_combined ADD CONSTRAINT sc_pk PRIMARY KEY (s_pk);
ALTER TABLE s_combined ADD TABLE s1;
ALTER TABLE s_combined ADD TABLE s2;

-- Add all remote tables for t (make sure they match their counterparts)
CREATE REMOTE TABLE t1 (t_pk INT, t_fk INT, s VARCHAR(10)) on 'mapi:monetdb://localhost:60001/mdb1';
ALTER TABLE t1 ADD CONSTRAINT t1_pk PRIMARY KEY (t_pk);
ALTER TABLE t1 ADD CONSTRAINT t1_fk FOREIGN KEY (t_fk) references s_combined;
CREATE REMOTE TABLE t2 (t_pk INT, t_fk INT, s VARCHAR(10)) on 'mapi:monetdb://localhost:60002/mdb2';
ALTER TABLE t2 ADD CONSTRAINT t2_pk PRIMARY KEY (t_pk);
ALTER TABLE t2 ADD CONSTRAINT t2_fk FOREIGN KEY (t_fk) references s_combined;

-- Setup the comb table for t
CREATE MERGE TABLE t_combined (t_pk INT, t_fk INT, s VARCHAR(10));
ALTER TABLE t_combined ADD CONSTRAINT tc_pk PRIMARY KEY (t_pk);
ALTER TABLE t_combined ADD CONSTRAINT tc_fk FOREIGN KEY (t_fk) references s_combined;
ALTER TABLE t_combined ADD TABLE t1;
ALTER TABLE t_combined ADD TABLE t2;
