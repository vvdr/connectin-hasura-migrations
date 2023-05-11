alter table "public"."category_images" drop constraint "category_images_pkey";
alter table "public"."category_images"
    add constraint "category_image_pkey"
    primary key ("category", "id");
