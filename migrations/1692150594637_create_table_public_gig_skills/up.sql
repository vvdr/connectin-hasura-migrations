CREATE TABLE "public"."gig_skills" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "gig_id" uuid NOT NULL, "title" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("gig_id") REFERENCES "public"."gigs"("id") ON UPDATE restrict ON DELETE restrict);COMMENT ON TABLE "public"."gig_skills" IS E'skill related to gigs';
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
CREATE TRIGGER "set_public_gig_skills_updated_at"
BEFORE UPDATE ON "public"."gig_skills"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_gig_skills_updated_at" ON "public"."gig_skills"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
