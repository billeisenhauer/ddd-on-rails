CREATE TABLE "locations" ("un_locode" varchar(255) NOT NULL, "name" varchar(255) NOT NULL);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "index_locations_on_un_locode" ON "locations" ("un_locode");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20140917033204');

