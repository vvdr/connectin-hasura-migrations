CREATE TABLE "public"."post" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "content" text NOT NULL, "image" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "author" uuid NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("author") REFERENCES "public"."users"("user_id") ON UPDATE restrict ON DELETE restrict);COMMENT ON TABLE "public"."post" IS E'post for newsfeed';
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
CREATE TRIGGER "set_public_post_updated_at"
BEFORE UPDATE ON "public"."post"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_post_updated_at" ON "public"."post"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
