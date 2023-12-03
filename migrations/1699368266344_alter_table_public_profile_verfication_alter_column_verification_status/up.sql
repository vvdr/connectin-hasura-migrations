ALTER TABLE "public"."profile_verfication" ALTER COLUMN "verification_status" TYPE text;
alter table "public"."profile_verfication" alter column "verification_status" set default 'unrejected';
