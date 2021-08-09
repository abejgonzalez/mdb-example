-- Setup remote s1 table
CREATE REMOTE TABLE s1 (s_pk INT, i INT) on 'mapi:monetdb://localhost:60001/mdb1';
ALTER TABLE s1 ADD CONSTRAINT s1_pk PRIMARY KEY (s_pk);

-- Setup merge s table
CREATE MERGE TABLE s_combined (s_pk INT, i INT);
ALTER TABLE s_combined ADD CONSTRAINT sc_pk PRIMARY KEY (s_pk);
ALTER TABLE s_combined ADD TABLE s2;
ALTER TABLE s_combined ADD TABLE s1;

-- Setup local t2 table foreign key
ALTER TABLE t2 ADD CONSTRAINT t2_fk FOREIGN KEY (t_fk) references s_combined;
