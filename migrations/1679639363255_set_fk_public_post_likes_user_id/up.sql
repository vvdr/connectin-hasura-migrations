alter table "public"."post_likes"
  add constraint "post_likes_user_id_fkey"
  foreign key ("user_id")
  references "public"."users"
  ("user_id") on update restrict on delete restrict;
