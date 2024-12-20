/*
 Navicat Premium Data Transfer

 Source Server         : daylio
 Source Server Type    : SQLite
 Source Server Version : 3035005 (3.35.5)
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3035005 (3.35.5)
 File Encoding         : 65001

 Date: 20/12/2024 14:09:26
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for table_entries
-- ----------------------------
DROP TABLE IF EXISTS "table_entries";
CREATE TABLE "table_entries" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "minute" INTEGER,
  "hour" INTEGER,
  "day" INTEGER,
  "month" INTEGER,
  "year" INTEGER,
  "date_time" INTEGER,
  "time_zone_offset" INTEGER,
  "mood" INTEGER,
  "note_title" TEXT,
  "note" TEXT
);

-- ----------------------------
-- Auto increment value for table_entries
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 949 WHERE name = 'table_entries';

PRAGMA foreign_keys = true;
