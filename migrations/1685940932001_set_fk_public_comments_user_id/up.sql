alter table "public"."comments" drop constraint "comments_user_id_fkey",
  add constraint "comments_user_id_fkey"
  foreign key ("user_id")
  references "public"."users"
  ("user_id") on update no action on delete no action;
