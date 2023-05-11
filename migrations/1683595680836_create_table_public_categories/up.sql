CREATE TABLE "public"."categories" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "name" text NOT NULL, "parent_id" uuid, PRIMARY KEY ("id") );COMMENT ON TABLE "public"."categories" IS E'table to store list of categories and subcategories ';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
