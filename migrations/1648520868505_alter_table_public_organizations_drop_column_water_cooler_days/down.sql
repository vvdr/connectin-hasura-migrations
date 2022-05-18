ALTER TABLE "public"."organizations" ADD COLUMN "water_cooler_days" jsonb;
ALTER TABLE "public"."organizations" ALTER COLUMN "water_cooler_days" DROP NOT NULL;
ALTER TABLE "public"."organizations" ALTER COLUMN "water_cooler_days" SET DEFAULT jsonb_build_array('thu');
