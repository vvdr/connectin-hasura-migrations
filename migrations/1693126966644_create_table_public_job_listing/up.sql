CREATE TABLE "public"."job_listing" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "title" text NOT NULL, "description" text NOT NULL, "status" text NOT NULL, "type" text NOT NULL, "fixed_price" integer, "hourly_rate" integer, "hourly_rate_min" integer, "hourly_rate_max" integer, "duration" text NOT NULL, "complexity" text NOT NULL, "posted_by" uuid NOT NULL, "hired" uuid NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("posted_by") REFERENCES "public"."users"("user_id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("hired") REFERENCES "public"."users"("user_id") ON UPDATE restrict ON DELETE restrict);
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
CREATE TRIGGER "set_public_job_listing_updated_at"
BEFORE UPDATE ON "public"."job_listing"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_job_listing_updated_at" ON "public"."job_listing"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
