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
字典： 病案
************************/


/**
9.1 病人主索引
此表描述所有在院注册的病人的基本信息，被整个医院信息系统所共享。由身份登记子系统录入。
此表信息需长期在线保存，如果使用挂号子系统，则此表的数据增长量与每日的初诊病人数相一致。如果医院每日门诊量为1000，其中1/4为初诊病人，
则每日数据增长量为250条，每年约为80000条

主键： 病人标识号
**/
CREATE TABLE PAT_MASTER_INDEX (
  PATIENT_ID				VARCHAR(10)		NOT NULL,-- 病人标识号  病人唯一标识号，可以由用户赋予具体的含义，如：病案号，门诊号等
  INP_NO				VARCHAR(6)		 NULL,-- 住院号  可选的病人标识，可为空   
  NAME				     VARCHAR(8)	           NOT NULL,-- 姓名  病人姓名
  NAME_PHONETIC				     VARCHAR(16)	           NOT NULL,-- 姓名拼音  病人姓名拼音，大写，字间用一个空格分隔，超长截断
  SEX				     VARCHAR(4)	           NOT NULL,-- 性别 男、女、未知，本系统定义，见1.1 性别字典
  DATE_OF_BIRTH				     DATE	           NOT NULL,-- 出生日期 指改动病人标识号，需要修改的其他字段
  BIRTH_PLACE				     VARCHAR(6)	           NOT NULL,-- 出生地 指定省市县，使用代码，见2.2 行政区字典
  CITIZENSHIP				     VARCHAR(2)	           NOT NULL,-- 国籍 使用国家代码，见2.1 国家及地区字典
  NATION				     VARCHAR(10)	           NOT NULL,-- 民族 民族规范名称，见1.3 民族字典
  ID_NO				     VARCHAR(18)	           NOT NULL,-- 身份证号  
  IDENTITY				     VARCHAR(10)	           NOT NULL,-- 身份 由身份登记子系统生成，住院登记子系统在班里入院时更新。使用规范名称，由用户定义，见1.6 身份字典
  CHARGE_TYPE				     VARCHAR(8)	           NOT NULL,-- 费别 由身份登记子系统生成，住院等级子系统在班里入院时更新。使用规范名称，由用户定义，见1.9 费别字典
  UNIT_IN_CONTRACT				     VARCHAR(11)	           NOT NULL,-- 合同单位 如果病人所在单位为本医院的合同单位或体系单位，则使用代码，否则为空。由身份登记子系统生成，住院等级子系统在班里入院时更新。代码由用户定义，见2.4 合同单位记录
  MAILING_ADDRESS				     VARCHAR(40)	           NOT NULL,-- 通信地址 指永久通信地址
  ZIP_CODE				     VARCHAR(6)	           NOT NULL,-- 邮政编码 对应通信地址的邮政编码
  PHONE_NUMBER_HOME				     VARCHAR(16)	           NOT NULL,-- 家庭电话号码 
  PHONE_NUMBER_BUSINESS				     VARCHAR(16)	           NOT NULL,-- 单位电话号码 
  NEXT_OF_KIN				     VARCHAR(8)	           NOT NULL,-- 联系人姓名 病人的亲属姓名
  RELATIONSHIP				     VARCHAR(2)	           NOT NULL,-- 与联系人关系 夫妻、父子等，使用代码，见1.19 社会关系字典
  NEXT_OF_KIN_ADDR				     VARCHAR(40)	           NOT NULL,-- 联系人地址 
  NEXT_OF_KIN_ZIP_CODE				     VARCHAR(6)	           NOT NULL,-- 联系人邮政编码 
  NEXT_OF_KIN_PHONE				     VARCHAR(16)	           NOT NULL,-- 联系人电话号码 
  LAST_VISIT_DATE				 DATE           NOT NULL,-- 上次就诊日期 由挂号与预约子系统根据就诊记录填写
  VIP_INDICATOR				     VARCHAR(1)	           NOT NULL,-- 重要任务标志  1-VIP  0-非VIP
  CREATE_DATE		   DATE		NULL,-- 建卡日期 
  OPERATOR		    VARCHAR(8)		NULL-- 操作员 最后修改本记录的操作员姓名
)
;


