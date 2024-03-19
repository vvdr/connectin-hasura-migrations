CREATE TABLE "public"."proposal_milestone" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "description" text NOT NULL, "due_date" text NOT NULL, "amount" numeric NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "proposal_id" uuid NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("proposal_id") REFERENCES "public"."job_listing_proposals"("id") ON UPDATE no action ON DELETE cascade);
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
CREATE TRIGGER "set_public_proposal_milestone_updated_at"
BEFORE UPDATE ON "public"."proposal_milestone"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_proposal_milestone_updated_at" ON "public"."proposal_milestone"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
