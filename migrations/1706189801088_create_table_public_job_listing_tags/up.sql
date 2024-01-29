CREATE TABLE "public"."job_listing_tags" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "job_listing_id" uuid NOT NULL, "name" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("job_listing_id") REFERENCES "public"."job_listing"("id") ON UPDATE no action ON DELETE no action);
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
CREATE TRIGGER "set_public_job_listing_tags_updated_at"
BEFORE UPDATE ON "public"."job_listing_tags"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_job_listing_tags_updated_at" ON "public"."job_listing_tags"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