/**
9.2 病人住院主记录
本表描述病人住院记录，是病案首页的主记录，每次住院生成一条，由住院等级子系统在住院处办理入院手续时生成。病房分系统填入院期间的治疗信息。
在线长期保存。
日数据增长量=医院日平均入院病人数
主键：
**/
CREATE TABLE PAT_VISIT (
    PATIENT_ID				VARCHAR(10)		NOT NULL,-- 病人标识号  非空
    VISIT_ID				VARCHAR(2)		NOT NULL,-- 病人本次住院标识 病人每次住院，分配一个不同的标识，与病人标识一起，构成一个病人一次住院的唯一标识。可使用住院次数的绝对值或相对值  
    DEPT_ADMISSION_TO				VARCHAR(8)		NOT NULL,-- 入院科室  按统计要求的科室代码，见2.6 科室字典
    ADMISSION_DATE_TIME				DATE		NOT NULL,-- 入院日期及时间  非空
    DEPT_DISCHARGE_FROM				VARCHAR(10)		NOT NULL,-- 出院科室  按统计要求的科室代码，见2.6 科室字典
    DISCHARGE_DATE_TIME				DATE		NOT NULL,-- 出院日期及时间  
    OCCUPATION				VARCHAR(1)		NOT NULL,-- 职业  使用代码，见1.5 职业分类字典
    MARITAL_STATUS				VARCHAR(4)		NOT NULL,-- 婚姻状况  已婚、未婚、离婚、丧偶，使用规范名称，本系统定义，见1.2 婚姻状况字典
    IDENTITY				     VARCHAR(10)	           NOT NULL,-- 身份 使用规范名称，由用户定义，见1.6 身份字典
    ARMED_SERVICES				VARCHAR(10)		NOT NULL,-- 军种   军兵种，本系统定义，见1.7 军种字典
    DUTY				VARCHAR(10)		NOT NULL,-- 勤务  海勤、空勤，本系统定义，见1.7 勤务字典
    UNIT_IN_CONTRACT				     VARCHAR(11)	           NOT NULL,-- 合同单位 如果病人所在单位为本医院的合同单位或体系单位，则使用代码，否则为空。由身份登记子系统生成，住院等级子系统在班里入院时更新。代码由用户定义，见2.4 合同单位记录
    CHARGE_TYPE				     VARCHAR(8)	           NOT NULL,-- 费别 由身份登记子系统生成，住院等级子系统在班里入院时更新。使用规范名称，由用户定义，见1.9 费别字典
    WORKING_STATUS				VARCHAR(1)		NOT NULL,-- 在职标志  0-在职、1-离休、2-退休
    INSURANCE_TYPE				VARCHAR(16)		NOT NULL,-- 医保类别  如果此病人为医保病人，则记录反映本次住院支付方案的医保类别
    INSURANCE_NO				VARCHAR(18)		NOT NULL,-- 医疗保险号  如果此病人为医保病人，则记录其保险号
    SERVICE_AGENCY				VARCHAR(40)		NOT NULL,-- 工作单位  非空
    TOP_UNIT				VARCHAR(1)		NOT NULL,-- 隶属大单位  军队病人所属的大单位，见大单位字典
    SERVICE_SYSTEM_INDICATOR				VARCHAR(1)		NOT NULL,-- 医疗体系病人标志  对军队病人 0-非体系病人、1-体系病人、其他病人为空
    MAILING_ADDRESS				     VARCHAR(40)	           NOT NULL,-- 通信地址 指永久通信地址
    ZIP_CODE				     VARCHAR(6)	           NOT NULL,-- 邮政编码 对应通信地址的邮政编码
    NEXT_OF_KIN				     VARCHAR(8)	           NOT NULL,-- 联系人姓名 病人的亲属姓名
    RELATIONSHIP				     VARCHAR(2)	           NOT NULL,-- 与联系人关系 夫妻、父子等，使用代码，见1.19 社会关系字典
    NEXT_OF_KIN_ADDR				     VARCHAR(40)	           NOT NULL,-- 联系人地址 
    NEXT_OF_KIN_ZIP_CODE				     VARCHAR(6)	           NOT NULL,-- 联系人邮政编码 
    NEXT_OF_KIN_PHONE				     VARCHAR(16)	           NOT NULL,-- 联系人电话号码 
    PATIENT_CLASS				VARCHAR(1)		NOT NULL,-- 入院方式  使用代码，门诊、急诊、转入等，见1.11 入院方式字典
    ADMISSION_CAUSE				VARCHAR(8)		NOT NULL,-- 住院目的  使用规范名称，治疗、查体、计划生育等，见1.14 住院目的字典
    CONSULTING_DATE				DATE		NOT NULL,-- 接诊日期  指门诊接诊日期
    PAT_ADM_CONDITION				VARCHAR(1)		NOT NULL,-- 入院病情  使用代码，危、急、一般，见1.21 入院病情字典
    CONSULTING_DOCTOR				VARCHAR(8)		NOT NULL,-- 门诊医师  
    ADMITTED_BY				VARCHAR(8)		NOT NULL,-- 办理入院者  
    EMER_TREAT_TIMES				VARCHAR(2)		NOT NULL,-- 抢救次数  由病房入出转子系统填入
    ESC_EMER_TIMES				VARCHAR(2)		NOT NULL,-- 抢救成功次数  由病房入出转子系统填入
    SERIOUS_COND_DAYS				VARCHAR(4)		NOT NULL,-- 病重天数  病重累计天数
    CRITICAL_COND_DAYS				VARCHAR(4)		NOT NULL,-- 病危天数  病危累计天数
    ICU_DAYS				VARCHAR(4)		NOT NULL,-- ICU天数  病人住ICU的累计天数
    CCU_DAYS				VARCHAR(4)		NOT NULL,-- CCU天数  病人住CCU的累计天数
    SPEC_LEVEL_NURS_DAYS				VARCHAR(4)		NOT NULL,-- 特级护理天数  由病房入出转子系统填入
    FIRST_LEVEL_NURS_DAYS				VARCHAR(4)		NOT NULL,-- 一级护理天数  由病房入出转子系统填入
    SECOND_LEVEL_NURS_DAYS				VARCHAR(10)		NOT NULL,-- 二级护理天数  由病房入出转子系统填入
    AUTOPSY_LEVEL_NURS_DAYS				VARCHAR(1)		NOT NULL,-- 尸检标识  1-尸检 0-否
    BLOOD_TYPE				VARCHAR(2)		NOT NULL,-- 血型  由病房入出转子系统填入。使用规范名称，见1.4 血型字典
    BLOOD_TYPE_RH				VARCHAR(1)		NOT NULL,-- RH血型   取值：+、-
    INFUSION_REACT_TIMES				VARCHAR(2)		NOT NULL,-- 输液反应次数  
    BLOOD_TRAN_TIMES				VARCHAR(2)		NOT NULL,-- 输血次数  由病房入出转子系统填入
    BLOOD_TRAN_VOL				VARCHAR(5)		NOT NULL,-- 输血总量  单位：毫升。由病房入出转子系统填入
    BLOOD_TRAN_REACT_TIMES				VARCHAR(2)		NOT NULL,-- 输血反应次数  由病房入出转子系统填入
    DECUBITAL_ULCER_TIMES				VARCHAR(10)		NOT NULL,-- 发生褥疮次数  
    ALERGY_DRUGS				VARCHAR(80)		NOT NULL,-- 过敏药物  过敏药物名称，正文描述，可为多项，若没有，则为空
    ADVERSE_REACTION_DRUGS				VARCHAR(80)		NOT NULL,-- 不良反应药物名称，正文描述，若没有，则为空  非空
    MR_VALUE				VARCHAR(4)		NOT NULL,-- 病案价值  使用规范名称，见3.11病案价值字典
    MR_QUALITY				VARCHAR(2)		NOT NULL,-- 病案质量  使用规范名称，见3.10 病案质量字典
    FOLLOW_INDICATOR				VARCHAR(1)		NOT NULL,-- 随诊标志  使用代码，1-随着 0-不随诊
    FOLLOW_INTERVAL				VARCHAR(2)		NOT NULL,-- 随诊期限  
    FOLLOW_INTERVAL_UNITS				VARCHAR(2)		NOT NULL,-- 随诊期限单位  年、月
    DIRECTOR				VARCHAR(8)		NOT NULL,-- 科主任  由病房入出转子系统填入
    ATTENDING_DOCTOR				VARCHAR(8)		NOT NULL,-- 主治医生  由病房入出转子系统填入  这里是不是单词选反了
    DOCTOR_IN_CHARGE				VARCHAR(8)		NOT NULL,-- 经治医师  由病房入出转子系统填入
    DISCHARGE_DISPOSITION				VARCHAR(1)		NOT NULL,-- 出院方式  使用代码，正常、转院、死亡等，见1.12 出院方式字典
    TOTAL_COSTS				NUMERIC(10,2)		NOT NULL,-- 总费用  按价表计算得到的开销，由住院收费子系统填写
    TOTAL_PAYMENTS				NUMERIC(10,2)	NOT NULL,-- 实际费用  实际支付费用，由住院收费子系统填写
    CATALOG_DATE				DATE	NOT NULL,-- 编目日期  进行ICD分类或录入日期
    CATALOGER				VARCHAR(8)		NOT NULL-- 编目人  进行ICD分类的人员姓名

)
;
/**
9.3 病人在科记录
本表描述医生为病人所下的各种诊断，包括门诊诊断、入院诊断、出院诊断、病理诊断等等，每种诊断可以有多个，按重要程度次序排列。
本表数据由病房管理分系统负责录入。以1000张床位，每年出院1万名病人，每人平均三条诊断计，每年的数据增长量约为3万条。长期在线保存

主键：
**/
CREATE TABLE TRANSFER (
    PATIENT_ID				VARCHAR(10)		NOT NULL,-- 病人标识号  非空
    VISIT_ID				VARCHAR(2)		NOT NULL,-- 病人本次住院标识 非空 病人每次住院，分配一个不同的标识，与病人标识一起，构成一个病人一次住院的唯一标识。可使用住院次数的绝对值或相对值  
    DEPT_STAYED				VARCHAR(8)		NOT NULL,--所在科室  科室编码，见2.6科室字典
    ADMISSION_DATE_TIME		DATE		NOT NULL,-- 入科日期及时间  
    DISCHARGE_DATE_TIME		DATE		NOT NULL,-- 出科日期及时间   
    DEPT_TRANSFERED_TO		VARCHAR(8)			NOT NULL,-- 转向科室  如果病人转向其他科室，为转向科室的编码，见2.6 科室字典，若为正常出院或转院，则为空
    DOCTOR_IN_CHARGE		VARCHAR(8)		NULL--经治医师  在本科的经治医师
)
;


