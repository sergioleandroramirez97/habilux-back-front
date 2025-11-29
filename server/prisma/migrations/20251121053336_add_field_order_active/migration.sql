-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_DynamicField" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "label" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "required" BOOLEAN NOT NULL DEFAULT false,
    "options" TEXT,
    "order" INTEGER NOT NULL DEFAULT 0,
    "active" BOOLEAN NOT NULL DEFAULT true
);
INSERT INTO "new_DynamicField" ("id", "label", "name", "options", "required", "type") SELECT "id", "label", "name", "options", "required", "type" FROM "DynamicField";
DROP TABLE "DynamicField";
ALTER TABLE "new_DynamicField" RENAME TO "DynamicField";
CREATE UNIQUE INDEX "DynamicField_name_key" ON "DynamicField"("name");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
