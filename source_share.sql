-- 用户表
DROP TABLE IF EXISTS `source_share`.`USERINFO`;  
CREATE TABLE `source_share`.`USERINFO` (
  `user_id` INT NOT NULL auto_increment  COMMENT '操作人员编号',
  `user_name` VARCHAR(45) NOT NULL   COMMENT '姓名',
  `gender`          VARCHAR(6) not null   COMMENT '性别',
  `loginid`         VARCHAR(50) not null   COMMENT '登陆号',
  `password`        VARCHAR(50) not null   COMMENT '登陆口令',
  `wrong_times`     INT not null   COMMENT '密码错误次数',
  `psw_chang_etime` DATE   COMMENT '密码最后修改时间',
  `effective`       VARCHAR(6) default 1 not null   COMMENT '有效标志',
  `operate_person`  VARCHAR(15) not null   COMMENT '创建人',
  `operate_time`    datetime default NOW() not null   COMMENT '创建时间',
  `phone_number`    VARCHAR(20)   COMMENT '移动电话',
  `mail_adress`     VARCHAR(50)   COMMENT '电邮地址',
  `idcard`          VARCHAR(50)   COMMENT '身份证',
  PRIMARY KEY (`user_id`)
  ) ENGINE=MyISAM  DEFAULT CHARSET=utf8;  


-- 角色表
DROP TABLE IF EXISTS `source_share`.`USER_CHARACTER`;  
CREATE TABLE `source_share`.`USER_CHARACTER` (
  `character_id`       INT not null auto_increment  COMMENT '角色编号',
  `character_name`     VARCHAR(50) not null COMMENT '角色名称',
  `character_type`     VARCHAR(6) not null COMMENT '角色类型',
  `character_property` VARCHAR(6) COMMENT '角色属性',
  `messageinfo`        VARCHAR(200) COMMENT '备注',
  `effective`          VARCHAR(6) not null COMMENT '有效标志',
  `operate_person`     VARCHAR(15) not null  COMMENT '经办人',
  `operate_time`       datetime default NOW() not null COMMENT '经办时间',
  PRIMARY KEY (`character_id`)
  ) ENGINE=MyISAM  DEFAULT CHARSET=utf8;  




-- 用户角色关系表
DROP TABLE IF EXISTS `source_share`.`USER_CHARACTER_RELATIONSHIP`;  
CREATE TABLE `source_share`.`USER_CHARACTER_RELATIONSHIP` (
  `character_id`   INT not null COMMENT  '角色编号',
  `user_id`        INT not null COMMENT  '操作人员编号',
  `effective`      VARCHAR(6) default 1 not null COMMENT  '有效标志',
  `operate_person` VARCHAR(15) not null COMMENT  '经办人',
  `operate_time`   datetime default NOW() not null COMMENT '经办时间',
  foreign key(`character_id`) references USER_CHARACTER(`character_id`),
  foreign key(`user_id`) references USERINFO(`user_id`)
  ) ENGINE=MyISAM  DEFAULT CHARSET=utf8;  
  
  
  -- 用户角色变更信息
DROP TABLE IF EXISTS `source_share`.`USER_CHARACTER_CHANGEINFO`;  
CREATE TABLE `source_share`.`USER_CHARACTER_CHANGEINFO` (
  `serial_number`  INT not null auto_increment COMMENT '变动流水号',
  `character_id`   VARCHAR(15) not null COMMENT '角色编号（修改后）',
  `user_id`        VARCHAR(15) not null COMMENT '人员编号（被修改）',
  `operate_person` VARCHAR(15) not null COMMENT '修改人',
  `operate_time`   datetime default NOW() not null COMMENT '经办时间',
  `change_type`    VARCHAR(6) not null COMMENT '变更类型',
  `messageinfo`    VARCHAR(40) COMMENT '备注',
  PRIMARY KEY (`serial_number`),
  foreign key(`character_id`) references USER_CHARACTER(`character_id`),
  foreign key(`user_id`) references USERINFO(`user_id`)
  ) ENGINE=MyISAM  DEFAULT CHARSET=utf8;  



  -- 机密文件表
