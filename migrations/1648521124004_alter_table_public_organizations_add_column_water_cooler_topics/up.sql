ALTER TABLE "public"."organizations" ADD COLUMN "water_cooler_topics" jsonb NOT NULL DEFAULT jsonb_build_array('Company News','Sports','Food','Kids activities','Pets','Personal projects','Technology','Vacations','Music','Movies','Theater','Cars and Bikes','Video Games','Books','Misc');
