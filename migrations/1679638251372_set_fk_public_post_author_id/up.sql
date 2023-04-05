alter table "public"."post" drop constraint "post_author_fkey",
  add constraint "post_author_id_fkey"
  foreign key ("author_id")
  references "public"."users"
  ("user_id") on update restrict on delete restrict;
