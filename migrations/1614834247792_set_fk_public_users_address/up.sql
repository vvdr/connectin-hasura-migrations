alter table "public"."users"
           add constraint "users_address_fkey"
           foreign key ("address")
           references "public"."address"
           ("address_id") on update restrict on delete restrict;
