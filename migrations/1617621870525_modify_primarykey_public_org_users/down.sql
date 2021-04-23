alter table "public"."org_users" drop constraint "org_users_pkey";
alter table "public"."org_users"
    add constraint "org_users_pkey" 
    primary key ( "org_user_id" );
