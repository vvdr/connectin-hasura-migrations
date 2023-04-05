alter table "public"."post_likes" drop constraint "post_likes_post_id_fkey",
  add constraint "post_likes_post_id_fkey"
  foreign key ("post_id")
  references "public"."posts"
  ("id") on update restrict on delete cascade;
