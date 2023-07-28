alter table "public"."org_users" drop constraint "org_users_org_id_fkey",
  add constraint "org_users_org_id_fkey"
  foreign key ("org_id")
  references "public"."organizations"
  ("org_id") on update restrict on delete restrict;
