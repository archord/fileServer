/*
Navicat PGSQL Data Transfer

Source Server         : netcenter-postgres-fileserver
Source Server Version : 90325
Source Host           : 10.0.82.111:5432
Source Database       : gwac
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90200
File Encoding         : 65001

Date: 2019-03-19 08:36:43
*/


-- ----------------------------
-- Sequence structure for muf_id_seq
-- ----------------------------
DROP SEQUENCE "muf_id_seq";
CREATE SEQUENCE "muf_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 11
 CACHE 1;
SELECT setval('"public"."muf_id_seq"', 11, true);

-- ----------------------------
-- Sequence structure for oc_id_seq
-- ----------------------------
DROP SEQUENCE "oc_id_seq";
CREATE SEQUENCE "oc_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 20911
 CACHE 1;
SELECT setval('"public"."oc_id_seq"', 20911, true);

-- ----------------------------
-- Sequence structure for tc_id_seq
-- ----------------------------
DROP SEQUENCE "tc_id_seq";
CREATE SEQUENCE "tc_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 24
 CACHE 1;
SELECT setval('"public"."tc_id_seq"', 24, true);

-- ----------------------------
-- Sequence structure for ui_id_seq
-- ----------------------------
DROP SEQUENCE "ui_id_seq";
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
INSERT INTO "manual_upload_file" VALUES ('10', 'G190304_C00777_R_190304_00001.fit.fz', '0', '1', '', '2019-03-14 18:13:13.202');
INSERT INTO "manual_upload_file" VALUES ('11', '500.png', '0', '1', '', '2019-03-15 07:44:20.499');
COMMIT;

