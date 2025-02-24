CREATE USER comacrae
WITH
	PASSWORD 'CSGOProject'
	VALID UNTIL '2025-04-01'
	CREATEDB;

GRANT pg_read_server_files TO comacrae;