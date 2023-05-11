alter table "public"."post_hashtags"
  add constraint "post_hashtags_post_id_fkey"
  foreign key ("post_id")
  references "public"."posts"
  ("id") on update cascade on delete cascade;