/**
9.4 诊断记录
本表描述医生为病人所下的各种诊断，包括门诊诊断、入院诊断、出院诊断、病理诊断等等，每种诊断可以有多个，按重要程度次序排列。
本表数据由病房管理分系统负责录入。以1000张床位，每年出院1万名病人，每人平均三条诊断计，每年的数据增长量约为3万条。长期在线保存

主键：
**/
CREATE TABLE DIAGNOSIS (
    PATIENT_ID				VARCHAR(10)		NOT NULL,-- 病人标识号  非空
    VISIT_ID				VARCHAR(2)		NOT NULL,-- 病人本次住院标识 病人每次住院，分配一个不同的标识，与病人标识一起，构成一个病人一次住院的唯一标识。可使用住院次数的绝对值或相对值  
    DIAGNOSIS_TYPE				VARCHAR(1)		NOT NULL,-- 诊断类别  反映入院、出院、门诊、病理诊断等，见4.4 诊断类别字典
    DIAGNOSIS_NO				VARCHAR(2)		NOT NULL,-- 诊断序号  依重要次序，由小到大排列
    DIAGNOSIS_DESC				VARCHAR(80)		NOT NULL,-- 诊断  医生诊断描述。由病房管理分分系统录入。
    DIAGNOSIS_DATE				DATE		NOT NULL,-- 诊断日期  确定本诊断的日期
    TREAT_DAYS				NUMERIC(3,0)		NOT NULL,-- 治疗天数  本治疗的治疗天数
    TREAT_RESULT				VARCHAR(4)		NOT NULL,-- 治疗结果  使用规范名称，好转、治愈等，见4.28 治疗结果字典
    OPER_TREAT_INDICATOR		    VARCHAR(1)		NULL--手术治疗标志  此诊断是否采取手术治疗，0-非手术治疗 1-手术治疗
)
;

