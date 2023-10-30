CREATE TABLE "public"."user_portfolio_page" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "user_id" uuid NOT NULL, "title" text NOT NULL, "description" text NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id") ON UPDATE restrict ON DELETE restrict);
CREATE EXTENSION IF NOT EXISTS pgcrypto;
