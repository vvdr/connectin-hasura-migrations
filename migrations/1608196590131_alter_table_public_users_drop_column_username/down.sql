ALTER TABLE "public"."users" ADD COLUMN "username" text;
ALTER TABLE "public"."users" ALTER COLUMN "username" DROP NOT NULL;
ALTER TABLE "public"."users" ADD CONSTRAINT users_username_key UNIQUE (username);