/**
9.5 门诊诊断记录
此表为诊断记录的门诊诊断部分的视图。除无诊断类别字段外，其他字段与诊断记录相同。
主键：
**/
CREATE VIEW CLINIC_DIAGNOSIS AS SELECT PATIENT_ID,VISIT_ID,DIAGNOSIS_NO,DIAGNOSIS_DESC,DIAGNOSIS_DATE,TREAT_DAYS,TREAT_RESULT,OPER_TREAT_INDICATOR FROM DIAGNOSIS;


/**
主要诊断 
此表为诊断记录的出院(最后)第一诊断的视图
*/
CREATE VIEW FINAL_CHIEF_DIAGNOSIS AS SELECT PATIENT_ID,VISIT_ID,DIAGNOSIS_NO,DIAGNOSIS_DESC,DIAGNOSIS_DATE,TREAT_DAYS,TREAT_RESULT,OPER_TREAT_INDICATOR FROM DIAGNOSIS;

/**
9.6 诊断分类记录
此表为诊断编目所设，由病案编目子系统录入。医生所下的每个诊断可以从不同的角度赋予多个分类编码。如肿瘤，既可以按部位编码，也可以按形态学编码。
数据增长量略大于诊断记录的增长量。长期在线保存
主键： 
**/
CREATE TABLE DIAGNOSIS (
    PATIENT_ID				VARCHAR(10)		NOT NULL,-- 病人标识号  非空
    VISIT_ID				VARCHAR(2)		NOT NULL,-- 病人本次住院标识 病人每次住院，分配一个不同的标识，与病人标识一起，构成一个病人一次住院的唯一标识。可使用住院次数的绝对值或相对值  
    DIAGNOSIS_TYPE				VARCHAR(1)		NOT NULL,-- 诊断类别  反映入院、出院、门诊、病理诊断等，见4.4 诊断类别字典
    DIAGNOSIS_NO				VARCHAR(2)		NOT NULL,-- 诊断序号  依重要次序，由小到大排列
    DIAGNOSIS_CODE		    VARCHAR(16)		NULL--诊断代码  使用ICD9 见4.1 疾病字典
)
;

