alter table "public"."user_experiences"
  add constraint "user_experiences_user_id_fkey"
  foreign key ("user_id")
  references "public"."users"
  ("user_id") on update cascade on delete cascade;
