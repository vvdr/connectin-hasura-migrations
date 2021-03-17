CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "public"."address"("city" text NOT NULL, "state" text NOT NULL, "country" text NOT NULL, "id" uuid NOT NULL DEFAULT gen_random_uuid(), PRIMARY KEY ("id") );
