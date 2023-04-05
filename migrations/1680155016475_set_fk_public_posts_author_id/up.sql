alter table "public"."posts" drop constraint "post_author_id_fkey",
  add constraint "posts_author_id_fkey"
  foreign key ("author_id")
  references "public"."users"
  ("user_id") on update restrict on delete cascade;
