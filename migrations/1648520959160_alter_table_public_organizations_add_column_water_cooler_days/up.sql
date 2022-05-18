ALTER TABLE "public"."organizations" ADD COLUMN "water_cooler_days" jsonb NOT NULL DEFAULT jsonb_build_array('thu');
