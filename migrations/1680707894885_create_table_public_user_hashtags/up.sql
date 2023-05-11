CREATE TABLE "public"."user_hashtags" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "user_id" uuid NOT NULL, "hashtag_id" uuid NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") );COMMENT ON TABLE "public"."user_hashtags" IS E'This table will store the relationships between users and the hashtags they follow';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