DROP TABLE IF EXISTS `source_share`.`SECRET_DOCUMENT`;  
CREATE TABLE `source_share`.`SECRET_DOCUMENT` (
  `doc_id`          INT not null auto_increment  COMMENT '文档编号',
  `doc_title`       NVARCHAR(40) COMMENT '标题',
  `doc_theme`       NVARCHAR(6) COMMENT '主题',
  `doc_content`     NVARCHAR(100) COMMENT '内容',
  `doc_description` NVARCHAR(100) COMMENT '描述',
  `effective`       NVARCHAR(6) default 1 COMMENT '有效标志',
  `operate_person`  NVARCHAR(40) COMMENT '创建人（userid）',
  `operate_time`    datetime default NOW() not null COMMENT '经办时间',
  PRIMARY KEY (`doc_id`)
  ) ENGINE=MyISAM  DEFAULT CHARSET=utf8;  

-- 图片
DROP TABLE IF EXISTS `source_share`.`DOCUMENT_PICTURE`;  
CREATE TABLE `source_share`.`DOCUMENT_PICTURE` (
  `doc_id`          INT not null  COMMENT '文档编号',
  `pic_title`       NVARCHAR(40) COMMENT  '标题',
  `pic_type`        NVARCHAR(6)  COMMENT '类型',
  `pic_description` NVARCHAR(500) COMMENT  '描述',
  `pic_adress`      NVARCHAR(500) COMMENT  '图片地址',
  `effective`       NVARCHAR(6) default 1 COMMENT  '有效标志',
  `operate_person`  NVARCHAR(40) COMMENT  '创建人（userid）',
  `operate_time`    datetime default NOW() not null COMMENT  '创建时间',
  foreign key(`doc_id`) references SECRET_DOCUMENT(`doc_id`)
  ) ENGINE=MyISAM  DEFAULT CHARSET=utf8;  

-- 分数
DROP TABLE IF EXISTS `source_share`.`DOCUMENT_SCORE`;  
CREATE TABLE `source_share`.`DOCUMENT_SCORE` (
  `doc_id`          INT not null COMMENT  '文档编号',
  `score`           INT not null COMMENT  '分数',
  `effective`       NVARCHAR(6) default 1 COMMENT '有效标志',
  `operate_person`  NVARCHAR(40) COMMENT '创建人（userid）',
  `operate_time`    datetime default NOW() not null COMMENT '创建时间',
  foreign key(`doc_id`) references SECRET_DOCUMENT(`doc_id`)
  ) ENGINE=MyISAM  DEFAULT CHARSET=utf8;  


-- 神秘代码
DROP TABLE IF EXISTS `source_share`.`DOCUMENT_SECRET_CODE`;  
CREATE TABLE `source_share`.`DOCUMENT_SECRET_CODE` (
  `doc_id`         INT not null COMMENT '文档编号',
  `code_type`      NVARCHAR(6) COMMENT '类型',
  `code_adress`    NVARCHAR(300) COMMENT '地址',
  `code_extract`   NVARCHAR(40) COMMENT '提取码',
  `code_password`  NVARCHAR(40) COMMENT '解压码',
  `effective`       NVARCHAR(6) default 1 COMMENT '有效标志',
  `operate_person`  NVARCHAR(40) COMMENT '创建人（userid）',
  `operate_time`    datetime default NOW() not null COMMENT '创建时间',
  foreign key(`doc_id`) references SECRET_DOCUMENT(`doc_id`)
  ) ENGINE=MyISAM  DEFAULT CHARSET=utf8;  


-- 评论
DROP TABLE IF EXISTS `source_share`.`DOCUMENT_SECRET_DISCUSS`;  
CREATE TABLE `source_share`.`DOCUMENT_SECRET_DISCUSS` (
  `doc_id`         INT not null COMMENT '文档编号',
  `discuss_comment`      NVARCHAR(6) COMMENT '内容',
  `effective`       NVARCHAR(6) default 1 COMMENT '有效标志',
  `operate_person`  NVARCHAR(40) COMMENT '创建人（userid）',
  `operate_time`    datetime default NOW() not null COMMENT '创建时间',
  foreign key(`doc_id`) references SECRET_DOCUMENT(`doc_id`)
  ) ENGINE=MyISAM  DEFAULT CHARSET=utf8;  


-- 编码表
DROP TABLE IF EXISTS `source_share`.`ENCODE_TABLE`;  
CREATE TABLE `source_share`.`ENCODE_TABLE` (
`code_type`  VARCHAR(20) not null  COMMENT '代码类别',
`type_name`  VARCHAR(50) not null COMMENT '类别名称',
`code_value` VARCHAR(30) not null COMMENT '代码值',
`code_name`  VARCHAR(150) not null COMMENT '代码名称',
`effective`  NVARCHAR (6) default 1 COMMENT '有效标志',
primary key(code_type,code_value)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;  




