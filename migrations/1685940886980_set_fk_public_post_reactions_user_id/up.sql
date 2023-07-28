alter table "public"."post_reactions" drop constraint "post_reactions_user_id_fkey",
  add constraint "post_reactions_user_id_fkey"
  foreign key ("user_id")
  references "public"."users"
  ("user_id") on update cascade on delete cascade;
