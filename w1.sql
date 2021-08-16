-- Setup local t1 table foreign key
ALTER TABLE t1 ADD CONSTRAINT t1_fk FOREIGN KEY (t_fk) references s1;
