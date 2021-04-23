ALTER TABLE ONLY "public"."organizations" ALTER COLUMN "roulette_frequency" SET DEFAULT 'monthly';
ALTER TABLE "public"."organizations" ALTER COLUMN "roulette_frequency" SET NOT NULL;
