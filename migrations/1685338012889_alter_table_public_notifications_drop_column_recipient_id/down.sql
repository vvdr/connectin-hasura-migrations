comment on column "public"."notifications"."recipient_id" is E'notification for post';
alter table "public"."notifications" alter column "recipient_id" drop not null;
alter table "public"."notifications" add column "recipient_id" uuid;
