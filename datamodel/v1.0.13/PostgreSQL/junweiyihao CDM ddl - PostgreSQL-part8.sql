/*********************************************************************************
# Copyright 2015 军卫一号
#
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
********************************************************************************/

/************************

 ####### #     # ####### ######      #####  ######  #     #           ####### 
 #     # ##   ## #     # #     #    #     # #     # ##   ##    #    # #       
 #     # # # # # #     # #     #    #       #     # # # # #    #    # #       
 #     # #  #  # #     # ######     #       #     # #  #  #    #    # ######  
 #     # #     # #     # #          #       #     # #     #    #    #       # 
 #     # #     # #     # #          #     # #     # #     #     #  #  #     # 
 ####### #     # ####### #           #####  ######  #     #      ##    #####  
                                                                              

script to create 军卫一号 common data model, version 1.0.13 for PostgreSQL database

last revised: 08-01 2015

author:  wanghaisheng


*************************/


/************************
公共部分
字典： 输入法
************************/


/**
8.1 输入法配置表
此表反映整个系统使用的词库方式输入方法。允许一类项目使用多种输入方法，各类项目之间可以使用不同的输入法。各类项目的各种输入方法对应一个规定格式的输入词库文件，
此表由系统管理员配置，由项目维护程序修改词库的更新日期
主键：
**/
CREATE TABLE OUTER_CODING_CONFIG (
  TOPIC				VARCHAR(8)		NOT NULL,-- 项目标识  为每种输入项目内容指定一个唯一标识，如对西药、检验、诊断分配不同的标识， 该标识同时用于应用程序配置文件中输入法节的KEY值。由系统统一定义
  ITEM_CLASS				VARCHAR(4)		NOT NULL,-- 项目类别 指输入法针对的输入项目内容类别，如西药、检验、诊断等。该字段仅起到提示作用，并不唯一标识项目内容。如：治疗价表项目和治疗临床项目其类别可都为治疗。每类项目可以对应不同的输入方法。使用规范描述，本系统定义  见表  
  CODING_SCHM				     VARCHAR(4)	           NOT NULL,-- 输入法  输入方法的名称，用户定义，如拼音、角码等，与项目标识一起构成输入法配置的唯一索引
  OUTER_CODE_LENGTH				     VARCHAR(2)	           NOT NULL,-- 输入码长度   输入词库文件中输入码字段的长度
  TEXT_LENGTH				     VARCHAR(2)	           NOT NULL,-- 正文长度  输入词库文件中项目正文字段的长度
  STD_CODE_LENGTH				     VARCHAR(2)	           NOT NULL,-- 标准内码长度  输入词库文件中项目对应的标准编码长度
  DICT_FILE_NAME				     VARCHAR(16)	           NOT NULL,-- 输入词库文件名  该输入法使用的词库文件名称，不包括路径
  LAST_UPDT_DATE_TIME		    DATE		NULL--更新日期及时间 输入词库文件的更新日期
)
;


/**
8.2 输入码表
此表维护整个系统所有所用词库方式输入的项目的各种输入法对应的输入码。
由各自的项目维护程序负责更新。由该表可以生成各种输入词库文件。

主键：
**/
CREATE TABLE OUTER_CODE_DICT (
  TOPIC				VARCHAR(8)		NOT NULL,-- 项目标识  对应于输入法配置表中的项目标识
  ITEM_NAME		    VARCHAR(40)		NULL,-- 项目名称  输入项目的内容
  ITEM_CODE		    VARCHAR(16)		NULL,-- 项目代码  项目对应的标准代码
  CONDING_SCHM		    VARCHAR(4)		NULL,-- 输入法  输入法配置中规定的本类项目的输入法
  OUTER_CODE		    VARCHAR(16)		NULL,-- 输入码  该项目名称对应的该种输入法的输入码
)
;


/**
8.3 层次输入法定义

层次输入法需要定义数据的来源、代码的分层方法等，此表定义了使用层次输入法的项目以及数据来源。各种项目对应一条记录。
代码的分层方法即编码规则由分层编码描述表定义。
主键：输入项目
**/
CREATE TABLE CLASS_CODING_CONFIG (
  ITEM				VARCHAR(16)		NOT NULL,-- 输入项目  标识输入内容类别，如药品、诊断等
  CODE_LEVEL				VARCHAR(1)		NOT NULL,-- 编码级数  代码分层总数
  WIZARD_TABLE_NAME				VARCHAR(32)		NOT NULL,-- 逐级编码表名  含逐层编码的数据库表名，当分层编码数据与底层编码数据同在一张表中时，该表名与底层数据表名相同
  WIZARD_CODE_FILED				VARCHAR(32)		NOT NULL,-- 逐层编码表代码字段名  标准项目层次代码字段名
  WIZARD_NAME_FILED				VARCHAR(32)		NOT NULL,-- 逐层编码表名称字段名   标准项目中文名称字段名
  WIZARD_FILTER				VARCHAR(64)		NOT NULL,-- 逐层编码表过滤条件  表中记录的过滤条件，比如项目类别限制
  DATA_TABLE_NAME				VARCHAR(32)		NOT NULL,-- 底层数据表名  含底层编码的数据库表名
  DATA_NAME_FILE				VARCHAR(32)		NOT NULL,-- 底层数据表代码字段名  表中项目中文名字段名
  DATA_FILTER				VARCHAR(64)		NOT NULL-- 逐层编码表过滤条件  表中记录的过滤条件，比如项目类别限制
)
;

/**
8.4 分层编码描述
此表为分层输入法中输入码的编码规则，是层次输入法定义的明细。
主键：输入项目、编码级
**/
CREATE TABLE CLASS_CODING_RULE (
  ITEM				VARCHAR(8)		NOT NULL,-- 输入项目    由层次输入码定义表定义的输入项目
  CODE_LEVEL		VARCHAR(1)		NOT NULL,-- 窗口号 编码的第几层，从1开始一次排列
  LEVEL_WIDTH		VARCHAR(2)		NULL-- 级长  该级的长度
)
;
