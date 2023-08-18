CREATE TABLE "public"."gig_review" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "gig_id" uuid NOT NULL, "user_id" uuid NOT NULL, "customer_id" uuid NOT NULL, "user_rating" integer NOT NULL, "customer_rating" integer NOT NULL, "user_review" integer NOT NULL, "customer_review" integer NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("gig_id") REFERENCES "public"."gigs"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id") ON UPDATE restrict ON DELETE restrict);COMMENT ON TABLE "public"."gig_review" IS E'table for storing reviews related to gig';
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
CREATE TRIGGER "set_public_gig_review_updated_at"
BEFORE UPDATE ON "public"."gig_review"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_gig_review_updated_at" ON "public"."gig_review"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
