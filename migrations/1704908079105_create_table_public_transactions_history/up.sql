CREATE TABLE "public"."transactions_history" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "job_id" uuid NOT NULL, "amount" text NOT NULL, "action" text NOT NULL, "hours" numeric, "minutes" numeric, "invoice_url" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("job_id") REFERENCES "public"."job_listing"("id") ON UPDATE no action ON DELETE no action);
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
CREATE TRIGGER "set_public_transactions_history_updated_at"
BEFORE UPDATE ON "public"."transactions_history"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_transactions_history_updated_at" ON "public"."transactions_history"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
