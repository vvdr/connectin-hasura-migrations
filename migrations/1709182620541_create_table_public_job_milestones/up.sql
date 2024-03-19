CREATE TABLE "public"."job_milestones" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "job_id" uuid NOT NULL, "description" text NOT NULL, "due_date" text NOT NULL, "amount" numeric NOT NULL, "status" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "fund_status" text NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("job_id") REFERENCES "public"."job_listing"("id") ON UPDATE no action ON DELETE cascade);
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
CREATE TRIGGER "set_public_job_milestones_updated_at"
BEFORE UPDATE ON "public"."job_milestones"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_job_milestones_updated_at" ON "public"."job_milestones"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
