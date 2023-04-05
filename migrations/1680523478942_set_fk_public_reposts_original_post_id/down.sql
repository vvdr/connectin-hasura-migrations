alter table "public"."reposts" drop constraint "reposts_original_post_id_fkey",
  add constraint "reposts_original_post_id_fkey"
  foreign key ("original_post_id")
  references "public"."posts"
  ("id") on update restrict on delete restrict;
