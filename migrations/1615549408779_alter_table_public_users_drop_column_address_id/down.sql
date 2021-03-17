ALTER TABLE "public"."users" ADD COLUMN "address_id" uuid;
ALTER TABLE "public"."users" ALTER COLUMN "address_id" DROP NOT NULL;
ALTER TABLE "public"."users" ADD CONSTRAINT users_address_fkey FOREIGN KEY (address_id) REFERENCES "public"."addresses" (address_id) ON DELETE restrict ON UPDATE restrict;
