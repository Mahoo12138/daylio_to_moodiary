/*
 Navicat Premium Data Transfer

 Source Server         : daylio
 Source Server Type    : SQLite
 Source Server Version : 3035005 (3.35.5)
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3035005 (3.35.5)
 File Encoding         : 65001

 Date: 20/12/2024 14:09:59
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for table_tags
-- ----------------------------
DROP TABLE IF EXISTS "table_tags";
CREATE TABLE "table_tags" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "name" TEXT,
  "icon" INTEGER,
  "created_at" INTEGER,
  "order_number" INTEGER,
  "state" INTEGER,
  "id_tag_group" INTEGER
);

-- ----------------------------
-- Auto increment value for table_tags
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 87 WHERE name = 'table_tags';

PRAGMA foreign_keys = true;
