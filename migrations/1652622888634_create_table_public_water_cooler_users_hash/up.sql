CREATE TABLE "public"."water_cooler_users_hash"("org_id" uuid NOT NULL, "value" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "id" serial NOT NULL, PRIMARY KEY ("id") );
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
CREATE TRIGGER "set_public_water_cooler_users_hash_updated_at"
BEFORE UPDATE ON "public"."water_cooler_users_hash"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_water_cooler_users_hash_updated_at" ON "public"."water_cooler_users_hash" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
