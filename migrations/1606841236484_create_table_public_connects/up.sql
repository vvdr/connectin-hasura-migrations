CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "public"."connects"("connect_id" uuid NOT NULL DEFAULT gen_random_uuid(), "first_name" text NOT NULL, "last_name" text NOT NULL, "email" text NOT NULL, "company_name" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "notes_about_them" text NOT NULL, "notes_what_is_common" text NOT NULL, "notes_advice_wanted" text NOT NULL, "connect_frequency" text NOT NULL, "start_date" timestamptz NOT NULL, "user_id" uuid NOT NULL, PRIMARY KEY ("connect_id") , FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id") ON UPDATE cascade ON DELETE cascade, UNIQUE ("connect_id"));
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
CREATE TRIGGER "set_public_connects_updated_at"
BEFORE UPDATE ON "public"."connects"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_connects_updated_at" ON "public"."connects" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
