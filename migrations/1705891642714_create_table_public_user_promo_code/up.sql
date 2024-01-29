CREATE TABLE "public"."user_promo_code" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "user_id" uuid NOT NULL, "promo_code_id" uuid NOT NULL, "expiry_date" timestamptz NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id") ON UPDATE no action ON DELETE no action, FOREIGN KEY ("promo_code_id") REFERENCES "public"."promo_table"("id") ON UPDATE no action ON DELETE no action);COMMENT ON TABLE "public"."user_promo_code" IS E'table for storing information related to active promo code used by users';
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
CREATE TRIGGER "set_public_user_promo_code_updated_at"
BEFORE UPDATE ON "public"."user_promo_code"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_user_promo_code_updated_at" ON "public"."user_promo_code"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
