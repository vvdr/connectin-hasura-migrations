ALTER TABLE ONLY "public"."organizations" ALTER COLUMN "roulette_frequency" DROP DEFAULT;
ALTER TABLE "public"."organizations" ALTER COLUMN "roulette_frequency" DROP NOT NULL;
