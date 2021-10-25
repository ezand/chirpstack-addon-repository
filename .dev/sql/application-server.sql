-- create the chirpstack_as user
create role chirpstack_as with login password 'chirpstack_as';

-- create the chirpstack_as database
create database chirpstack_as with owner chirpstack_as;

-- enable the trigram and hstore extensions
\c chirpstack_as
create extension pg_trgm;
create extension hstore;
