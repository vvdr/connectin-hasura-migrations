CREATE TABLE "public"."reactions" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "name" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("name"));
CREATE EXTENSION IF NOT EXISTS pgcrypto;
