BEGIN TRANSACTION;
ALTER TABLE "public"."category_images" DROP CONSTRAINT "category_image_pkey";

ALTER TABLE "public"."category_images"
    ADD CONSTRAINT "category_image_pkey" PRIMARY KEY ("id", "category");
COMMIT TRANSACTION;
