CREATE TABLE "public"."user_interests" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "name" text NOT NULL, "user_id" uuid NOT NULL, PRIMARY KEY ("id") );COMMENT ON TABLE "public"."user_interests" IS E'to save user interests';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
