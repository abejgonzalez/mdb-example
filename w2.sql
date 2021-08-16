-- Setup local t2 table foreign key
ALTER TABLE t2 ADD CONSTRAINT t2_fk FOREIGN KEY (t_fk) references s2;
