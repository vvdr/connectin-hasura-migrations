alter table "public"."users"
           add constraint "users_race_fkey"
           foreign key ("race")
           references "public"."race"
           ("key") on update restrict on delete restrict;
