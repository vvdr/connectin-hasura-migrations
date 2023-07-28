alter table "public"."post_likes" drop constraint "post_likes_user_id_fkey",
  add constraint "post_likes_user_id_fkey"
  foreign key ("user_id")
  references "public"."users"
  ("user_id") on update set null on delete set null;
