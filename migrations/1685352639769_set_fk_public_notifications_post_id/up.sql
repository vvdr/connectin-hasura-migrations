alter table "public"."notifications"
  add constraint "notifications_post_id_fkey"
  foreign key ("post_id")
  references "public"."posts"
  ("id") on update cascade on delete cascade;
