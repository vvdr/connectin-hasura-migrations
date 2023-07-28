CREATE TABLE "public"."friendlist" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "user_id" uuid NOT NULL, "friend_id" uuid NOT NULL, "status" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("friend_id") REFERENCES "public"."users"("user_id") ON UPDATE cascade ON DELETE cascade);COMMENT ON TABLE "public"."friendlist" IS E'table for storing user friend lists';
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
CREATE TRIGGER "set_public_friendlist_updated_at"
BEFORE UPDATE ON "public"."friendlist"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_friendlist_updated_at" ON "public"."friendlist"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
