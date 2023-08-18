CREATE TABLE "public"."price_tiers" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "gig_id" uuid NOT NULL, "price" integer NOT NULL DEFAULT 0, "title" text NOT NULL, "description" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("gig_id") REFERENCES "public"."gigs"("id") ON UPDATE restrict ON DELETE restrict);COMMENT ON TABLE "public"."price_tiers" IS E'table for price tiers';
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_price_tiers_updated_at"
BEFORE UPDATE ON "public"."price_tiers"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_price_tiers_updated_at" ON "public"."price_tiers"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
