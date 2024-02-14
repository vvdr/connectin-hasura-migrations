CREATE TABLE "public"."job_rating_reviews" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "job_id" uuid NOT NULL, "buyer_id" uuid NOT NULL, "seller_id" uuid NOT NULL, "buyer_review" text NOT NULL, "seller_review" text NOT NULL, "seller_rating" numeric NOT NULL, "buyer_rating" numeric NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("job_id") REFERENCES "public"."job_listing"("id") ON UPDATE set null ON DELETE set null, FOREIGN KEY ("buyer_id") REFERENCES "public"."users"("user_id") ON UPDATE set null ON DELETE set null, FOREIGN KEY ("seller_id") REFERENCES "public"."users"("user_id") ON UPDATE set null ON DELETE set null);
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
CREATE TRIGGER "set_public_job_rating_reviews_updated_at"
BEFORE UPDATE ON "public"."job_rating_reviews"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_job_rating_reviews_updated_at" ON "public"."job_rating_reviews"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
