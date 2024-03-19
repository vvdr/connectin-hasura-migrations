CREATE TABLE "public"."failed_transaction_record" ("id" uuid NOT NULL, "job_id" uuid NOT NULL, "reason" text, "amount" numeric, "type" text, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("job_id") REFERENCES "public"."job_listing"("id") ON UPDATE no action ON DELETE cascade);
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
CREATE TRIGGER "set_public_failed_transaction_record_updated_at"
BEFORE UPDATE ON "public"."failed_transaction_record"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_failed_transaction_record_updated_at" ON "public"."failed_transaction_record"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
