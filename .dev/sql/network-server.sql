-- create the chirpstack_ns user
create role chirpstack_ns with login password 'chirpstack_ns';

-- create the chirpstack_ns database
create database chirpstack_ns with owner chirpstack_ns;
