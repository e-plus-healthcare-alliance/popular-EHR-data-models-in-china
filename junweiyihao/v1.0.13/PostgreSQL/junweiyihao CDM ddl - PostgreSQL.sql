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
字典：人员部分
************************/

/**
性别字典
**/
CREATE TABLE SEX_DICT (
  SERIAL_NO			    INTEGER			NOT NULL,   --长度1 反映性别的排列顺序
  SEX_CODE			    VARCHAR(1)	    NOT NULL,-- 可选
  SEX_NAME				VARCHAR(4)		NOT NULL,
  INPUT_CODE		    VARCHAR(8)		NULL
)
;

/**
婚姻状况字典
**/
CREATE TABLE MARITAL_STATUS_DICT (
  SERIAL_NO			    INTEGER			NOT NULL,   -- 长度1 反映项目的排列顺序
  MARITAL_STATUS_CODE			    VARCHAR(1)	    NOT NULL,-- 可选
  MARITAL_STATUS_NAME				VARCHAR(4)		NOT NULL,
  INPUT_CODE		    VARCHAR(8)		NULL
)
;

/**
民族字典
**/
CREATE TABLE NATION_DICT (
  SERIAL_NO			    INTEGER			NOT NULL,   -- 长度2 反映项目的排列顺序
  NATION_CODE			    VARCHAR(2)	    NOT NULL,-- 可选
  NATION_NAME				VARCHAR(10)		NOT NULL,
  INPUT_CODE		    VARCHAR(8)		NULL
)
;

/**
血型字典
**/
CREATE TABLE BLOOD_TYPE_DICT (
  SERIAL_NO			    INTEGER			NOT NULL,   -- 长度1 反映项目的排列顺序
  BLOOD_TYPE_CODE			    VARCHAR(1)	    NOT NULL,-- 可选
  BLOOD_TYPE_NAME				VARCHAR(2)		NOT NULL
)
;

/**
职业分类字典
**/
CREATE TABLE OCCUPATION_DICT (
  SERIAL_NO			    INTEGER			NOT NULL,   -- 长度2 反映项目的排列顺序
  OCCUPATION_CODE			    VARCHAR(1)	    NOT NULL, 
  OCCUPATION_NAME				VARCHAR(20)		NOT NULL,
  INPUT_CODE		    VARCHAR(8)		NULL
)
;
/**
身份字典
**/
CREATE TABLE IDENTITY_DICT (
  SERIAL_NO			    INTEGER			NOT NULL,   -- 长度2 反映项目的排列顺序  主键
  IDENTITY_CODE			    VARCHAR(1)	    NOT NULL,  -- 可选
  IDENTITY_NAME				VARCHAR(20)		NOT NULL,
  INPUT_CODE		    VARCHAR(8)		NULL,
  PRIORITY_INDICATOR     INTEGER NULL,-- 长度1  0-普通 1-优先 表示是否优先就诊和住院
  MILITARY_INDICATOR     INTEGER NULL,-- 长度1  0-地方 1-军人 

)


/**
军种字典
**/
CREATE TABLE ARMED_SERVICES_DICT (
  SERIAL_NO			    INTEGER			NOT NULL,   -- 长度1 反映项目的排列顺序
  ARMED_SERVICES_CODE			    VARCHAR(1)	    NOT NULL, 
  ARMED_SERVICES_NAME				VARCHAR(4)		NOT NULL,
  INPUT_CODE		    VARCHAR(8)		NULL
)
;

/**
勤务字典
**/
CREATE TABLE DUTY_DICT (
  SERIAL_NO			    INTEGER			NOT NULL,   -- 长度1 反映项目的排列顺序
  DUTY_CODE			    VARCHAR(1)	    NOT NULL, 
  DUTY_NAME				VARCHAR(4)		NOT NULL,
  INPUT_CODE		    VARCHAR(8)		NULL
)
;

/**
费别字典
**/
CREATE TABLE CHARGE_TYPE_DICT (
  SERIAL_NO			    INTEGER			NOT NULL,   -- 长度2 主键
  CHARGE_TYPE_CODE			    VARCHAR(1)	    NOT NULL,  -- 可选
 CHARGE_TYPE_NAME				VARCHAR(8)		NOT NULL,
  CHARGE_PRICE_INDICATOR		    INTEGER		NULL  -- 0-适用标准价格 1-使用优惠价格 2-外宾价
)
;

/**
病人来源字典
**/
CREATE TABLE PATIENT_SOURCE_DICT (
  SERIAL_NO			    INTEGER			NOT NULL,   -- 长度1 反映项目的排列顺序
  PATIENT_SOURCE_CODE			    VARCHAR(1)	    NOT NULL, 
  PATIENT_SOURCE_NAME				VARCHAR(4)		NOT NULL,
  INPUT_CODE		    VARCHAR(8)		NULL
)
;

