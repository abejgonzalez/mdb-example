-- Setup remote s2 table
CREATE REMOTE TABLE s2 (s_pk INT, i INT) on 'mapi:monetdb://localhost:60002/mdb2';
ALTER TABLE s2 ADD CONSTRAINT s2_pk PRIMARY KEY (s_pk);

-- Setup merge s table
CREATE MERGE TABLE s_combined (s_pk INT, i INT);
ALTER TABLE s_combined ADD CONSTRAINT sc_pk PRIMARY KEY (s_pk);
ALTER TABLE s_combined ADD TABLE s1;
ALTER TABLE s_combined ADD TABLE s2;

-- Setup local t1 table foreign key
ALTER TABLE t1 ADD CONSTRAINT t1_fk FOREIGN KEY (t_fk) references s_combined;
