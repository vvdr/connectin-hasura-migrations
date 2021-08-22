alter table "public"."meets" drop constraint "meets_connect_id_fkey",
             add constraint "meets_connect_id_fkey"
             foreign key ("connect_id")
             references "public"."connects"
             ("connect_id") on update cascade on delete cascade;
