--
-- FTS3 Schema 2.0.1
-- [FTS-597] Drop unused tables
--

DROP TABLE t_credential_vers;
DROP TABLE t_se_acl;
DROP TABLE t_se_pair_acl;

INSERT INTO t_schema_vers (major, minor, patch, message)
VALUES (2, 0, 1, 'FTS-597 diff');
