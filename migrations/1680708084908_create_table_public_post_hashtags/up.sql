CREATE TABLE "public"."post_hashtags" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "post_id" uuid NOT NULL, "hashtag_id" uuid NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") );
CREATE EXTENSION IF NOT EXISTS pgcrypto;
