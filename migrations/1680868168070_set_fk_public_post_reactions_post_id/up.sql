alter table "public"."post_reactions" drop constraint "post_reactions_post_id_fkey",
  add constraint "post_reactions_post_id_fkey"
  foreign key ("post_id")
  references "public"."posts"
  ("id") on update cascade on delete cascade;
