CREATE TABLE "public"."hashtags" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "name" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") );COMMENT ON TABLE "public"."hashtags" IS E'table for storing hashtags';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
