ALTER TABLE ONLY "public"."organizations" ALTER COLUMN "additional_admins" SET DEFAULT jsonb_build_array();
