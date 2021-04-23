CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "public"."org_users"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "org_id" uuid NOT NULL, "user_id" uuid NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("org_id") REFERENCES "public"."organizations"("org_id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("user_id"));
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
CREATE TRIGGER "set_public_org_users_updated_at"
BEFORE UPDATE ON "public"."org_users"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_org_users_updated_at" ON "public"."org_users" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
