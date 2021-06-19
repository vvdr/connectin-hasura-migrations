alter table "public"."matched_users"
           add constraint "matched_users_org_id_fkey"
           foreign key ("org_id")
           references "public"."organizations"
           ("org_id") on update restrict on delete restrict;
