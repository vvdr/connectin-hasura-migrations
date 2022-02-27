ALTER TABLE "public"."organizations" ADD COLUMN "allowed_extensions" _text;
ALTER TABLE "public"."organizations" ALTER COLUMN "allowed_extensions" DROP NOT NULL;
