CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "public"."matched_users"("match_id" uuid NOT NULL DEFAULT gen_random_uuid(), "user1" uuid NOT NULL, "user2" uuid NOT NULL, "match_date" timestamp NOT NULL DEFAULT now(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("match_id") , CONSTRAINT "same_user" CHECK (user1 != user2));
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
CREATE TRIGGER "set_public_matched_users_updated_at"
BEFORE UPDATE ON "public"."matched_users"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_matched_users_updated_at" ON "public"."matched_users" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
