alter table "public"."organizations" drop constraint "organizations_user_id_fkey",
  add constraint "organizations_user_id_fkey"
  foreign key ("user_id")
  references "public"."users"
  ("user_id") on update cascade on delete cascade;
