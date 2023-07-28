CREATE TABLE "public"."User_chat" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "sender_id" uuid NOT NULL, "recipient_id" uuid NOT NULL, PRIMARY KEY ("id") );COMMENT ON TABLE "public"."User_chat" IS E'Messages for user chat';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
