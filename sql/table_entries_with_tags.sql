/*
 Navicat Premium Data Transfer

 Source Server         : daylio
 Source Server Type    : SQLite
 Source Server Version : 3035005 (3.35.5)
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3035005 (3.35.5)
 File Encoding         : 65001

 Date: 20/12/2024 14:09:51
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for table_entries_with_tags
-- ----------------------------
DROP TABLE IF EXISTS "table_entries_with_tags";
CREATE TABLE "table_entries_with_tags" (
  "id_entry" INTEGER,
  "id_tag" INTEGER
);

-- ----------------------------
-- Indexes structure for table table_entries_with_tags
-- ----------------------------
CREATE INDEX "id_entry_index"
ON "table_entries_with_tags" (
  "id_entry" ASC
);
CREATE INDEX "id_tag_index"
ON "table_entries_with_tags" (
  "id_tag" ASC
);

PRAGMA foreign_keys = true;
