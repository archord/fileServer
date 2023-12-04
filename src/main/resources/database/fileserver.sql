/*
Navicat PGSQL Data Transfer

Source Server         : gwac-web-bj-asyn
Source Server Version : 90305
Source Host           : 10.0.3.62:5433
Source Database       : gwac2
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90200
File Encoding         : 65001

Date: 2019-03-14 15:30:45
*/


-- ----------------------------
-- Sequence structure for muf_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "muf_id_seq";
CREATE SEQUENCE "muf_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 8
 CACHE 1;
SELECT setval('"public"."muf_id_seq"', 8, true);

-- ----------------------------
-- Sequence structure for ui_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "ui_id_seq";
CREATE SEQUENCE "ui_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 10
 CACHE 1;
SELECT setval('"public"."ui_id_seq"', 10, true);

-- ----------------------------
-- Table structure for manual_upload_file
-- ----------------------------
DROP TABLE IF EXISTS "manual_upload_file";
CREATE TABLE "manual_upload_file" (
"muf_id" int8 DEFAULT nextval('muf_id_seq'::regclass) NOT NULL,
"name" varchar(255) COLLATE "default",
"ui_id" int4 DEFAULT 0,
"status" int4 DEFAULT 1,
"comments" varchar(1024) COLLATE "default",
"time" timestamp(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of manual_upload_file
-- ----------------------------
BEGIN;
INSERT INTO "manual_upload_file" VALUES ('1', 'webwxgetmsgimg.gif', '0', '1', '测试上传1', '2018-05-22 09:12:25.33');
INSERT INTO "manual_upload_file" VALUES ('2', 'sun system.webm', '0', '1', '测试上传2', '2018-05-22 09:14:02.947');
INSERT INTO "manual_upload_file" VALUES ('3', 'AlexNet.png', '0', '1', 'AlexNet卷积神经网络', '2018-05-22 09:23:42.494');
INSERT INTO "manual_upload_file" VALUES ('4', 'M09_ccdimg.jpg', '0', '1', 'test 4', '2018-05-22 09:29:14.242');
INSERT INTO "manual_upload_file" VALUES ('5', 'Temp_23350245.Fcat', '0', '1', 'temp', '2018-09-04 09:38:44.959');
INSERT INTO "manual_upload_file" VALUES ('6', 'TZF_Fid23350245_G044_mon_objt_180415T16375469.Fcat', '0', '1', 'obj', '2018-09-04 09:38:55.158');
INSERT INTO "manual_upload_file" VALUES ('7', 'G180916_C06504_wcs.new.fit', '0', '1', '', '2018-11-09 08:58:06.658');
COMMIT;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS "user_info";
CREATE TABLE "user_info" (
"ui_id" int4 DEFAULT nextval('ui_id_seq'::regclass) NOT NULL,
"name" varchar(255) COLLATE "default",
"address" varchar(255) COLLATE "default",
"register_date" timestamp(6),
"password" varchar(255) COLLATE "default",
"login_name" varchar(255) COLLATE "default",
"position" varchar(255) COLLATE "default",
"comments" varchar(1024) COLLATE "default",
"register_pass" bool,
"email" varchar(32) COLLATE "default",
"mobil_phone" varchar(32) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of user_info
-- ----------------------------
BEGIN;
INSERT INTO "user_info" VALUES ('1', '管理员', null, null, 'xy', '123', null, null, null, null, null);
COMMIT;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "ui_id_seq" OWNED BY "user_info"."ui_id";

-- ----------------------------
-- Primary Key structure for table manual_upload_file
-- ----------------------------
ALTER TABLE "manual_upload_file" ADD PRIMARY KEY ("muf_id");

-- ----------------------------
-- Primary Key structure for table user_info
-- ----------------------------
ALTER TABLE "user_info" ADD PRIMARY KEY ("ui_id");
