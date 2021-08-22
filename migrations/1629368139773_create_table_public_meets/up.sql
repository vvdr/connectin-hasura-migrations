CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "public"."meets"("meet_id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "connect_id" uuid NOT NULL, "description" text NOT NULL, PRIMARY KEY ("meet_id") , FOREIGN KEY ("connect_id") REFERENCES "public"."connects"("connect_id") ON UPDATE restrict ON DELETE restrict);
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
CREATE TRIGGER "set_public_meets_updated_at"
BEFORE UPDATE ON "public"."meets"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_meets_updated_at" ON "public"."meets" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
