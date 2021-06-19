alter table "public"."matched_users" drop constraint "matched_users_pkey";
alter table "public"."matched_users"
    add constraint "matched_users_pkey" 
    primary key ( "user2", "user1", "org_id" );