-- ----------------------------
-- Table structure for object_catalog
-- ----------------------------
DROP TABLE IF EXISTS "object_catalog";
CREATE TABLE "object_catalog" (
"oc_id" int8 DEFAULT nextval('oc_id_seq'::regclass) NOT NULL,
"name" varchar(255) COLLATE "default",
"path" varchar(255) COLLATE "default",
"date_ut" timestamp(6),
"cam_name" varchar(255) COLLATE "default",
"sky_name" varchar(255) COLLATE "default",
"tc_id" int8,
"is_upload" bool,
"is_process" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of object_catalog
-- ----------------------------
BEGIN;
INSERT INTO "object_catalog" VALUES ('47', 'G033_mon_objt_190115T10221997.Fcat', '190115/G033', '2019-01-15 10:22:19', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('48', 'G033_mon_objt_190115T10224900.Fcat', '190115/G033', '2019-01-15 10:22:49', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('49', 'G033_mon_objt_190115T10232300.Fcat', '190115/G033', '2019-01-15 10:23:23', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('50', 'G033_mon_objt_190115T10233800.Fcat', '190115/G033', '2019-01-15 10:23:38', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('51', 'G033_mon_objt_190115T10235300.Fcat', '190115/G033', '2019-01-15 10:23:53', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('52', 'G033_mon_objt_190115T10240800.Fcat', '190115/G033', '2019-01-15 10:24:08', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('53', 'G033_mon_objt_190115T10242300.Fcat', '190115/G033', '2019-01-15 10:24:23', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('54', 'G033_mon_objt_190115T10243800.Fcat', '190115/G033', '2019-01-15 10:24:38', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('55', 'G033_mon_objt_190115T10245300.Fcat', '190115/G033', '2019-01-15 10:24:53', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('56', 'G033_mon_objt_190115T10250800.Fcat', '190115/G033', '2019-01-15 10:25:08', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('57', 'G033_mon_objt_190115T10252300.Fcat', '190115/G033', '2019-01-15 10:25:23', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('58', 'G033_mon_objt_190115T10253800.Fcat', '190115/G033', '2019-01-15 10:25:38', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('59', 'G033_mon_objt_190115T10255300.Fcat', '190115/G033', '2019-01-15 10:25:53', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('60', 'G033_mon_objt_190115T10260800.Fcat', '190115/G033', '2019-01-15 10:26:08', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('61', 'G033_mon_objt_190115T10262300.Fcat', '190115/G033', '2019-01-15 10:26:23', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('62', 'G033_mon_objt_190115T10263800.Fcat', '190115/G033', '2019-01-15 10:26:38', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('63', 'G033_mon_objt_190115T10265300.Fcat', '190115/G033', '2019-01-15 10:26:53', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('64', 'G033_mon_objt_190115T10270800.Fcat', '190115/G033', '2019-01-15 10:27:08', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('65', 'G033_mon_objt_190115T10272300.Fcat', '190115/G033', '2019-01-15 10:27:23', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('66', 'G033_mon_objt_190115T10273800.Fcat', '190115/G033', '2019-01-15 10:27:38', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('67', 'G033_mon_objt_190115T10275311.Fcat', '190115/G033', '2019-01-15 10:27:53', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('68', 'G033_mon_objt_190115T10280810.Fcat', '190115/G033', '2019-01-15 10:28:08', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('69', 'G033_mon_objt_190115T10282308.Fcat', '190115/G033', '2019-01-15 10:28:23', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('70', 'G033_mon_objt_190115T10283807.Fcat', '190115/G033', '2019-01-15 10:28:38', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('71', 'G033_mon_objt_190115T10285305.Fcat', '190115/G033', '2019-01-15 10:28:53', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('72', 'G033_mon_objt_190115T10290804.Fcat', '190115/G033', '2019-01-15 10:29:08', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('73', 'G033_mon_objt_190115T10292302.Fcat', '190115/G033', '2019-01-15 10:29:23', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('74', 'G033_mon_objt_190115T10293801.Fcat', '190115/G033', '2019-01-15 10:29:38', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('75', 'G033_mon_objt_190115T10295300.Fcat', '190115/G033', '2019-01-15 10:29:53', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('76', 'G033_mon_objt_190115T10300800.Fcat', '190115/G033', '2019-01-15 10:30:08', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('77', 'G033_mon_objt_190115T10302300.Fcat', '190115/G033', '2019-01-15 10:30:23', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('78', 'G033_mon_objt_190115T10303800.Fcat', '190115/G033', '2019-01-15 10:30:38', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('79', 'G033_mon_objt_190115T10305300.Fcat', '190115/G033', '2019-01-15 10:30:53', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('80', 'G033_mon_objt_190115T10310800.Fcat', '190115/G033', '2019-01-15 10:31:08', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('81', 'G033_mon_objt_190115T10312300.Fcat', '190115/G033', '2019-01-15 10:31:23', '033', '35100085-G0013', '4', 't', 't');
INSERT INTO "object_catalog" VALUES ('82', 'G033_mon_objt_190115T10313800.Fcat', '190115/G033', '2019-01-15 10:31:38', '033', '35100085-G0013', '4', 't', 't');
COMMIT;

-- ----------------------------
-- Table structure for template_catalog
-- ----------------------------
DROP TABLE IF EXISTS "template_catalog";
CREATE TABLE "template_catalog" (
"tc_id" int8 DEFAULT nextval('tc_id_seq'::regclass) NOT NULL,
"name" varchar(255) COLLATE "default",
"path" varchar(255) COLLATE "default",
"date_ut" timestamp(6),
"cam_name" varchar(255) COLLATE "default",
"sky_name" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of template_catalog
-- ----------------------------
BEGIN;
INSERT INTO "template_catalog" VALUES ('4', 'Temp_G033_G0013_35100085_245845293465.Fcat', '190115/G033', '2019-01-15 10:22:19', '033', '35100085-G0013');
INSERT INTO "template_catalog" VALUES ('5', 'Temp_G033_G0013_11940425_245845922708.Fcat', '190115/G033', '2019-01-15 12:11:38', '033', '11940425-G0008');
INSERT INTO "template_catalog" VALUES ('6', 'Temp_G033_G0013_12230255_245848811969.Fcat', '190115/G033', '2019-01-15 14:10:43', '033', '12230255-G0013');
INSERT INTO "template_catalog" VALUES ('7', 'Temp_G033_G0013_14110255_245849219641.Fcat', '190115/G033', '2019-01-15 16:32:47', '033', '14110255-G0013');
INSERT INTO "template_catalog" VALUES ('8', 'Temp_G033_G0013_15990255_245846936718.Fcat', '190115/G033', '2019-01-15 18:01:02', '033', '15990255-G0013');
INSERT INTO "template_catalog" VALUES ('9', 'Temp_G033_G0013_20620425_2458499356.Fcat', '190115/G033', '2019-01-15 20:35:23', '033', '20620425-G0013');
INSERT INTO "template_catalog" VALUES ('10', 'Temp_G033_G0013_19760255_245847140713.Fcat', '190116/G033', '2019-01-16 20:19:58', '033', '19760255-G0013');
INSERT INTO "template_catalog" VALUES ('11', 'Temp_G033_G0013_00940255_245845206848.Fcat', '190117/G033', '2019-01-17 11:45:32', '033', '00940255-G0013');
INSERT INTO "template_catalog" VALUES ('12', 'Temp_G033_G0013_02700085_245850194516.Fcat', '190118/G033', '2019-01-18 10:44:02', '033', '02700085-G0013');
INSERT INTO "template_catalog" VALUES ('13', 'Temp_G033_G0013_12010765_245845125336.Fcat', '190118/G033', '2019-01-18 13:17:36', '033', '12010765-G0013');
INSERT INTO "template_catalog" VALUES ('14', 'Temp_G033_G0013_04700255_245847808986.Fcat', '190120/G033', '2019-01-20 11:52:32', '033', '04700255-G0013');
INSERT INTO "template_catalog" VALUES ('15', 'Temp_G033_G0013_17100085_245849130145.Fcat', '190120/G033', '2019-01-20 16:15:42', '033', '17100085-G0013');
INSERT INTO "template_catalog" VALUES ('16', 'Temp_G033_G0013_17100085_245850418613.Fcat', '190120/G033', '2019-01-20 16:30:47', '033', '17100085-G0013');
INSERT INTO "template_catalog" VALUES ('17', 'Temp_G033_G0013_06300085_245845313899.Fcat', '190121/G033', '2019-01-21 11:10:14', '033', '06300085-G0013');
INSERT INTO "template_catalog" VALUES ('18', 'Temp_G033_G0013_16810765_245846433384.Fcat', '190121/G033', '2019-01-21 15:37:02', '033', '16810765-G0013');
INSERT INTO "template_catalog" VALUES ('19', 'Temp_G033_G0013_21620765_245850537537.Fcat', '190121/G033', '2019-01-21 21:05:02', '033', '21620765-G0013');
INSERT INTO "template_catalog" VALUES ('20', 'Temp_G033_G0013_21450595_245850732161.Fcat', '190123/G033', '2019-01-23 19:54:20', '033', '21450595-G0013');
INSERT INTO "template_catalog" VALUES ('21', 'Temp_G033_G0013_22790425_245850739433.Fcat', '190123/G033', '2019-01-23 21:30:20', '033', '22790425-G0013');
INSERT INTO "template_catalog" VALUES ('22', 'Temp_G033_G0013_12870595_245850813721.Fcat', '190124/G033', '2019-01-24 15:21:20', '033', '12870595-G0013');
INSERT INTO "template_catalog" VALUES ('23', 'Temp_G033_G0013_18590595_245849834218.Fcat', '190124/G033', '2019-01-24 17:55:57', '033', '18590595-G0013');
INSERT INTO "template_catalog" VALUES ('24', 'Temp_G033_G0013_04500085_245846115474.Fcat', '190125/G033', '2019-01-25 11:36:12', '033', '04500085-G0013');
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
-- Primary Key structure for table object_catalog
-- ----------------------------
ALTER TABLE "object_catalog" ADD PRIMARY KEY ("oc_id");

-- ----------------------------
-- Primary Key structure for table template_catalog
-- ----------------------------
ALTER TABLE "template_catalog" ADD PRIMARY KEY ("tc_id");

-- ----------------------------
-- Primary Key structure for table user_info
-- ----------------------------
ALTER TABLE "user_info" ADD PRIMARY KEY ("ui_id");
