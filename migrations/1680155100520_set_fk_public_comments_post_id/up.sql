alter table "public"."comments" drop constraint "comments_post_id_fkey",
  add constraint "comments_post_id_fkey"
  foreign key ("post_id")
  references "public"."posts"
  ("id") on update restrict on delete cascade;
