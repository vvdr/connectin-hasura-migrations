alter table "public"."users"
           add constraint "users_gender_fkey"
           foreign key ("gender")
           references "public"."gender"
           ("key") on update restrict on delete restrict;
