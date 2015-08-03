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
字典： 系统维护
************************/


/**
7.1 病人标识号引用表
此表用于说明与病人标识号有关的表与字段信息，由数据库管理员负责初始化和维护，此表信息长期在线保存

主键：
**/
CREATE TABLE PATIENT_ID_REF (
  SERIAL_NO				VARCHAR(3)		NOT NULL,-- 序号  反映引用表在将来修改病人标识号时的修改次序
  TABLE_NAME				VARCHAR(32)		NOT NULL,-- 表名   
  COLUMN_NAME				     VARCHAR(32)	           NOT NULL,-- 字段名  病人标识号的字段名。
  RELATED_COLUMN_NAME				     VARCHAR(32)	           NOT NULL,-- 相关字段名 指改动病人标识号，需要修改的其他字段
  OPER_TYPE		    VARCHAR(1)		NULL-- 操作类型  U-直接更新  D-删除该记录
)
;


/**
7.2 应用程序记录
此表记录需由系统集中授权管理的应用程序

主键：
**/
CREATE TABLE APPLICATIONS (
  APPLICATION				VARCHAR(16)		NOT NULL,-- 应用程序名    统一分配的应用程序名称
  DESCRITPTION		    VARCHAR(80)		NULL-- 程序描述  程序功能描述
)
;


/**
7.3 应用程序权限记录
本表描述应用程序与用户之间的权限关系。本系统通过本表提供应用程序的访问控制机制，用于对数据库提供的数据访问控制进行补充，两者一起构成本系统的安全机制。
应用程序通过此表设置的权限在程序中自行校验。不要求所有的应用系统都进行用户访问控制，仅需要进行控制的程序才使用此表。本表记录由系统管理员通过用户控制子系统建立和修改。

主键：
**/
CREATE TABLE APP_GRANTS (
  APPLICATION				VARCHAR(16)		NOT NULL,-- 应用程序名    统一分配的应用程序名称
  USER_ID				VARCHAR(4)		NOT NULL,-- 用户标识  用户记录中分配的用户标识，该用户对对应的应用程序拥有用户权限字段定义的权限   
  CAPABILITY		    VARCHAR(1)		NULL--用户权限  用户所拥有的权限等级，由系统管理员根据每个应用程序开发者要求分别设置
)
;

/**
7.4 联机帮助信息
本表描述应用程序与用户之间的权限关系。本系统通过本表提供应用程序的访问控制机制，用于对数据库提供的数据访问控制进行补充，两者一起构成本系统的安全机制。
应用程序通过此表设置的权限在程序中自行校验。不要求所有的应用系统都进行用户访问控制，仅需要进行控制的程序才使用此表。本表记录由系统管理员通过用户控制子系统建立和修改。

主键：
**/
CREATE TABLE HELP_MSG (
  APPLICATION				VARCHAR(16)		NOT NULL,-- 应用程序名    统一分配的应用程序名称
  WINDOW_ID				VARCHAR(16)		NOT NULL,-- 窗口号  帮助信息所对应的窗口或屏幕。在一个应用程序内部使用唯一的窗口号来标识每个窗口
  CAPABILITY		    VARCHAR(32)		NULL--帮助信息  关于窗口的操作说明，正文格式
)
;

/**
7.5 字典信息
此表定义了系统中所包含的各类字典，由字典维护程序使用
主键：
**/
CREATE TABLE METADICT (
  TABLE_NAME				VARCHAR(30)		NOT NULL,-- 字典名   字典表名
  TABLE_DESCRIPTION		    VARCHAR(30)		NULL--字典描述   字典内容说明
)
;

/**
7.6 计算机站点
本表记录了系统安装的计算机站点
主键：机器名
**/
CREATE TABLE CLIENT_INSTALLATION (
  CLIENT_NAME				VARCHAR(16)		NOT NULL,-- 机器名    客户机在王老师分配的名字，唯一标识一台机器，与IP地址一一对应
  IP_ADDRESS				VARCHAR(4)		NOT NULL,-- IP地址  该机器使用 IP地址   
  APPLICATION				VARCHAR(16)		NOT NULL,-- 应用程序名    该机器运行的主要应用程序，见7.2 应用程序记录
 LOCATION		    VARCHAR(8)		NULL--科室 该机器安装的科室代码
)
;

