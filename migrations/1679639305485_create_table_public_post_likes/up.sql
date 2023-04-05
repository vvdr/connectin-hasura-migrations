CREATE TABLE "public"."post_likes" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "user_id" UUID NOT NULL, "post_id" uuid NOT NULL, PRIMARY KEY ("id") );
CREATE EXTENSION IF NOT EXISTS pgcrypto;
