alter table "public"."org_users" drop constraint "org_users_pkey";
alter table "public"."org_users"
    add constraint "org_users_pkey" 
    primary key ( "user_id", "org_id" );