/**
入院方式字典
**/
CREATE TABLE PATIENT_CLASS_DICT (
  SERIAL_NO			    INTEGER			NOT NULL,   -- 长度1 反映项目的排列顺序
  PATIENT_CLASS_CODE			    VARCHAR(1)	    NOT NULL, -- 病人类别代码
  PATIENT_CLASS_NAME				VARCHAR(4)		NOT NULL,-- 病人类别名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;

/**
出院方式字典
**/
CREATE TABLE DISCHARGE_DISPOSITION_DICT (
  SERIAL_NO			    INTEGER			NOT NULL,   -- 长度1 反映项目的排列顺序
  DISCHARGE_DISPOSITION_CODE			    VARCHAR(1)	    NOT NULL, -- 出院方式代码
  DISCHARGE_DISPOSITION_NAME				VARCHAR(4)		NOT NULL,-- 出院方式名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;

/**
病情状态字典
**/
CREATE TABLE PATIENT_STATUS_DICT (
  SERIAL_NO			    INTEGER			NOT NULL,   -- 长度1 反映项目的排列顺序
  PATIENT_STATUS_CODE			    VARCHAR(1)	    NOT NULL, -- 病情状态代码
  PATIENT_STATUS_NAME				VARCHAR(4)		NOT NULL,-- 病情状态名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;

/**
住院目的字典
**/
CREATE TABLE ADMISSION_CAUSE_DICT (
  SERIAL_NO			    INTEGER			NOT NULL,   -- 长度1 反映项目的排列顺序
  ADMISSION_CAUSE_CODE			    VARCHAR(1)	    NOT NULL, -- 住院目的代码
  ADMISSION_CAUSE_NAME				VARCHAR(8)		NOT NULL,-- 住院目的名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;


/**
工作人员字典
本表用于记录工作人员简要情况，被整个系统所使用
**/
CREATE TABLE STAFF_DICT (
  DEPT_CODE			    VARCHAR(8)			NOT NULL,   -- 长度8 工作人员所在科室
  NAME			    VARCHAR(8)	    NOT NULL, -- 工作人员姓名
  INPUT_CODE				VARCHAR(8)		NOT NULL,-- 姓名的输入码
  EMP_NO		    VARCHAR(6)		NULL,-- 人员编号
  JOB		    VARCHAR(8)		NULL,-- 工作类别 医生、护士、技术员等，本系统定义，参考1.18工作类别字典
  TITLE		    VARCHAR(10)		NULL,-- 工作人员的支撑，如主任医师、主治医师等，本系统定义，参考1.17技术职务字典
  USER_NAME		    VARCHAR(16)		NULL,-- 如果是本系统用户，则为用户名，否则为空

)
;

/**
用户记录字典
本表描述本系统的用户的各种属性，是对数据库本身用户管理的一个补充。本系统通过数据库系统本身的用户管理机制对用户访问数据库进行控制，通过用户名，将这些补
充属性与数据库用户关联起在一起。本表的记录由本系统设置的用户控制子系统建立和修改
**/
CREATE TABLE USERS (
  DB_USERS			    VARCHAR(16)			NOT NULL,   -- 本系统为每个最终用户在数据库管理系统级建立一个用户，用户名在整个系统中唯一
  USER_ID			    VARCHAR(4)	    NOT NULL, -- 每个用户分配一个唯一标识号
  USER_NAME				VARCHAR(8)		NOT NULL,-- 用户姓名
  USER_DEPT		    VARCHAR(8)		NULL,-- 用户所在科室的代码，由用户定义，见2.6科室字典
  CREATE_DATE		    DATE		NULL,-- 建立本用户的日期

)
;

/**
1.17 技术职务字典
**/
CREATE TABLE TITLE_DICT (
  SERIAL_NO			    VARCHAR(3)			NOT NULL,   -- 长度3 反映项目的排列顺序
  TITLE_CODE			    VARCHAR(3)	    NOT NULL, -- 技术职务代码
  TITLE_NAME				VARCHAR(26)		NOT NULL,-- 技术职务名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;

/**
1.18 工作类别字典
**/
CREATE TABLE JOB_CLASS_DICT (
  SERIAL_NO			    VARCHAR(2)			NOT NULL,   -- 长度2 反映项目的排列顺序
  JOB_CLASS_CODE			    VARCHAR(2)	    NOT NULL, -- 工作类别代码
  JOB_CLASS_NAME				VARCHAR(8)		NOT NULL,-- 工作类别名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;


/**
1.19 社会关系字典
**/
CREATE TABLE RELATIONSHIP_DICT (
  SERIAL_NO			    VARCHAR(2)			NOT NULL,   -- 长度2 反映项目的排列顺序
  RELATIONSHIP_CODE			    VARCHAR(2)	    NOT NULL, -- 社会关系代码
  RELATIONSHIP_NAME				VARCHAR(10)		NOT NULL,-- 社会关系名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;


/**
1.20 医生职务字典
**/
CREATE TABLE DOCTOR_TITLE_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   -- 序号 长度1 反映项目的排列顺序
  DOCTOR_TITLE_CODE			    VARCHAR(1)	    NOT NULL, -- 职务代码 唯一
  DOCTOR_TITLE_NAME				VARCHAR(10)		NOT NULL,-- 职务名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;

/**
1.21 入院病情字典
**/
CREATE TABLE PAT_ADM_CONDITION_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   -- 序号 长度1 反映项目的排列顺序
  PAT_ADM_CONDITION_CODE			    VARCHAR(1)	    NOT NULL, -- 病情状态代码
  PAT_ADM_CONDITION_NAME				VARCHAR(4)		NOT NULL,-- 病情状态名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;


/**
1.22 工作组类字典
此表定义了系统中设定的组类，系统定义
**/
CREATE TABLE STAFF_GROUP_CLASS_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   -- 序号 长度1 反映项目的排列顺序
  GROUP_CLASS			    VARCHAR(16)	    NOT NULL -- 组类 反映分组原则，一个组类下有根据该原则划分的多个组。入病区护士组类、病区医生组类 主键
)
;
/**
1.23 工作组字典
一个工作人员物理上只能属于一个行政单位，而不同的应用程序在选取工作人员时，对同一个工作人员的归属有不同的要求。通过组定义了逻辑上的单位，允许一个人属于多个不同的组。组由用户定义。
**/
CREATE TABLE STAFF_GROUP_DICT (
  GROUP_CLASS			    VARCHAR(16)	    NOT NULL, -- 组类 反映分组原则，一个组类下有根据该原则划分的多个组。入病区护士组类、病区医生组类 主键
  GROUP_CODE			    VARCHAR(8)	    NOT NULL,-- 组代码 为每个组分配一个代码，在一个组类内部，组代码唯一；在组类之间，不要钱组代码唯一。组代码在应用中，可以对应科室码、护理单元码。主键
  GROUP_NAME			    VARCHAR(20)	    NOT NULL,-- 组名  为每个组分配一个名称。如病区护士组类下的消化科病区组
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码

)
;

/**
1.24 工作人员分组情况
此表定义了工作人员所属于的组
**/
CREATE TABLE STAFF_VS_GROUP (
  GROUP_CLASS			    VARCHAR(16)	    NOT NULL, -- 组类 为工作组字典中定义的组类  主键
  GROUP_CODE			    VARCHAR(8)	    NOT NULL,-- 组代码 为工作组字典中定义的组代码 主键
  EMP_NO		    VARCHAR(6)		NULL-- 属于改组的工作人员编号 主键

)
;

/**
1.25 费用与身份对照关系
此表定义了病人的费别与身份之间的兼容关系。一种费别可以对应多种身份，多种身份之间由身份序号确定其排列次序。
**/
CREATE TABLE CHARGE_TYPE_VS_IDENTITY (
  CHARGE_TYPE			    VARCHAR(8)	    NOT NULL, -- 费别 见1.9 费别字典 主键
  IDENTITY_SERIAL_NO			    VARCHAR(2)	    NOT NULL,-- 身份序号 反映一种费别所对应的身份排序 
  IDENTITY		    VARCHAR(10)		NULL-- 见1.6 身份字典 主键

)
;


/************************
公共部分
字典：国家、地区、单位及其属性
************************/

/**
2.1 国家及地区字典
**/
CREATE TABLE COUNTRY_DICT (
  SERIAL_NO			    VARCHAR(3)			NOT NULL,   -- 序号 长度3 反映项目的排列顺序
  COUNTRY_CODE			    VARCHAR(2)	    NOT NULL, -- 国家代码
  COUNTRY_NAME				VARCHAR(28)		NOT NULL,-- 国家简称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;


/**
2.2 行政区字典
**/
CREATE TABLE AREA_DICT (
  SERIAL_NO			    VARCHAR(4)			NOT NULL,   -- 序号 长度3 反映项目的排列顺序
  AREA_CODE			    VARCHAR(6)	    NOT NULL, -- 地区代码  使用层次码，每2位表示一个层次
  AREA_NAME				VARCHAR(34)		NOT NULL,-- 地区名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;

/**
2.3 医院基本情况
此表用于医院信息系统的配置。每个系统只有一行，由系统安装时生成。由每个应用程序在用户登录时校验用户合法性以及提取医院名称等时使用。
**/
CREATE TABLE HOSPITAL_CONFIG (
  HOPSTIAL			    VARCHAR(40)			NOT NULL,   -- 医院名称 长度40 医院全称，不为空
  AUTHORIZED_KEY			    VARCHAR(8)			NOT NULL,   -- 根据医院名称按照加密算法计算得到的密码
  UNIT_CODE			    VARCHAR(11)	    NOT NULL, --医院代码 为国家或军队单位编码
  LOCATION				VARCHAR(6)		NOT NULL,-- 地理位置 为国家行政区划编码，参考2.2 行政区字典
  MAILING_ADDRESS				VARCHAR(80)		NOT NULL,-- 通信地址
  ZIP_CODE				VARCHAR(6)		NOT NULL,-- 邮政编码
  APPROVED_BED_NUM		    VARCHAR(4)		NULL-- 编制床位数
)
;

/**
2.4 合同单位记录
此表反映本医院医疗保障对象的简要情况。在本院用于医疗工作统计，对上级统计部门提供本院的保障任务数据。本表在系统开始运行时由门诊业务管理子系统录入。
**/
CREATE TABLE UNIT_IN_CONTRACT (
  UNIT_CODE			    VARCHAR(11)			NOT NULL,   --  合同单位代码 合同单位唯一标识，非空 由用户定义 主键
  UNIT_NAME			    VARCHAR(40)	    NOT NULL, -- 合同单位名称   
  INPUT_CODE				VARCHAR(8)		NOT NULL,-- 输入码
  ADDRESS				VARCHAR(40)		NOT NULL,-- 单位地址
  UNIT_TYPE				VARCHAR(1)		NOT NULL,-- 单位性质 使用代码，用户定义。参考2.9 单位性质字典
  SUBORDINATE_TO				VARCHAR(1)		NOT NULL,-- 隶属单位 为进行统计而划分的隶属关系，使用代码，由用户定义
  DISTANCE_TO_HOSPITAL				VARCHAR(34)		NOT NULL,-- 就医距离。N 4,1 以公里为单位，说明合同单位与本医院的距离
  REGULAR_NUM				VARCHAR(34)		NOT NULL,-- 在编人数
  TEMP_NUM				VARCHAR(34)		NOT NULL,-- 非编人数
  RETIRED_NUM		    VARCHAR(8)		NULL-- 离退休人数
)
;
/**
2.5 合同单位人员分类情况
此表反映合同单位各类人员按身份分布情况，用于统计。本表在系统开始运行时由门诊业务管理子系统录入。
**/
CREATE TABLE STAFF_IN_CONTRACT (
  UNIT_CODE			    VARCHAR(11)			NOT NULL,   --  合同单位代码 由合同单位记录定义的单位代码 主键
  IDENTITY			    VARCHAR(10)	    NOT NULL, -- 身份 使用规范名称，由用户定义，见1.6 身份字典   主键
  STAFF_NUM		    VARCHAR(4)		NULL-- 人数 对应该身份的人数
)
;


/**
2.6 科室字典
此表描述全医院各科室的配置极其属性，由系统管理程序负责维护，各系统使用
**/
CREATE TABLE DEPT_DICT (
  SERIAL_NO			    VARCHAR(3)			NOT NULL,   -- 序号 长度3 此序号反映了科室的排列顺序
  DEPT_CODE			    VARCHAR(6)	    NOT NULL, -- 科室代码  使用层次代码，由用户定义
  DEPT_NAME				VARCHAR(20)		NOT NULL,-- 科室的正式名称
  DEPT_ALIAS				VARCHAR(20)		NOT NULL,-- 科室简称或别名
  CLINIC_ATTR				VARCHAR(1)		NOT NULL,-- 描述本科室属于临床、辅诊、护理单元、机关、其他。本系统定义，参考2.10 科室临床属性字典
  OUTP_OR_INP				VARCHAR(1)		NOT NULL,-- 门诊住院科室标志 描述本科室属于门诊或住院科室，本系统定义，见2.11 科室门诊住院属性字典
  INTERNAL_OR_SERGERY				VARCHAR(34)	NULL,-- 如果是临床科室，则区分内外科，本系统定义，见2.12 科室内外科属性字典
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;



/**
2.7 临床科室配置情况
此表用于生成医疗效率指标。所指科室为最小统计的临床科室，它不同于病房，可以是一个病房中的一部分，该表不包含非最小统计单位的临床科室。
**/
CREATE TABLE CLINICAL_DEPT_CONFIG (
  DEPT_CODE			    VARCHAR(8)	    NOT NULL, -- 科室代码  最小统计单位的临床科室
  BED_NUMBER				VARCHAR(4)		NOT NULL,-- 床位数
  CHIEF_PHYSICAIN_NUM				VARCHAR(2)		NOT NULL,-- 主任医生数
  ATTENDING_DOCTOR_NUM				VARCHAR(2)		NOT NULL,-- 主治医生数
   RESIDENT_NUM				VARCHAR(2)		NOT NULL,-- 住院医师数
   NURSE_NUM		    VARCHAR(2)		NULL-- 护士数
)
;


/**
2.8 临床科室与病房/区对照
一个病房为一个护理单元，科室是行政和统计单位，一个病房可以包含多个科室
**/
CREATE TABLE DEPT_VS_WARD (
  DEPT_CODE			    VARCHAR(8)			NOT NULL,   --  科室代码 最小统计单位的临床科室
  WARD_CODE		    VARCHAR(8)		NULL-- 病房代码
)
;

/**
2.9 单位性质字典
此表用于描述合同单位的性质，如野战部队、机关、院校等。用户定义。
**/
CREATE TABLE UNIT_TYPE_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  UNIT_TYPE_CODE			    VARCHAR(1)	    NOT NULL, -- 单位性质代码   
  UNIT_TYPE_NAME				VARCHAR(16)		NOT NULL,-- 单位性质名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;

/**
2.9 科室临床属性字典
本系统定义
**/
CREATE TABLE DEPT_CLINIC_ATTR_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  CLINIC_ATTR_CODE			    VARCHAR(1)	    NOT NULL, -- 临床属性代码   
  CLINIC_ATTR_NAME				VARCHAR(8)		NOT NULL,-- 临床属性名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;

/**
2.10 科室门诊住院属性字典
本系统定义
**/
CREATE TABLE DEPT_OI_ATTR_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  OI_ATTR_CODE			    VARCHAR(1)	    NOT NULL, -- 门诊住院属性代码   
  OI_ATTR_NAME				VARCHAR(8)		NOT NULL,-- 门诊住院属性名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;
/**
2.11 科室内外科属性字典
本系统定义
**/
CREATE TABLE DEPT_IS_ATTR_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  IS_ATTR_CODE			    VARCHAR(1)	    NOT NULL, -- 内外科属性代码   
  IS_ATTR_NAME				VARCHAR(8)		NOT NULL,-- 内外科属性名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;

/**
2.13 营养室字典
用户定义
**/
CREATE TABLE DIET_PROVIDER_DICT (
  SECTION_CODE			    VARCHAR(1)	    NOT NULL, -- 营养室代码   
  SECTION_NAME				VARCHAR(16)		NOT NULL,--  营养室名称
)
;

/**
2.14 大单位字典
用户定义
**/
CREATE TABLE TOP_UNIT_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  TOP_UNIT_CODE			    VARCHAR(1)	    NOT NULL, -- 大单位代码   
  TOP_UNIT_NAME				VARCHAR(8)		NOT NULL-- 大单位名称
)
;


/************************
公共部分
字典：医疗工作
************************/


/**
3.1 门诊专科字典
专科指专门诊治某类疾病的专科。用户定义
**/
CREATE TABLE SPECIAL_CLINIC_DICT (
  SERIAL_NO			    VARCHAR(2)			NOT NULL,   --  序号 反映项目的排列顺序
  SPECIAL_CLINIC_CODE			    VARCHAR(2)	    NOT NULL, -- 专科代码   
  SPECIAL_CLINIC_NAME				VARCHAR(16)		NOT NULL,-- 专科名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;


/**
3.2 检查号类别字典
允许一所医院存在多种特定的检查(病案)号，本表反映所有存在的需要管理的这种局部病案。  用户定义
**/
CREATE TABLE LOCAL_ID_CLASS_DICT (
  SERIAL_NO			    VARCHAR(2)			NOT NULL,   --  序号 反映项目的排列顺序
 LOCAL_ID_CLASS_CODE			    VARCHAR(1)	    NOT NULL, -- 检查号类别代码   
  LOCAL_ID_CLASS_NAME				VARCHAR(6)		NOT NULL,-- 检查号类别名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;


/**
3.3 检查类别字典

用户定义
**/
CREATE TABLE EXAM_CLASS_DICT (
  SERIAL_NO			    VARCHAR(2)			NOT NULL,   --  序号 反映项目的排列顺序
  EXAM_CLASS_CODE			    VARCHAR(2)	    NOT NULL, -- 检查类别代码   
  EXAM_CLASS_NAME				VARCHAR(6)		NOT NULL,-- 检查类别名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;


/**
3.4 检查子类字典

用户定义
**/
CREATE TABLE EXAM_SUBCLASS_DICT (
  SERIAL_NO			    VARCHAR(2)			NOT NULL,   --  序号 反映项目的排列顺序
  EXAM_CLASS_NAME				VARCHAR(6)		NOT NULL,-- 检查类别名称
  EXAM_SUBCLASS_NAME				VARCHAR(8)		NOT NULL,-- 检查子类别名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;



/**
3.5 号类字典
此表定义了门诊挂号的收费种类。
用户定义
**/
CREATE TABLE CLINIC_TYPE_DICT (
  SERIAL_NO			    VARCHAR(2)			NOT NULL,   --  序号 反映项目的排列顺序
  CLINIC_TYPE			    VARCHAR(2)	    NOT NULL, -- 号类   主键
  PRICE		    VARCHAR(8)		NULL-- 挂号费 5，2
)
;

/**
3.6 医嘱类别字典
此表反映了从临床角度对医嘱的分类，用于医嘱录入及执行单的生成。
本系统定义
**/
CREATE TABLE ORDER_CLASS_DICT (
  SERIAL_NO			    VARCHAR(2)			NOT NULL,   --  序号 反映项目的排列顺序
  ORDER_CLASS_CODE			    VARCHAR(1)	    NOT NULL, -- 医嘱类别代码 唯一   主键
  ORDER_CLASS_NAME				VARCHAR(8)		NOT NULL,-- 医嘱类别名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;

/**
3.7 检查结果状态字典
此表定义了检查检验申请从申请到出报告过程经历的各个状态。
本系统定义
**/
CREATE TABLE EXAM_RESULT_STATUS_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  EXAM_RESULT_STATUS_CODE			    VARCHAR(1)	    NOT NULL, -- 检查结果状态代码 唯一   主键
  EXAM_RESULT_STATUS_NAME				VARCHAR(8)		NOT NULL,-- 检查结果状态名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;

/**
3.8 病人状态变化字典
本表定义了需要记录的病人入出转及病情状态
本系统定义
**/
CREATE TABLE PATIENT_STATUS_CHG_DICT (
  SERIAL_NO			    VARCHAR(2)			NOT NULL,   --  序号 反映项目的排列顺序
  PATIENT_STATUS_CHG_CODE			    VARCHAR(1)	    NOT NULL, -- 病人状态变化代码 唯一   主键
  PATIENT_STATUS_CHG_NAME				VARCHAR(8)		NOT NULL,-- 病人状态编码名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;

/**
3.9 时间段字典

本系统定义
**/
CREATE TABLE TIME_INTERVAL_DICT (
  SERIAL_NO			    VARCHAR(2)			NOT NULL,   --  序号 反映项目的排列顺序
  TIME_INTERVAL_CODE			    VARCHAR(1)	    NOT NULL, -- 时间段代码 唯一   主键
  TIME_INTERVAL_NAME				VARCHAR(8)		NOT NULL,-- 时间段名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;

/**
3.10 病案质量字典

本系统定义
**/
CREATE TABLE MR_QUALITY_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  MR_QUALITY_CODE			    VARCHAR(1)	    NOT NULL, -- 病案质量代码 唯一   主键
  MR_QUALITY_NAME				VARCHAR(8)		NOT NULL,-- 病案质量名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;


/**
3.11 病案价值字典

本系统定义
**/
CREATE TABLE MR_VALUE_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  MR_VALUE_CODE			    VARCHAR(1)	    NOT NULL, -- 病案价值代码 唯一   主键
  MR_VALUE_NAME				VARCHAR(4)		NOT NULL,-- 病案价值名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;




/**
3.12 病案状态字典

本系统定义
**/
CREATE TABLE MR_STATUS_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  MR_STATUS_CODE			    VARCHAR(1)	    NOT NULL, -- 病案状态代码 唯一   主键
  MR_STATUS_NAME				VARCHAR(4)		NOT NULL,-- 病案状态名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;


/**
3.13 病案类别字典
此表用于定义病案类别，如：门诊病历、住院病历、X光片、CT片等等。

**/
CREATE TABLE MR_CLASS_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  MR_CLASS_CODE			    VARCHAR(1)	    NOT NULL, -- 类别代码 唯一   主键
  MR_CLASS_NAME				VARCHAR(8)		NOT NULL,-- 类别名称
  MR_NO_NAME				VARCHAR(16)		NOT NULL,-- 病案号名称  用于描述该类病案号的专用名，如：门诊号、住院号等
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;



/**
3.14 床位状态字典

本系统定义
**/
CREATE TABLE BED_STATUS_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  BED_STATUS_CODE			    VARCHAR(1)	    NOT NULL, -- 床位状态代码 唯一   主键
  BED_STATUS_NAME				VARCHAR(6)		NOT NULL,-- 床位状态名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;

/**
3.15 床位类型字典
此表定义床位的男女床属性
本系统定义
**/
CREATE TABLE BED_TYPE_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  BED_TYPE_CODE			    VARCHAR(1)	    NOT NULL, -- 床位类别代码 唯一   主键
  BED_TYPE_NAME				VARCHAR(6)		NOT NULL,-- 床位类别名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;


/**
3.16 床位等级字典

用户定义
**/
CREATE TABLE BED_CLASS_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  BED_CLASS_CODE			    VARCHAR(2)	    NOT NULL, -- 床位等级代码 唯一   主键
  BED_CLASS_NAME				VARCHAR(10)		NOT NULL,-- 床位等级名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;

/**
3.17 床位编制类型字典

本系统定义
**/
CREATE TABLE BED_APPROVED_TYPE_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  BED_APPROVED_TYPE_CODE			    VARCHAR(1)	    NOT NULL, -- 床位编制类型代码 唯一   主键
  BED_APPROVED_TYPE_NAME				VARCHAR(4)		NOT NULL,-- 床位编制类型名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;
/**
3.18 病案内容分类字典
此表用于定义病案中信息内容类别，如：首页、医嘱、病程等等。

**/
CREATE TABLE MR_COMP_CLASS_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  COMP_CLASS			    VARCHAR(1)	    NOT NULL, -- 类别代码 唯一   主键
  COMP_NAME				VARCHAR(8)		NOT NULL,-- 类别名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;


/************************
公共部分
字典：疾病诊断与医疗操作
************************/


/**
4.1 疾病字典
此表定义了疾病分类编码及其对应的疾病名称，为全系统所用。
用户定义，由病案编目子系统负责维护。长期在线保存。

**/
CREATE TABLE DIAGNOSIS_DICT (
  DIAGNOSIS_CODE			    VARCHAR(16)	    NOT NULL, -- 诊断代码 非空 使用ICD9  用户定义 唯一   主键
  DIAGNOSIS_NAME				VARCHAR(40)		NOT NULL,-- 诊断名称  非空
  STD_INDICATOR				     VARCHAR(1)	           NOT NULL,-- 正名标志  1-正名 0-别名 每种疾病即每个诊断代码有且只能有一个正名
  APPROVED_INDICATOR				VARCHAR(1)		NOT NULL,-- 标准化标志  1-已标准化 0-临时项目  
  CREATE_DATE				DATE 	NOT NULL,-- 创建日期  创建该诊断的日期
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码 推荐使用拼音词头
)
;


/**
4.2 手术操作字典
此表定义了手术分类代码及其对应的手术名称，为全系统所用。
用户定义，由病案编目子系统负责维护。

**/
CREATE TABLE OPERATION_DICT (
  OPERATION_CODE			    VARCHAR(8)	    NOT NULL, -- 手术操作代码 非空 使用ICD9CM  用户定义 唯一   主键
  OPERATION_NAME				VARCHAR(40)		NOT NULL,-- 手术操作名称  非空
  OPERATION_TITLE				VARCHAR(2)		NOT NULL,-- 手术等级  使用规范名称，见4.16 手术等级字典  非空
  STD_INDICATOR				     VARCHAR(1)	           NOT NULL,-- 正名标志  1-正名 0-别名 每种手术即每个手术代码有且只能有一个正名
  APPROVED_INDICATOR				VARCHAR(1)		NOT NULL,-- 标准化标志  1-已标准化 0-临时项目  
  CREATE_DATE				DATE 	NOT NULL,-- 创建日期  创建该手术操作的日期
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码 推荐使用拼音词头
)
;


/**
4.3 检查诊断字典
检查诊断用于不同于入出院诊断，故此设置此表。
用户定义。

**/
CREATE TABLE EXAM_DIAG_DICT (
  EXAM_CLASS			    VARCHAR(6)	    NOT NULL, -- 检查类别  区分检验、各类检查，使用代码，非空，取值：超声、CT、MRI、放射、病理、心电图，本系统定义，见3.3 检查类别字典
  EXAM_SUB_CLASS				VARCHAR(8)		NOT NULL,-- 检查子类  区分一种检查类下的各子类，如超生类下的腹部、心脏、妇产等自雷，可为空，本系统定义，见3.4检查子类字典
  DIAG_NAME				     VARCHAR(1)	           NOT NULL,-- 诊断名称 
  DIAG_CODE				VARCHAR(1)		NOT NULL,-- 诊断代码
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码 推荐使用拼音词头
)
;


/**
4.4 诊断类别字典

本系统定义。

**/
CREATE TABLE DIAGNOSIS_TYPE_DICT (
  SERIAL_NO			    VARCHAR(1)	    NOT NULL, -- 序号  
  DIAGNOSIS_TYPE_CODE				VARCHAR(1)		NOT NULL,-- 诊断类别代码
  DIAGNOSIS_TYPE_NAME				     VARCHAR(20)	           NOT NULL,-- 诊断类别名称 
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码 推荐使用拼音词头
)
;



/**
4.5 诊断对照组字典
本表定义了病案首页中需要议案写的各种诊断对照组，由编目子系统使用。
本系统定义。

**/
CREATE TABLE DIA_COMP_GROUP_DICT (
  SERIAL_NO			    VARCHAR(1)	    NOT NULL, -- 序号  
  DIA_COMP_GROUP_CODE				VARCHAR(1)		NOT NULL,-- 诊断对照组代码
  DDIA_COMP_GROUP_NAME				     VARCHAR(32)	           NOT NULL,-- 诊断对照组名称 
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码 推荐使用拼音词头
)
;


/**
4.6 临床诊疗项目字典
本表反映了从临床角度收集的各种诊断治疗项目，用于各应用系统之间数据交换以及自动划价。该表记录的诊疗项目包括：药品、检查、检验、治疗、手术、护理、膳食等。如果
收费价表项目按照临床诊疗项目来定义，则收费项目代码可以与诊疗项目代码保持一致；否则，收费价表项目可以另行编码。
用户定义。

**/
CREATE TABLE CLINIC_ITEM_DICT (
  ITEM_CLASS			    VARCHAR(1)	    NOT NULL, -- 项目分类  如药品、检查、检验、治疗、护理的等。见4.34 诊疗项目分类字典。  
  ITEM_CODE				VARCHAR(10)		NOT NULL,-- 项目代码  该代码是从临床角度对诊疗项目分配的唯一代码，由用户定义。
  ITEM_NAME				     VARCHAR(40)	           NOT NULL,-- 项目名称，唯一 ，为此项目的标准名称 
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;

/**
4.7 检查项目字典
为临床诊疗项目字典中检查项目的视图。除不包含项目类别字段外，其他与原表相同。
用户定义。

**/
CREATE VIEW EXAM_ITEM_DICT (
  ITEM_CODE				VARCHAR(10)		NOT NULL,-- 项目代码  该代码是从临床角度对诊疗项目分配的唯一代码，由用户定义。
  ITEM_NAME				     VARCHAR(40)	           NOT NULL,-- 项目名称，唯一 ，为此项目的标准名称 
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;


/**
4.8 检验项目字典
为临床诊疗项目字典中检验项目的视图。除不包含项目类别字段外，其他与原表相同。
用户定义。

**/
CREATE VIEW LAB_ITEM_DICT (
  ITEM_CODE				VARCHAR(10)		NOT NULL,-- 项目代码  该代码是从临床角度对诊疗项目分配的唯一代码，由用户定义。
  ITEM_NAME				     VARCHAR(40)	           NOT NULL,-- 项目名称，唯一 ，为此项目的标准名称 
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;

/**
4.8 治疗操作项目字典
为临床诊疗项目字典中治疗操作项目的视图。除不包含项目类别字段外，其他与原表相同。
用户定义。

**/
CREATE VIEW TREAT_ITEM_DICT (
  ITEM_CODE				VARCHAR(10)		NOT NULL,-- 项目代码  该代码是从临床角度对诊疗项目分配的唯一代码，由用户定义。
  ITEM_NAME				     VARCHAR(40)	           NOT NULL,-- 项目名称，唯一 ，为此项目的标准名称 
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;


/**
4.10 护理项目字典
为临床诊疗项目字典中护理项目的视图。除不包含项目类别字段外，其他与原表相同。
用户定义。

**/
CREATE VIEW NURSING_ITEM_DICT (
  ITEM_CODE				VARCHAR(10)		NOT NULL,-- 项目代码  该代码是从临床角度对诊疗项目分配的唯一代码，由用户定义。
  ITEM_NAME				     VARCHAR(40)	           NOT NULL,-- 项目名称，唯一 ，为此项目的标准名称 
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;


/**
4.11 膳食项目字典
为临床诊疗项目字典中膳食项目的视图。除不包含项目类别字段外，其他与原表相同。
用户定义。

**/
CREATE VIEW DIET_ITEM_DICT (
  ITEM_CODE				VARCHAR(10)		NOT NULL,-- 项目代码  该代码是从临床角度对诊疗项目分配的唯一代码，由用户定义。
  ITEM_NAME				     VARCHAR(40)	           NOT NULL,-- 项目名称，唯一 ，为此项目的标准名称 
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;


/**
4.12 临床诊疗项目名称字典
本表是临床诊疗项目字典的辅助表，反映了一个项目的各种名称。用于临床项目的输入，如医嘱录入等场合。
用户定义。

**/
CREATE TABLE CLINIC_ITEM_NAME_DICT (
  ITEM_CLASS			    VARCHAR(1)	    NOT NULL, -- 项目分类  对应临床诊疗项目分类  
  ITEM_CODE				VARCHAR(10)		NOT NULL,-- 项目代码  该名称对应的诊疗项目代码，该代码是从临床角度分配的唯一代码
  ITEM_NAME				     VARCHAR(40)	           NOT NULL,-- 项目名称，每个项目可以有多个名称，在一类项目中，名称必须唯一 
  STD_INDICATOR				     VARCHAR(1)	           NOT NULL,-- 正名标志  1-正名 0-别名 每种项目有且只能有一个正名
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;



/**
4.13 检验项目名称字典
本表为临床诊疗项目名称字典中检验项目的视图。除不包含项目类别字段外，其他与原表相同。
用户定义。

**/
CREATE TABLE LAB_ITEM_NAME_DICT (
  ITEM_CODE				VARCHAR(10)		NOT NULL,-- 项目代码  该名称对应的诊疗项目代码，该代码是从临床角度分配的唯一代码
  ITEM_NAME				     VARCHAR(40)	           NOT NULL,-- 项目名称，每个项目可以有多个名称，在一类项目中，名称必须唯一 
  STD_INDICATOR				     VARCHAR(1)	           NOT NULL,-- 正名标志  1-正名 0-别名 每种项目有且只能有一个正名
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;



/**
4.14 治疗操作名称字典
本表为临床诊疗项目名称字典中治疗操作项目的视图。除不包含项目类别字段外，其他与原表相同。
用户定义。

**/
CREATE TABLE LAB_ITEM_NAME_DICT (
  ITEM_CODE				VARCHAR(10)		NOT NULL,-- 项目代码  该名称对应的诊疗项目代码，该代码是从临床角度分配的唯一代码
  ITEM_NAME				     VARCHAR(40)	           NOT NULL,-- 项目名称，每个项目可以有多个名称，在一类项目中，名称必须唯一 
  STD_INDICATOR				     VARCHAR(1)	           NOT NULL,-- 正名标志  1-正名 0-别名 每种项目有且只能有一个正名
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;

/**
4.15 护理等级字典
此表定义了临床使用的各护理等级。
本系统定义
**/
CREATE TABLE NURSING_CLASS_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  NURSING_CLASS_CODE			    VARCHAR(1)	    NOT NULL, -- 护理等级代码 唯一   主键
  NURSING_CLASS_NAME				VARCHAR(8)		NOT NULL,-- 护理等级名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;

/**
4.16 手术等级字典

本系统定义
**/
CREATE TABLE OPERATION_SCALE_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  OPERATION_SCALE_CODE			    VARCHAR(1)	    NOT NULL, -- 手术等级代码 唯一   主键
  OPERATION_SCALE_NAME				VARCHAR(2)		NOT NULL,-- 手术等级名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;

/**
4.17 给药途径字典

用户定义
**/
CREATE TABLE ADMINSTATION_DICT (
  SERIAL_NO			    VARCHAR(2)			NOT NULL,   --  序号 反映项目的排列顺序
  ADMINSTATION_CODE			    VARCHAR(2)	    NOT NULL, -- 给药途径代码 唯一   主键
  ADMINSTATION_NAME				VARCHAR(16)		NOT NULL,-- 给药途径名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;



/**
4.18 麻醉方法字典

用户定义
**/
CREATE TABLE ANAESTHESIA_DICT (
  SERIAL_NO			    VARCHAR(2)			NOT NULL,   --  序号 反映项目的排列顺序
  ANAESTHESIA_CODE			    VARCHAR(1)	    NOT NULL, -- 麻醉方法代码 唯一   主键
  ANAESTHESIA_NAME				VARCHAR(16)		NOT NULL,-- 麻醉方法名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;

/**
4.19 医嘱状态字典
此表定义了医嘱从录入到校对、执行、停止精力的各种状态。
本系统定义
**/
CREATE TABLE ORDER_STATUS_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  ORDER_STATUS_CODE			    VARCHAR(1)	    NOT NULL, -- 医嘱状态代码 唯一   主键
  ORDER_STATUS_NAME				VARCHAR(8)		NOT NULL,-- 医嘱状态名称
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;

/**
4.20 剂量单位字典
此表定义了医嘱中使用的药品的剂量单位。
本系统定义
**/
CREATE TABLE DOSAGE_UNITS_DICT (
  SERIAL_NO			    VARCHAR(3)			NOT NULL,   --  序号 反映项目的排列顺序
  DOSAGE_UNITS			    VARCHAR(8)	    NOT NULL, -- 剂量单位 唯一   主键
  BASE_UNITS				VARCHAR(8)		NOT NULL,-- 基准单位
  CONVERSION_RATIO				VARCHAR(8)		NOT NULL,-- 换算系数 12，6  反映本单位与基准单位的换算比率
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;


**
4.21 医嘱执行频率字典
此表用于描述常用的执行频率描述与具体的执行次数的对应关系，用于医嘱录入时确定格式化的执行次数描述以及医嘱的计价
用户定义
**/
CREATE TABLE PERFORM_FREQ_DICT (
  SERIAL_NO			    VARCHAR(3)			NOT NULL,   --  序号 反映项目的排列顺序
  FREQ_DESC			    VARCHAR(16)	    NOT NULL, -- 执行频率描述  执行频率的固定描述，如TID、3/日等，非空 唯一   主键
  FREQ_COUNTER				VARCHAR(2)		NOT NULL,-- 频率次数 执行频率的次数部分
  FREQ_INTERVAL				VARCHAR(2)		NOT NULL,-- 频率间隔 执行频率的间隔部分
  FREQ_INTERVAL_UNITS		    VARCHAR(4)		NULL-- 执行频率间隔单位 如日等，使用规范名称，本系统定义，参考表4.31 时间单位字典
)
;


**
4.22 医嘱执行缺省时间表
此表用于描述执行频率和给药途径与执行时间表的关系。用于医嘱录入时自动生成执行时间。
用户定义
**/
CREATE TABLE PERFORM_DEFAULT_SCHEDULE (
  SERIAL_NO			    VARCHAR(3)			NOT NULL,   --  序号 反映项目的排列顺序
  FREQ_DESC			    VARCHAR(16)	    NOT NULL, -- 执行频率描述  执行频率的固定描述，如TID、3/日等，非空 唯一   主键
  ADMINSTATION				VARCHAR(16)		NOT NULL,-- 给药途径和方法 医嘱的具体执行时间与给药途径和方法有关
  DEFAULT_SCHEDULE		    VARCHAR(16)		NULL-- 缺省的执行时间表   执行的具体时间，如3/日对应8-12-6等。
)
;

/**
4.23 辅助诊断项目字典
本表定义了医院中参与辅诊工作量统计的项目，由医务统计子系统使用，数据量在数百提哦左右。
用户定义。

**/
CREATE TABLE ANCI_EXAM_ITEM_DICT (
  DIAG_EXAM_CODE				VARCHAR(8)		NOT NULL,-- 项目编码  
  DIAG_EXAM_NAME				     VARCHAR(40)	           NOT NULL,-- 项目名称，
  COUNT_UNIT				     VARCHAR(8)	           NOT NULL,-- 项目计量单位 指明辅助诊断工作量的计量单位，如人次
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;


/**
4.24 辅助治疗项目字典
本表定义了医院中参与辅助治疗工作量统计的项目，由医务统计子系统使用，数据量在数百提哦左右。
用户定义。

**/
CREATE TABLE ANCI_TREAT_ITEM_DICT (
  DIAG_TREAT_EXAM_CODE				VARCHAR(8)		NOT NULL,-- 项目编码  
  DIAG_TREAT_EXAM_NAME				     VARCHAR(40)	           NOT NULL,-- 项目名称，
  COUNT_UNIT				     VARCHAR(8)	           NOT NULL,-- 项目计量单位 指明辅助治疗项目工作量的计量单位，如人次
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;

/**
4.25 检验单定义 
本表反映检验单所包含的检验项目。
用户定义。

**/
CREATE TABLE LAB_SHEET_ITEMS (
  LAB_SHEET_ID				VARCHAR(4)		NOT NULL,-- 检验单唯一标识 每张定义的检验单有一个唯一标识号  
  LAB_ITEM_NO			VARCHAR(2)		NOT NULL,-- 检验项目序号  在一张检验单内部唯一
  LAB_ITEM_CODE			VARCHAR(10)		NOT NULL,-- 检验项目代码  由用户定义，见4.8 检验项目字典
  LAB_ITEM_NAME			VARCHAR(40)		NOT NULL,-- 检验项目名称  
  CHARGE_ITEM_CLASS			VARCHAR(1)		NOT NULL,-- 对应的收费项目分类 价表定义的项目分类代码，见6.8 价表项目分类字典
  CHARGE_ITEM_CODE		VARCHAR(10)		NOT NULL-- 对应的收费项目代码  价表定义的收费项目代码  见6.1 价表
)
;

/**
4.26 检查报告模板 
此表用于对各种检查报告中的常用描述建立一个模板库。将一个报告分成若干个描述项目，每个描述项目根据检查结果有多种描述，每种描述对应此表中的一条记录。
检查类别、检查子类、描述项目、描述名称一起构成描述记录的唯一标识。在医生书写报告时，孩子要指定以上四项或输入时指定的输入码，既可以取得描述内容。如有必要，在报告中可以对提取的标准描述正文再行修改。
用户定义。
此表的内容，由各检查化验科室的医生录入和修改。
用户定义。

**/
CREATE TABLE EXAM_RPT_PATTERN (
  EXAM_CLASS				VARCHAR(6)		NOT NULL,-- 检查类别  区分化验、各类检查等，使用代码，非空，取值可以为超声、CT、MRI、放射、病理、心电图等，本系统定义，见3.3 检查类别字典  
  EXAM_SUB_CLASS			VARCHAR(8)		NOT NULL,-- 检查子类  区分一种检查类下的各子类，如超声类下的腹部、心脏、妇产等子类，本系统定义，见3.4 检查子类字典
  DESC_ITEM			VARCHAR(20)		NOT NULL,-- 描述项目  将报告单抽象为几个描述项目，如临床症状、检查所见、印象、建议等，此字段反映一下的模板内容属于哪一个项目，项目由本系统定义，见表
  DESC_NAME			VARCHAR(20)		NOT NULL,-- 描述项目名称 指定以下的描述内容为哪方面描述，如检查所见中的CT检查正常，它对应具体的描述内容  
  DESCRITPTION			VARCHAR(800)		NOT NULL,-- 描述 模板的描述内容，为常用短语或句子
  DESCRITPTION_CODE		VARCHAR(10)		NOT NULL,-- 描述代码  为每个描述分配一个代码，如果描述内容为检查项目时，可为收费项目代码
  INPUT_CODE		    VARCHAR(8)		NULL-- 描述名称输入码 推荐使用拼音词头
)
;


/**
4.28 治疗结果字典
本表定义了病案首页中使用的诊断治疗结果的各种取值。
本系统定义
**/
CREATE TABLE TREATING_RESULT_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  TREATING_RESULT_CODE			    VARCHAR(1)	    NOT NULL, -- 治疗结果代码 唯一   主键
  TREATING_RESULT_NAME				VARCHAR(4)		NOT NULL,-- 治疗结果名称  如治愈、好转、死亡等
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;



/**
4.29 切口愈合情况字典
本表定义了病案首页中使用的手术切口愈合情况的取值种类。
本系统定义
**/
CREATE TABLE HEAL_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  HEAL_CODE			    VARCHAR(1)	    NOT NULL, -- 切口愈合情况代码 唯一   主键
  THEAL_NAME				VARCHAR(4)		NOT NULL,-- 切口愈合情况名称  如甲、乙等
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;


/**
4.30 诊断符合情况字典
本表定义了病案首页中使用的诊断符合情况的取值种类。
本系统定义
**/
CREATE TABLE DIAG_CORR_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  DIAG_CORR_CODE			    VARCHAR(1)	    NOT NULL, -- 诊断符合情况代码 唯一   主键
  DIAG_CORR_NAME				VARCHAR(6)		NOT NULL,-- 诊断符合情况名称  如符合、不符、无对照等
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;


/**
4.31 时间单位字典
本表定义医嘱使用的时间单位
本系统定义
**/
CREATE TABLE TIME_UNITS_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  TIME_UNITS_CODE			    VARCHAR(1)	    NOT NULL, -- 时间单位代码 唯一   主键
  TIME_UNITS_NAME				VARCHAR(4)		NOT NULL,-- 时间单位名称  如天、小时、分等
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;


/**
4.32 计量单位字典
此表定义药品使用的各种计量单位。
本系统定义
**/
CREATE TABLE MEASURES_DICT (
  SERIAL_NO			    VARCHAR(2)			NOT NULL,   --  序号 反映项目的排列顺序
  MEASURES_CLASS			    VARCHAR(10)	    NOT NULL, -- 计量单位类别 如重量、容量、包装、时间等。唯一   主键
  MEASURES_CODE			    VARCHAR(3)	    NOT NULL, -- 计量单位代码 唯一   
  MEASURES_NAME			    VARCHAR(8)	    NOT NULL, -- 计量单位名称 唯一   主键
  BASE_UNITS				VARCHAR(8)		NOT NULL,-- 基准单位   
  CONVERSION_RATIO				VARCHAR(4)		NOT NULL,-- 换算系数 12，6 反映本单位与基准单位的换算比率
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码
)
;

/**
4.33 星期字典

本系统定义
**/
CREATE TABLE DAYS_OF_WEEK_DICT (
  SERIAL_NO			    VARCHAR(2)			NOT NULL,   --  序号 反映项目的排列顺序
  DAY_NO			    VARCHAR(10)	    NOT NULL, -- 天 0-6，分别对应日~六
  DAY_SYMBOL		    VARCHAR(8)		NULL-- 记号  日，一~六
)
;

/**
4.34 诊疗项目分类字典

本系统定义
**/
CREATE TABLE CLINIC_ITEM_CLASS_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  CLASS_CODE			    VARCHAR(1)	    NOT NULL, -- 项目类别代码  
  CLASS_NAME				VARCHAR(10)		NOT NULL,-- 项目类别名称   
  INPUT_CODE		    VARCHAR(8)		NULL-- 输入码 推荐使用拼音词头
)
;


/**
4.35 标本字典

本系统定义
**/
CREATE TABLE SPECIMAN_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  SPECIMAN_CODE			    VARCHAR(1)	    NOT NULL, -- 标本代码  
  SPECIMAN_NAME				VARCHAR(10)		NOT NULL,-- 标本名称   
  INPUT_CODE			    VARCHAR(1)	    NOT NULL, -- 输入码 推荐使用拼音词头  
  DEPT_CODE		    VARCHAR(8)		NULL-- 科室代码 使用标本的科室，见2.6 科室字典
)
;


/**
4.36 检验报告项目字典

用户定义
**/
CREATE TABLE LAB_REPORT_ITEM_DICT (
  SERIAL_NO			    VARCHAR(4)			NOT NULL,   --  序号 反映项目的排列顺序
  ITEM_CODE			    VARCHAR(10)	    NOT NULL, -- 项目代码  
  ITEM_NAME				VARCHAR(40)		NOT NULL,-- 项目名称   
  RESULT_TYPE			    VARCHAR(8)	    NOT NULL, -- 结果类型  反映标注、阴阳弱、药敏、描述等
  LOWER_LIMIT			    VARCHAR(8)	    NOT NULL, -- 正常值下限 9，3  不受其他条件影响的正常值，如果受其他条件影响，则为空。对固定正常值，与正常值上限相同。对不限制下限，为空。
  UPPER_LIMIT			    VARCHAR(8)	    NOT NULL, -- 正常值上限 9，3   不受其他条件影响的正常值，如果受其他条件影响，则为空。对固定正常值，与正常下限相同。对不限制上限，为空。
  UNITS			    VARCHAR(8)	    NOT NULL, -- 正常值单位  可以为复合单位
  PRINT_CONTEXT			    VARCHAR(8)	    NOT NULL, -- 正常值打印内容
  MINI_INCREMENT			    VARCHAR(8)	    NOT NULL, -- 最小增量 6，3
  NOTES			    VARCHAR(8)	    NOT NULL, -- 正常值备注   用于存放有条件的正常值，正文描述
  DEFAULT-VALUE			    VARCHAR(8)	    NOT NULL, -- 缺省值  检验结果的缺省值
  INPUT_CODE			    VARCHAR(1)	    NOT NULL -- 输入码 推荐使用拼音词头  
;

/**
4.37 检验结果模板字典
此表用于描述列表类型结果的所有可能的内容。软件在处理此类检验项目时，从本表中选取结果填入检验结果表中。
用户定义
**/
CREATE TABLE LAB_LIST_RESULT_DICT (
  REPORT_ITEM_CODE			    VARCHAR(10)			NOT NULL,   --  报告项目代码  代码对应检验报告项目字典
  RESULT_NO			    VARCHAR(4)	    NOT NULL, -- 结果序号  每个序号对应同一个报告项目代码中的一个结果  
  RESULT_VALUE				VARCHAR(20)		NOT NULL,-- 检验结果 结果的内容   
  INPUT_CODE			    VARCHAR(8)	    NOT NULL, -- 输入码 推荐使用拼音词头  
)
;


/**
4.38 检验申请项目与报告项目对照
此表用于建立检验申请项目与报告项目之间的对照。申请项目可以为复合项目，因此一个申请项目可以对应多个报告项目。如果申请项目已经为独立的项目，则它对照到自身；如果申请
项目的结果项目不确定，它也对照到自身。每个申请项目至少在本对照表中有一条记录。
用户定义
**/
CREATE TABLE LAB_ORDER_VS_REPORT (
  SERIAL_NO			    VARCHAR(2)			NOT NULL,   --  序号 反映项目的排列顺序
  ORDER_ITEM_CODE			    VARCHAR(10)	    NOT NULL, -- 申请项目代码  为临床诊疗项目字典中定义的检验项目  
  REPORT_ITEM_CODE		    VARCHAR(10)		NULL-- 报告项目代码  为检验报告项目字典中定义的项目
)
;



/**
4.39 切口等级字典
此表定义手术的切口等级
本系统定义
**/
CREATE TABLE WOUND_GRADE_DICT (
  SERIAL_NO			    VARCHAR(1)			NOT NULL,   --  序号 反映项目的排列顺序
  WOUND_GRADE_CODE			    VARCHAR(1)	    NOT NULL, -- 切口等级代码  
  WOUND_GRADE_NAME				VARCHAR(2)		NOT NULL,-- 切口等级名称 如I、II等   
  INPUT_CODE			    VARCHAR(8)	    NOT NULL -- 输入码 推荐使用拼音词头  
)
;
/**
4.40 检验项目与分类对照
此表用于检验项目分类，为检验系统的录入及统计提供方便。如生化类、临检类、微生物类等。
用户定义
**/
CREATE TABLE LAB_ITEM_VS_CLASS (
  ITEM_CLASS			    VARCHAR(8)	    NOT NULL, -- 项目类别  检验项目所属类别，使用中文  
  ITEM_CODE		    VARCHAR(10)		NULL-- 项目代码  为检验申请项目字典中定义的项目 主键
)
;


/**
4.41 检验项目类别字典
此表用于定义检验项目类别，如生化类、临检类、微生物类等。
用户定义
**/
CREATE TABLE LAB_LIST_RESULT_DICT (
  SERIAL_NO			    VARCHAR(2)	    NOT NULL, -- 序号  此序号反映了项目的排列顺序  
  RESULT_VALUE				VARCHAR(8)		NOT NULL,-- 类别代码 
  INPUT_CODE			    VARCHAR(8)	    NOT NULL, -- 类别名称  
)
;

/**
4.42 检验报告项目与申请项目对照
此表通常在使用自动检验仪器时使用，用于一个报告项目在不同条件下对应多个申请项目时，从报告查找符合条件的申请项目。此表在系统初始化时是可选择的，如果报告项目
无法根据本表确定申请项目记录，则程度需要提供手工选择的处理功能。
用户定义
主键：科室代码、检验报告代码、标本、优先标志、仪器编号
**/
CREATE TABLE LAB_REPORT_VS_ORDER (
  DEPT_NO			    VARCHAR(8)			NOT NULL,   --  使用科室 见2.6 科室字典
  REPORT_ITEM_CODE			    VARCHAR(10)	    NOT NULL, -- 检验报告项目代码  报告项目对应的代码 见4.36 检验报告项目字典  
  SPECIMAN				VARCHAR(8)		NOT NULL,-- 标本  使用标准描述，如血、尿等   
  PRIORITY_INDICATOR				VARCHAR(10)		NOT NULL,-- 优先标志 反映申请的紧急程度。0-普通 1-紧急   
  INSTRUMENT_ID				VARCHAR(10)		NOT NULL,-- 仪器编号  同检验仪器检验项目配置中定义的仪器编号   
  ITEM_CODE		    VARCHAR(8)		NULL-- 检验项目代码，见4.8 检验项目字典
)
;




/************************
公共部分
字典：药品物资
************************/

/**
5.1 药品字典
此表定义了医院所使用的每一种药品
主键：药品代码、规格、药品类别标志
**/
CREATE TABLE DRUG_DICT (
  DRUG_CODE			    VARCHAR(10)	    NOT NULL, -- 药品代码  药品名(含剂型)的唯一标识，与药品规格一起构成一种药品(含规格)的标识  
  DRUG_NAME				VARCHAR(40)		NOT NULL,-- 药品名称  药品的标准名称
  DRUG_SPEC				VARCHAR(20)		NOT NULL,-- 规格  反映药品的含量信息，如25mg
  UNITS				VARCHAR(8)		NOT NULL,-- 单位  对应剂型及规格的最小单位，如片、支等，使用规范名称，见4.32 计量单位字典 
  DRUG_FORM				VARCHAR(10)		NOT NULL,-- 剂型 按药品的毒理分类，如普通、毒麻、精神等，使用规范名称，本系统定义，见毒理字典
  DOSE_PER_UNIT				NUMERIC(8,3)		NOT NULL,-- 最小单位计量  8，3  每一最小不可分包装单位所含剂量，如每片、、每支的剂量
  DOSE_UNITS				VARCHAR(8)		NOT NULL,--剂量单位  剂量的单位，如mg、ml等
  DRUG_INDICATOR				VARCHAR(1)		NOT NULL,--药品类别标志  反映是否药品及何类药品：1-药品 2-中成药 3-原料 4-化学试剂 5-敷料  9-其他
  INPUT_CODE			    VARCHAR(8)	    NOT NULL -- 输入码 推荐使用拼音词头  
)
;


/**
5.2 药品名称字典
此表反映了药品的各种名称与标准名称及编码的对应关系

**/
CREATE TABLE DRUG_NAME_DICT (
  DRUG_CODE			    VARCHAR(10)	    NOT NULL, -- 药品代码  药品名(含剂型)的唯一标识，与药品规格一起构成一种药品(含规格)的标识  
  DRUG_NAME				VARCHAR(40)		NOT NULL,-- 药品名称  药品的标准名称
  STD_INDICATOR				VARCHAR(1)		NOT NULL,-- 正名标志  0-别名 1-正名
  INPUT_CODE			    VARCHAR(8)	    NOT NULL -- 输入码 推荐使用拼音词头  
)
;

/**
5.1 药品价格
此表定义每一种药品的价格，除了按药品字典定义的每种规格药品定价外，该表中可以对不同包装的药品进行定价。在规格字段中可以包含包装信息，
如：25mg*24.也就是说这里的规格不同于药品字典中的规格。对同种药品不同厂家，可以定义不同的价格。该价表包含了价格的历史信息，同种
规格的同种药品只能有一个当前有效价
主键：药品代码、规格、厂家标识、起用日期
**/
CREATE TABLE DRUG_PRICE_DICT (
  DRUG_CODE			    VARCHAR(10)	    NOT NULL, -- 药品代码  药品名(含剂型)的唯一标识，与药品规格一起构成一种药品(含规格)的标识  
  DRUG_SPEC				VARCHAR(20)		NOT NULL,-- 规格  反映药品的含量信息，如25mg
  FIRM_ID				VARCHAR(10)		NOT NULL,-- 厂家标识 反映生产厂家
  UNITS				VARCHAR(8)		NOT NULL,-- 单位  对应剂型及规格的最小单位，如片、支等，使用规范名称，见4.32 计量单位字典 
  TRADE_PRICE        NUMERIC(10,4)  NOT NULL, --市场批发价 药库采购药品时的市场定价
  RETAIL_PRICE        NUMERIC(10,4)  NOT NULL, --市场零售价 药品零售时的市场定价
  AMOUNT_PER_PACKAGE				VARCHAR(5)		NOT NULL,-- 包装数量  指单位包装中所含的最小单位数量。如果已为最小单位，则为1
  MIN_SPEC				VARCHAR(20)		NOT NULL,-- 最小单位规格  反映最小单位药品的含量，与药品字典中定义规格相同 如25mg
  MIN_UNITS				VARCHAR(8)		NOT NULL,--最小单位  对应最小单位规格的单位，如片
  STRAT_DATE				DATE		NOT NULL,--起用日期  该价格的起用日期，执行日期含起用日期当天
  STOP_DATE				DATE		NOT NULL,--停止日期  该价格的停止执行日期，执行日期含停止日期当天
  MEMOS			    VARCHAR(20)	    NOT NULL -- 备注  记录价格来源等信息
)
;



/**
5.4 公费用药目录
此表定义了公费用药目录，不同的费别可以对应不同的用药目录。对一种药品不限制规格的情况，规格可以使用“*”。对于部分规格受限(如进口)的情况，
公费用药续药在目录中指明具体规格。
主键：费别、药品代码、规格
**/
CREATE TABLE OFFICALL_DRUG_CATALOG (
  CHARGE_TYPE			    VARCHAR(8)	    NOT NULL, -- 费别 公费药品使用的费别
  DRUG_CODE			    VARCHAR(10)	    NOT NULL, -- 药品代码  由药品字典定义的代码  
  DRUG_SPEC				VARCHAR(20)		NOT NULL,-- 规格  价表中对应药品的规格，“*”表示不限规格
  CONSTRAINED_LEVEL			    VARCHAR(1)	    NOT NULL -- 限制级别 反映公费用药范围限制信息，0-无限制，1-需部分负担，2-限适应症 3-限适应症且需部分负担  
)
;


/**
5.5 药品入库分类字典
此表定义了入库药品的来源分类
用户定义
主键：入库分类
**/
CREATE TABLE DRUG_IMPORT_CLASS_DICT (
  SERIAL_NO			    VARCHAR(2)	    NOT NULL, -- 序号  反映项目的排列顺序  
  IMPORT_CLASS				VARCHAR(8)		NOT NULL,-- 入库分类   使用中文名称
;

/**
5.6 药品出库分类字典
此表定义了出库药品的来源分类
用户定义
主键：出库分类
**/
CREATE TABLE DRUG_EXPORT_CLASS_DICT (
  SERIAL_NO			    VARCHAR(2)	    NOT NULL, -- 序号  反映项目的排列顺序  
  EXPORT_CLASS				VARCHAR(8)		NOT NULL-- 出库分类   使用中文名称
;

/**
5.7 药品处方属性字典
此表定义药品处方的属性
用户定义
主键：属性名称
**/
CREATE TABLE DRUG_PRESC_ATTR_DICT (
  SERIAL_NO			    VARCHAR(2)			NOT NULL,   --  序号 反映项目的排列顺序
  PRESC_ATTR_CODE			    VARCHAR(1)	    NOT NULL, -- 属性代码  
  PRESC_ATTR_NAME				VARCHAR(8)		NOT NULL-- 属性名称
)
;
/**
5.8 药品供应商目录
此表定义了药品供应厂商，由药品管理分系统使用
用户定义
主键：厂商标识
**/
CREATE TABLE DRUG_SUPPLIER_CATALOG (
  SUPPLIER_ID			    VARCHAR(10)	    NOT NULL, -- 厂商标识 唯一标识一个厂商
  SUPPLIER			    VARCHAR(40)	    NOT NULL, -- 厂商 厂商全称
  SUPPLIER_CLASS				VARCHAR(8)		NOT NULL,-- 厂商类别 用于反映厂商的性质，如生产商、批发商等
  INPUT_CODE			    VARCHAR(8)	    NOT NULL -- 输入码 推荐使用拼音词头  
)
;
/**
5.9 药品毒理分类字典
此表定义药品毒理分类。
用户定义
主键：毒理分类名称
**/
CREATE TABLE DRUG_TOXI_PRROPERTY_DICT (
  SERIAL_NO			    VARCHAR(2)	    NOT NULL, -- 序号 反映项目的排列次序
  TOXI_CODE			    VARCHAR(2)	    NOT NULL, -- 毒理分类代码 
  TOXI_NAME				VARCHAR(10)		NOT NULL,-- 毒理分类名称
  INPUT_CODE			    VARCHAR(8)	    NOT NULL -- 输入码 推荐使用拼音词头  
)
;
/**
5.10 药品剂型字典
此表定义药品剂型。
用户定义
主键： 剂型代码
**/
CREATE TABLE DRUG_FORM_DICT (
  SERIAL_NO			    VARCHAR(2)	    NOT NULL, -- 序号 反映项目的排列次序
  FORM_CODE			    VARCHAR(2)	    NOT NULL, -- 剂型代码  唯一标识一种剂型 
  FORM_NAME				VARCHAR(10)		NOT NULL,-- 剂型名称
  INPUT_CODE			    VARCHAR(8)	    NOT NULL -- 输入码 推荐使用拼音词头  
)
;

/**
5.11 药品类别字典
此表定义药品的分类，包括各层分类，类之间的关系由药品编码描述表定义。

主键： 类别代码
**/
CREATE TABLE DRUG_CLASS_DICT (
  CLASS_CODE			    VARCHAR(2)	    NOT NULL, -- 类别代码  药品层次代码 
  CLASS_NAME				VARCHAR(10)		NOT NULL-- 类别名称
)
;

/**
5.12 药品摆药类别字典
此表定义药品摆药时的分类，如：口服、针剂、大输液等。
用户定义
主键： 摆药类别
**/
CREATE TABLE DRUG_DISP_PROPERTY_DICT (
  SERIAL_NO			    VARCHAR(2)	    NOT NULL, -- 序号 反映项目的排列次序
  DISPENSING_PROPERTY			    VARCHAR(10)	    NOT NULL, -- 摆药类别
  DRUG_ADMINISTRATIONS			    VARCHAR(80)	    NOT NULL -- 对应给药路径  该类别药品医嘱中可能的给药路径。多种给药路径之间以“：”分隔。用于摆药时参考
)
;
/**
5.13 药品编码描述
此表定义药品编码的分层结构

主键： 编码级
**/
CREATE TABLE DRUG_CODING_RULE (
  CODE_LEVEL			    VARCHAR(1)	    NOT NULL, -- 编码级 反映编码层数，从1开始一次排列
  LEVEL_WIDTH			    VARCHAR(2)	    NOT NULL, -- 级长
  CLASS_NAME			    VARCHAR(8)	    NOT NULL -- 级名此级编码名称，如：大类、小类
)
;


/**
5.14 药品信息
此表记录了药品使用信息
主键： 药品代码
**/
CREATE TABLE DRUG_INFO (
  DRUG_CODE			    VARCHAR(10)	    NOT NULL, -- 药品代码  
  DRUG_NAME				VARCHAR(40)		NOT NULL,-- 药品名称  药品的标准名称
  DRUG_E_NAME				VARCHAR(40)		NOT NULL,-- 药品英文名称  
  ACTION				VARCHAR(2000)		NOT NULL,-- 药理作用
  INDICATION				VARCHAR(2000)		NOT NULL,-- 适应症
  DOSAGE				VARCHAR(2000)		NOT NULL,-- 用法用量
  FORM				VARCHAR(2000)		NOT NULL,-- 制剂
  PHARMACOKINETICS				VARCHAR(2000)		NOT NULL,-- 药代动力学
  ADVERSE_REACTION				VARCHAR(2000)		NOT NULL,-- 不良反应
  ATTENTION				VARCHAR(2000)		NOT NULL,-- 注意事项
  CONTRAINDICATION				VARCHAR(2000)		NOT NULL-- 禁忌
)
;


/**
5.11 药品相互作用
此表记录了药品相互作用对。要检索两个药品是否有相互作用，需要将2个药品分别按药品A和药品B检索
主键： 药品A代码、药品B代码
**/
CREATE TABLE DRUG_INCOMPATIBILITY (
  DRUG_A_CODE			    VARCHAR(8)	    NOT NULL, -- 药品A代码  与药品B之间有相互作用，由药品信息表定义的药品代码 
  DRUG_B_CODE				VARCHAR(8)		NOT NULL,-- 药品B代码 与药品A之间有相互作用，由药品信息表定义的药品代码
  DESCRITPTION				VARCHAR(2000)		NOT NULL-- 相互作用描述
)
;





/************************
公共部分
字典： 费用
************************/


/**
6.1 价表
所有收费项目的价格全部存放在此表中，包括药品、检查、检验、手术、治疗、材料等。此表记录了价格的变动历史，每次调价，都停止该项目的原有
价格，重新生成一条新的价格记录。价格记录只能追加，不能删除和修改。
用户定义，由价表管理子系统负责维护。
主键： 项目分类、项目代码、项目规格、单位、起用日期。
上述价表中包含了历史价格，为便于使用，系统定义当前家表示图，条件为SYSDATE >= start_date AND (SYSDATE <stop_date OR stop_date IS NULL)
**/
CREATE TABLE PRICE_LIST (
  ITEM_CLASS			    VARCHAR(1)	    NOT NULL, -- 项目分类 本系统定义，见6-8  价表项目分类字典。非空
  ITEM_CODE			    VARCHAR(10)	    NOT NULL, -- 项目代码 非空
  ITEM_NAME			    VARCHAR(40)	    NOT NULL, -- 项目名称  项目的标准名称。非空
  ITEM_SPEC			    VARCHAR(20)	    NOT NULL, -- 项目规格  药品规格、器械材料规格
  UNITS			    VARCHAR(20)	    NOT NULL, -- 单位  指计价单位，如：片、针、人次、部位等，见6.3 计价单位字典
  PRICE			    NUMERIC(9,3)	    NOT NULL, -- 价格  标准价格，可对应全费价。非空
  PREFER_PRICE			    NUMERIC(9,3)	    NOT NULL, -- 优惠价格  可对应自费价。非空
  FOREIGNER_PRICE			    NUMERIC(9,3)	    NOT NULL, -- 外宾价格
  PERFORMED_BY			    VARCHAR(8)	 	    NOT NULL, -- 执行科室   执行科室代码，当为*时，表示有两个以上执行科室，如一个检查项目。当为空时，表示为各科都执行的项目，如静滴等普通治疗项目。
  FEE_TYPE_MASK			    VARCHAR(8)	    NOT NULL, -- 费用屏蔽标志  通常情况下按照费别，各种项目统一原则收费或优惠。特殊项目不按费别收费。此项为1表示此收费项目不考虑费别按规定价格收费，0表示按费别收费。非空
  CLASS_ON_INP_RCPT			    VARCHAR(1)	    NOT NULL, -- 对应的住院收据费用分类  此项目对住院病人在收据中应归属的费用类别；非空；见6.11 住院收据费用分类字典；使用代码
  CLASS_ON_OUTP_RCPT			    VARCHAR(1)	    NOT NULL, -- 对应的门诊收据费用分类  此项目对门诊病人在收据中应归属的费用类别，见6.10 门诊收据费用分类字典；非空；使用代码
  CLASS_ON_RECKONING			    VARCHAR(10)	    NOT NULL, -- 对应的核算项目分类  此项目在经济核算中应归属的费用类别；非空；见6.12 核算项目分类字典；使用代码
  SUBJ_CODE			    VARCHAR(4)	    NOT NULL, -- 对应的会计科目  此项目收入归属的会计科目；非空；见6.13 会计科目字典，使用代码
  CLASS_ON_MR			    VARCHAR(4)	    NOT NULL, -- 对应的病案首页费用分类  此项目对应住院病人在病案首页中应归属的费用类别；非空；见6.9 病案首页费分类字典
  MEMO			    VARCHAR(40)	    NOT NULL, -- 备注  用于定价条件说明 
  START_DATE           DATE           NOT NULL,--起用日期  执行日期含起用日期当天
  STOP_DATE           DATE           NOT NULL,--停止日期  执行日期含停止日期当天
  OPERATOR			    VARCHAR(8)	    NOT NULL, --操作员  操作员姓名
  ENTER_DATE           DATE           NOT NULL,--录入日期及时间  非空

)
;

/**
当前价表
视图
所有字段均对应原名称
**/
CREATE  VIEW CURRENT_PRICE_LIST AS SELECT * FROM PRICE_LIST WHERE SYSDATE >= start_date AND (SYSDATE < stop_date OR stop_date IS NULL)


/**
价表项目分类与其他分类对照表
视图
所有字段均对应原名称
**/
CREATE  VIEW ITEM_CLASS_VS_OTHER_CLASS AS SELECT ITEM_CLASS,ITEM_CODE,CLASS_ON_INP_RCPT,CLASS_ON_OUTP_RCPT,SUBJ_CODE,CLASS_ON_MR FROM PRICE_LIST


/**
6.2 价表项目名称字典
此表收集了价表项目的各种名称，用于价表项目输入，如价表管理和门诊收费等直接按价表项目输入的场合。这些名称如同价表项目一样，可能不同于临床操作的名称。
用户定义。
主键：项目分类、项目代码
**/
CREATE TABLE PRICE_ITEM_NAME_DICT (
    ITEM_CLASS				VARCHAR(1)		NOT NULL,-- 项目分类  对应于价表项目的分类，见6.8 价表项目分类字典  主键
  ITEM_CODE				VARCHAR(10)		NOT NULL,-- 项目代码  该名称对应的价表项目代码 主键
  ITEM_NAME				     VARCHAR(40)	           NOT NULL,-- 项目名称，每个价表项目可以有多个名称或别名
  STD_INDICATOR				     VARCHAR(1)	           NOT NULL,-- 正名标志  1-正名 0-别名 每种项目有且只能有一个正名
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;



/**
6.3 计价单位字典

本系统定义
主键：计价单位名称
**/
CREATE TABLE BILL_UNITS_DICT (
    SERIAL_NO				VARCHAR(2)		NOT NULL,-- 序号  此序号反映了项目分类的排列次序
  BILL_UNITS_CODE				VARCHAR(2)		NOT NULL,-- 计价单位代码  非空 
  BILL_UNITS_NAME				     VARCHAR(8)	           NOT NULL,-- 计价单位名称  如人次、片、支、部位等。
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;

/**
6.4 收费系数字典
此表反映不同费别各种费用的优惠系数
用户定义
主键：费别
**/
CREATE TABLE CHARGE_PRICE_SCHEDULE (
  CHARGE_TYPE				VARCHAR(8)		NOT NULL,-- 费别  根据需要定义。见1.9 费别字典。非空。
  PRICE_COEFF_NUMERATOR				VARCHAR(2)		NOT NULL,-- 收费系数分子  非空
  PRICE_COEFF_DENOMINATOR			     VARCHAR(2)	           NOT NULL,-- 收费系数分母  非空
  CHARGE_SPECIAL_INDICATOR		    VARCHAR(1)		NULL-- 适用特殊收费项目标志  该费别是否适用特殊收费项目  0-不适用 1-适用
)
;


/**
6.5 价表项目执行科室
此表反映价表项目与执行科室之间的关系。允许一个项目对应有多个执行科室。通过本表，可为用户输入执行科室时，提供选择方便。
用户定义。
内容长期保存。
主键：计价单位名称
**/
CREATE TABLE PERFORM_DEPT (
  ITEM_CLASS				VARCHAR(1)		NOT NULL,-- 价表项目分类  非空
  ITEM_CODE				VARCHAR(10)		NOT NULL,-- 价表项目代码  非空 
  PERFORMED_BY		    VARCHAR(8)		NULL--使用代码，由用户定义，见2.6科室字典。非空
);
/**
6.6 临床诊疗项目与价表项目对照表
此表用于描述医嘱中涉及的临床操作与收费价表项目之间的对应关系，用于医嘱的自动划价。该表中记录的临床诊疗项目包括药品、检查、治疗、护理、膳食等各种类别。
每个临床诊疗项目可以对应多个不同的收费项目。对不收费的项目，在该表中保留一条记录，其对应的收费项目为空。如果医嘱中的某个临床项目在此表中得不到对应，表示需要手工划价。
对应关系由划价员搜集确定。
用户定义。
内容长期保存。
主键： 临床诊疗项目类别、临床诊疗项目代码、对应价表项目序号
**/
CREATE TABLE CLINIC_VS_CHARGE (
  CLINIC_ITEM_CLASS				VARCHAR(1)		NOT NULL,-- 临床诊疗项目类别  见表4.34
  CLINIC_ITEM_CODE				VARCHAR(10)		NOT NULL,-- 临床诊疗项目代码   
  CHARGE_ITEM_NO		    VARCHAR(2)		NULL-- 对应价表项目序号 每个临床诊疗项目对应的价表项目从1开始顺序排列
  CHARGE_ITEM_CLASS				VARCHAR(1)		 NULL,-- 对应价表项目分类   如果此项与价表项目代码为空，表示该操作不收费
  CHARGE_ITEM_CODE				VARCHAR(10)		 NULL,-- 对应价表项目代码   
  CHARGE_ITEM_SPEC				VARCHAR(20)		 NULL,-- 对应价表项目规格   若此项为空，表示规格不确定
  AMOUNT				VARCHAR(4)		NOT NULL,-- 对应价表项目数量   一个临床项目可以续药多个同样的价表项目，如材料。当此项为空时，表示由用户确定
  UNITS				VARCHAR(8)		NOT NULL,-- 对应价表项目单位    上述数量对应的单位

);



/**
6.7 医嘱附加计价项目字典 EXTRA_COSTS_DICT
此表已取消

主键：
**/



/**
6.8 价表项目分类字典
将所有的收费项目分为固定的类别
本系统定义
主键： 
**/
CREATE TABLE BILL_ITEM_CLASS_DICT (
    SERIAL_NO				VARCHAR(2)		NOT NULL,-- 序号  此序号反映了项目分类的排列次序
  CLASS_CODE				VARCHAR(1)		NOT NULL,-- 项目分类代码  非空
  CLASS_NAME				     VARCHAR(10)	           NOT NULL,-- 项目分类名称，非空
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;

/**
6.9 病案首页费用分类字典
此表根据病案首页在住院收费子系统中设置
用户定义
主键：  费用分类代码
**/
CREATE TABLE MR_FEE_CLASS_DICT (
  SERIAL_NO				VARCHAR(2)		NOT NULL,-- 序号  此序号反映了项目分类的排列次序
  MR_FEE_CLASS_CODE				VARCHAR(1)		NOT NULL,-- 费用分类代码  非空
  MR_FEE_CLASS_NAME				     VARCHAR(4)	           NOT NULL,-- 费用分类名称，非空
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;


/**
6.10 门诊收据费用分类字典
此表用于定义门诊医疗收据中的费用分类
用户定义
主键：  费用分类代码
**/
CREATE TABLE OUTP_RCPT_FEE_CLASS_DICT (
  SERIAL_NO				VARCHAR(2)		NOT NULL,-- 序号  此序号反映了项目分类的排列次序
 OUTP_RCPT_FEE_CLASS_CODE				VARCHAR(1)		NOT NULL,-- 费用分类代码  门诊收据分类代码，由用户定义
  OUTP_RCPT_FEE_CLASS_NAME				     VARCHAR(10)	           NOT NULL,-- 费用分类名称，非空
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;

/**
6.11 住院收据费用分类字典
此表用于定义住院医疗收据中的费用分类
用户定义
主键：  费用分类代码
**/
CREATE TABLE INP_RCPT_FEE_CLASS_DICT (
  SERIAL_NO				VARCHAR(2)		NOT NULL,-- 序号  此序号反映了项目分类的排列次序
 INP_RCPT_FEE_CLASS_CODE				VARCHAR(1)		NOT NULL,-- 费用分类代码  住院收据分类代码，由用户定义 非空
  INP_RCPT_FEE_CLASS_NAME				     VARCHAR(10)	           NOT NULL,-- 费用分类名称，非空
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;

/**
6.12 核算项目分类字典
在经济核算时，需要将收入或支出按需要分类。此表记录其分类情况。
用户定义
主键：  项目分类代码
**/
CREATE TABLE RECK_ITEM_CLASS_DICT (
  SERIAL_NO				VARCHAR(2)		NOT NULL,-- 序号  此序号反映了项目分类的排列次序
  CLASS_CODE				VARCHAR(10)		NOT NULL,-- 项目分类代码  住院收据分类代码，由用户定义 非空
  CLASS_NAME				     VARCHAR(16)	           NOT NULL,-- 项目分类名称，非空
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;


/**
6.13 会计科目字典
此表用于定义会计记账中使用科目种类。
用户定义
主键：  科目代码
**/
CREATE TABLE TALLY_SUBJECT_DICT (
  SERIAL_NO				VARCHAR(2)		NOT NULL,-- 序号  此序号反映了科目的排列次序
  SUBJECT_CODE				VARCHAR(4)		NOT NULL,-- 科目代码    非空
  SUBJECTS_NAME				     VARCHAR(16)	           NOT NULL,-- 科目名称   非空
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;

/**
6.14 支付方式字典

用户定义
主键：  支付方式名称
**/
CREATE TABLE PAY_WAY_DICT (
  SERIAL_NO				VARCHAR(1)		NOT NULL,-- 序号  此序号反映了项目的排列次序
  PAY_WAY_CODE				VARCHAR(1)		NOT NULL,-- 支付方式代码    非空
  PAY_WAY_NAME				     VARCHAR(8)	           NOT NULL,-- 支付方式名称   非空
  ACCTING_INDICATOR				     VARCHAR(1)	           NOT NULL,-- 记账标志   反映该支付方式是否作为实收款进入会计记账 0-不进入记账 1-进入记账
  OUTP_INDICATOR				     VARCHAR(1)	           NOT NULL,-- 门诊病人适用标志   该支付方式是否适用于门诊病人 0-不适用 1-适用
  INP_INDICATOR				     VARCHAR(1)	           NOT NULL,-- 住院病人适用标志   该支付方式是否适用于住院病人 0-不适用 1-适用
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;

/**
6.15 预交金操作类型字典

本系统定义
主键：  
**/
CREATE TABLE PREPAY_TRANS_TYPE_DICT (
  SERIAL_NO				VARCHAR(1)		NOT NULL,-- 序号  此序号反映了项目的排列次序
  TRANS_TYPE_CODE				VARCHAR(1)		NOT NULL,-- 操作类型代码    非空
  TRANS_TYPE_NAME				     VARCHAR(4)	           NOT NULL,-- 操作类型名称   非空
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;


/**
6.16 结算操作类型字典

本系统定义
主键：  
**/
CREATE TABLE SETTLE_TRANS_TYPE_DICT (
  SERIAL_NO				VARCHAR(1)		NOT NULL,-- 序号  此序号反映了项目的排列次序
  TRANSACT_TYPE_CODE				VARCHAR(1)		NOT NULL,-- 操作类型代码    非空
  TRANSACT_TYPE_NAME				     VARCHAR(4)	           NOT NULL,-- 操作类型名称   非空
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;



/**
6.17 支票标识字典

本系统定义
主键：  
**/
CREATE TABLE CHECK_LABEL_DICT (
  SERIAL_NO				VARCHAR(1)		NOT NULL,-- 序号  此序号反映了项目的排列次序
  CHECK_LABEL_CODE				VARCHAR(1)		NOT NULL,-- 支票标识代码    非空
  CHECK_LABEL_NAME				     VARCHAR(4)	           NOT NULL,-- 支票标识名称   非空
  INPUT_CODE		    VARCHAR(8)		NULL-- 该项目的输入码 推荐使用拼音词头
)
;

/**
6.18 收费特殊项目字典
此表用于定义不能按费别系数字典规定的正常系数收费的项目，与收费特殊项目排斥字典定义互补。在收费特殊项目排斥字典中定义的项目，计算方法优先；
不在其中定义的项目，在本表中规定的项目，按本表执行；如果收费项目在本表中也不存在，按费别系数字典规定的系数执行。当项目为一类项目时，项目代码或
项目规格使用通配符表示。记录之间定义的项目范围不允许有交叉或重复。

主键：  费别、项目类别、项目代码、项目规格
**/
CREATE TABLE CHARGE_SPECIAL_ITEM_DICT (
  CHARGE_TYPE				VARCHAR(8)		NOT NULL,-- 费别  
  ITEM_CLASS				VARCHAR(1)		NOT NULL,-- 项目类别    按价表项目类别分类，使用代码，见6.8 价表项目分类字典
  ITEM_CODE				     VARCHAR(10)	           NOT NULL,-- 项目代码   指价表定义的收费项目代码，可以使用通配符“*”表示项目类别定义中的所有项目
  ITEM_SPEC			     VARCHAR(20)	           NOT NULL,-- 项目规格   指价表定义的收费项目规格，可以使用通配符“*”表示某一项目的所有规格
  PROPORTION_NUMERATOR				     VARCHAR(3)	           NOT NULL,-- 收费系数分子   由该系数的分子与分母之比确定此项目的应收费
  PROPORTION_DENOMINATOR		    VARCHAR(3)		NULL-- 收费系数分母  
  FREE_LIMIT			     NUMERIC(8,2)	           NOT NULL,-- 免除最高限额   由标准价格减去本限额确定此项目的应收费。如果为空，应收费按上述比例计算；如果不为空，应收费按实际免除额计算
)
;


/**
6.19 收费特殊项目排斥字典
此表用于定义特殊项目中计算方法例外情况。与收费特殊项目定义互补，本表定义计算方法优先。当项目为一类项目时，项目代码或项目规格使用通配符表示。
记录之间定义的项目范围不允许有交叉或重复。
主键：  费别、项目类别、项目代码、项目规格
**/
CREATE TABLE CHARGE_SPECIAL_EXCEPT_DICT (
  CHARGE_TYPE				VARCHAR(8)		NOT NULL,-- 费别  
  ITEM_CLASS				VARCHAR(1)		NOT NULL,-- 项目类别    按价表项目类别分类，使用代码，见6.8 价表项目分类字典
  ITEM_CODE				     VARCHAR(10)	           NOT NULL,-- 项目代码   指价表定义的收费项目代码，可以使用通配符“*”表示项目类别定义中的所有项目
  ITEM_SPEC			     VARCHAR(20)	           NOT NULL,-- 项目规格   指价表定义的收费项目规格，可以使用通配符“*”表示某一项目的所有规格
  PROPORTION_NUMERATOR				     VARCHAR(3)	           NOT NULL,-- 收费系数分子   由该系数的分子与分母之比确定此项目的应收费
  PROPORTION_DENOMINATOR		    VARCHAR(3)		NULL-- 收费系数分母  
  FREE_LIMIT			     NUMERIC(8,2)	           NOT NULL,-- 免除最高限额   由标准价格减去本限额确定此项目的应收费。如果为空，应收费按上述比例计算；如果不为空，应收费按实际免除额计算
)
;



/**
6.20 收费部门分组字典
当医院包含独立统计的多个收费部门时，通过统一排列的收费窗口号区间予以划分。此表记录了收费部门分组与收费窗口号的对应关系。各部门窗口号区间不允许交叉。
用户定义
主键：  序号
**/
CREATE TABLE BILLING_GROUP_DICT (
  SERIAL_NO				VARCHAR(2)		NOT NULL,-- 序号  此序号反映了部门排列的次序
  GROUP_CODE				VARCHAR(8)		NOT NULL,-- 部门代码    
  GROUP_NAME				     VARCHAR(20)	           NOT NULL,-- 部门名称    
  START_WINDOW_NO	     VARCHAR(2)	           NOT NULL,-- 起始窗口号   该部门使用的收费窗口号最小值
  STOP_WINDOW_NO	     VARCHAR(2)	           NOT NULL-- 截止窗口号   该部门使用的收费窗口号最大值
)
;


/**
6.21 费用模板主记录
对于成组的收费项目，定义一个模板，便于收费人员快速录入一组项目。该表与费用模板明细记录一起构成模板定义。
用户定义
主键：  模板名称
**/
CREATE TABLE BILL_PATTERN_MASTER (
  SERIAL_NO				VARCHAR(2)		NOT NULL,-- 序号  此序号反映了部门排列的次序
  PATTERN_NAME				     VARCHAR(40)	           NOT NULL-- 模板名称  唯一标识一个模板，可以为检验单名称、计价单名称等    
)
;


/**
6.22 费用模板明细记录
此表为费用模板的项目定义
用户定义
主键：  模板名称、项目序号
**/
CREATE TABLE BILLING_PATTERN_DETAIL (
  PATTERN_NAME				VARCHAR(40)		NOT NULL,-- 模板名称  唯一标识一个模板，可以为检验单名称、计价单名称等
  ITEM_NO				VARCHAR(3)		NOT NULL,-- 项目序号 唯一标识一个模板内的项目    
  ITEM_CLASS				VARCHAR(1)		NOT NULL,-- 项目分类  价表定义的项目分类代码，见6.8 价表项目分类字典    
  ITEM_CODE				VARCHAR(10)		NOT NULL,-- 项目代码 价表项目代码     
  ITEM_SPEC				VARCHAR(20)		NOT NULL,-- 项目规格     
  UNITS				     VARCHAR(8)	           NOT NULL,-- 单位 计价单位    
  AMOUNT	     NUMERIC(6,2)	           NOT NULL,-- 数量   默认数量
  PERFORMED_BY	     VARCHAR(8)	           NOT NULL-- 执行科室   该项目的实际执行科室
)
;

