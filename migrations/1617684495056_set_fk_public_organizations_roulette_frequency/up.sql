alter table "public"."organizations"
           add constraint "organizations_roulette_frequency_fkey"
           foreign key ("roulette_frequency")
           references "public"."roulette_frequency"
           ("rf_id") on update restrict on delete restrict;
