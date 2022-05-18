ALTER TABLE "public"."org_users" ADD COLUMN "water_cooler_topics" jsonb NOT NULL DEFAULT jsonb_build_array();
