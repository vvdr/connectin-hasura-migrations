CREATE TABLE "public"."price_tier_service" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "price_tier_id" uuid NOT NULL, "service_text" text NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("price_tier_id") REFERENCES "public"."price_tiers"("id") ON UPDATE restrict ON DELETE restrict);COMMENT ON TABLE "public"."price_tier_service" IS E'services for price tier';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
