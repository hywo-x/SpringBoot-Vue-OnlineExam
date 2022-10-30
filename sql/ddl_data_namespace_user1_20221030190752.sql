

-- Name: user1; Type: Schema; Schema:  ;

CREATE SCHEMA user1;



SET search_path = user1 ;



-- Name: func_delete_student; Type: Function; Schema: user1;

CREATE OR REPLACE FUNCTION user1.func_delete_student(stu_id integer)
 RETURNS integer
 LANGUAGE plpgsql
 NOT FENCED NOT SHIPPABLE
AS $$

DECLARE

	/*declaration_section*/

BEGIN
  DELETE FROM fail_student WHERE studentid=stu_id;
  DELETE FROM score WHERE studentid=stu_id;
  DELETE FROM student WHERE studentid=stu_id;
	/*executable_section*/
  RETURN TRUE;
END;$$;
/

-- Name: func_delete_teacher; Type: Function; Schema: user1;

CREATE OR REPLACE FUNCTION user1.func_delete_teacher()
 RETURNS trigger
 LANGUAGE plpgsql
 NOT FENCED NOT SHIPPABLE
AS $$
DECLARE
BEGIN
    update student set teacherid=NULL where teacherid=OLD.teacherid;
    RETURN OLD;
END;
$$;
/

-- Name: func_insert2fail_student; Type: Function; Schema: user1;

CREATE OR REPLACE FUNCTION user1.func_insert2fail_student()
 RETURNS trigger
 LANGUAGE plpgsql
 NOT FENCED NOT SHIPPABLE
AS $$
DECLARE
BEGIN
    INSERT INTO fail_student VALUES(NEW.examCode, NEW.studentId, NEW.etscore);
    RETURN NEW;
END;
$$;
/

-- Name: prd_add_question; Type: Function; Schema: user1;

CREATE OR REPLACE PROCEDURE user1.prd_add_question(question_type integer, q_subject character varying, q_question character varying, q_analysis character varying, q_level character varying, q_section character varying, q_answer character varying, q_ansa character varying, q_ansb character varying, q_ansc character varying, q_ansd character varying)
AS 
DECLARE

	/*declaration_section*/

BEGIN
  IF question_type=1 THEN
    INSERT INTO fill_question(subject, question, answer, analysis, section, level) 
    VALUES(q_subject,q_question,q_answer,q_analysis,q_section,q_level);
  ELSIF question_type=2 THEN
    INSERT INTO judge_question(subject, question, answer, analysis, section, level) 
    VALUES(q_subject,q_question,q_answer,q_analysis,q_section,q_level);
  ELSE
    INSERT INTO multi_question(subject,question,answerA,answerB,answerC,answerD,rightAnswer,analysis,section,level) 
    VALUES(q_subject,q_question,q_ansA,q_ansB,q_ansC,q_ansD,q_answer,q_analysis,q_section,q_level);
	END IF;
	/*executable_section*/

END;
/
/

-- Name: prd_admin_delete; Type: Function; Schema: user1;

CREATE OR REPLACE PROCEDURE user1.prd_admin_delete(admin_id integer)
AS 
DECLARE

	/*declaration_section*/

BEGIN
  DELETE FROM admin WHERE adminId=admin_id;
	/*executable_section*/

END;
/
/

-- Name: prd_delete_exam; Type: Function; Schema: user1;

CREATE OR REPLACE PROCEDURE user1.prd_delete_exam(exam_id integer)
AS 
DECLARE

	/*declaration_section*/

BEGIN
  DELETE FROM exam_manage WHERE examCode=exam_id;
	/*executable_section*/

END;
/
/

-- Name: prd_insert_update_admin; Type: Function; Schema: user1;

CREATE OR REPLACE PROCEDURE user1.prd_insert_update_admin(a_id integer, a_name character varying, a_sex character varying, a_tel character varying, a_email character varying, a_pwd character varying, a_cardid character varying, a_role character varying)
AS 
DECLARE
	/*declaration_section*/
	CURSOR cr_admin IS
	SELECT adminid FROM admin WHERE adminId = a_id;
	/*SELECT studentname, grade, major, clazz, institute, tel, eamil, pwd, cardid, sex, role FROM student WHERE studentId = stu_id;*/
	id INTEGER;
	
BEGIN
  OPEN cr_admin;
  FETCH cr_admin INTO id;
  IF cr_admin%NOTFOUND THEN
    INSERT INTO admin(adminname, sex, tel, eamil, pwd, cardId, role) 
    VALUES(a_name, a_sex, a_tel, a_email, a_pwd, a_cardId, a_role);
	ELSE 
	  UPDATE admin SET adminName=a_name, sex=a_sex, tel=a_tel, email=a_email, pwd=a_pwd, cardId=a_cardId, role=a_role
	  WHERE adminId=a_id;
	END IF;
	CLOSE cr_admin;
	/*executable_section*/
END;
/
/

-- Name: prd_insert_update_exam; Type: Function; Schema: user1;

CREATE OR REPLACE PROCEDURE user1.prd_insert_update_exam(e_id integer, e_description character varying, e_source character varying, e_paperid integer, e_examdate character varying, e_totaltime integer, e_grade character varying, e_term character varying, e_major character varying, e_institute character varying, e_totalscore integer, e_type character varying, e_tips character varying)
AS 
DECLARE
/*declaration_section*/
  CURSOR c_exam IS SELECT examCode
                     FROM exam_manage
                    WHERE examCode = e_id;
/*SELECT studentname, grade, major, clazz, institute, tel, eamil, pwd, cardid, sex, role FROM student WHERE studentId = stu_id;*/
  id INTEGER;
BEGIN
  OPEN c_exam;
  FETCH c_exam INTO id;
  IF c_exam % NOTFOUND THEN
    INSERT INTO exam_manage
      (description, source, paperId, examDate, totalTime, grade, term, major, institute, totalScore, type, tips)
    VALUES
      (e_description, e_source, e_paperid, e_examdate, e_totaltime, e_grade, e_term, e_major, e_institute, e_totalscore, e_type, e_tips);
  ELSE
    UPDATE exam_manage
       SET description = e_description, source = e_source, paperId = e_paperid, examDate = e_examdate, totalTime = e_totaltime, grade = e_grade, term = e_term, major = e_major, institute = e_institute, totalScore = e_totalscore, type = e_type, tips = e_tips
     WHERE examCode = e_id;
  END IF;
  CLOSE c_exam;
  /*executable_section*/
END;
/
/

-- Name: prd_insert_update_message; Type: Function; Schema: user1;

CREATE OR REPLACE PROCEDURE user1.prd_insert_update_message(m_id integer, m_title character varying, m_content character varying, m_time character varying)
AS 
DECLARE
  CURSOR c1 IS
	SELECT id FROM message WHERE id = m_id;
	/*declaration_section*/
  tmp_id INTEGER;
BEGIN
  OPEN c1;
  FETCH c1 into tmp_id;
  IF c1 % NOTFOUND THEN
    INSERT INTO message(title, content, time) VALUES(m_title, m_content, m_time);
  ELSE
    UPDATE message SET title=m_title, content=m_content, time=m_time WHERE id=m_id;
	/*executable_section*/
  END IF;
	CLOSE c1;
END;
/
/

-- Name: prd_insert_update_reply; Type: Function; Schema: user1;

CREATE OR REPLACE PROCEDURE user1.prd_insert_update_reply(r_id integer, m_id integer, r_content character varying, r_time character varying)
AS 
DECLARE
  CURSOR c1 IS
	SELECT replayid FROM replay WHERE replayid = r_id;
	/*declaration_section*/
  tmp_id INTEGER;
BEGIN
  OPEN c1;
  FETCH c1 into tmp_id;
  IF c1 % NOTFOUND THEN
    INSERT INTO replay(messageId, replay, replayTime) VALUES(m_id, r_content, r_time);
  ELSE
    UPDATE replay SET replay=r_content, replayTime=r_time WHERE replayid=r_id;
	/*executable_section*/
  END IF;
	CLOSE c1;
END;
/
/

-- Name: prd_insert_update_student; Type: Function; Schema: user1;

CREATE OR REPLACE PROCEDURE user1.prd_insert_update_student(stu_id integer, stu_name character varying, stu_grade character varying, stu_major character varying, stu_class character varying, stu_institute character varying, stu_tel character varying, stu_email character varying, stu_pwd character varying, stu_cardid character varying, stu_sex character varying, stu_role character varying, teacher_id integer)
AS 
DECLARE
	/*declaration_section*/
	CURSOR cr_stu1 IS
	SELECT studentid FROM student WHERE studentId = stu_id;
	/*SELECT studentname, grade, major, clazz, institute, tel, eamil, pwd, cardid, sex, role FROM student WHERE studentId = stu_id;*/
	s_id INTEGER;
	
BEGIN
  OPEN cr_stu1;
  FETCH cr_stu1 INTO s_id;
  IF cr_stu1%NOTFOUND THEN
    INSERT INTO student(studentname, grade, major, clazz, institute, tel, 
                        email, pwd, cardid, sex, role, teacherid) 
    VALUES(stu_name, stu_grade, stu_major, stu_class, stu_institute, stu_tel, 
                        stu_email, stu_pwd, stu_cardId, stu_sex, stuVALUE, teacher_id);
	ELSE 
	  UPDATE student SET studentname=stu_name, grade=stu_grade, major=stu_major, clazz=stu_class, institute=stu_institute, tel=stu_tel,
	  email=stu_email, pwd=stu_pwd, cardId=stu_cardId, sex=stu_sex, role=stu_role, teacherid=teacher_id
	  WHERE studentId=stu_id;
	END IF;
	CLOSE cr_stu1;
	/*executable_section*/
END;
/
/

-- Name: prd_insert_update_teacher; Type: Function; Schema: user1;

CREATE OR REPLACE PROCEDURE user1.prd_insert_update_teacher(t_id integer, t_name character varying, t_sex character varying, t_tel character varying, t_email character varying, t_pwd character varying, t_cardid character varying, t_role character varying, t_type character varying, t_institute character varying)
AS 
DECLARE
	/*declaration_section*/
	CURSOR c_tea IS
	SELECT teacherid FROM teacher WHERE teacherId = t_id;
	/*SELECT studentname, grade, major, clazz, institute, tel, eamil, pwd, cardid, sex, role FROM student WHERE studentId = stu_id;*/
	id INTEGER;
	
BEGIN
  OPEN c_tea;
  FETCH c_tea INTO id;
  IF c_tea%NOTFOUND THEN
    INSERT INTO teacher(teachername, sex, tel, email, pwd, cardId, role, type, institute) 
    VALUES(t_name, t_sex, t_tel, t_email, t_pwd, t_cardId, t_role, t_type, t_institute);
	ELSE 
	  UPDATE teacher SET teachername=t_name, sex=t_sex, tel=t_tel, email=t_email, pwd=t_pwd, cardId=t_cardId, role=t_role, type=t_type,
	     institute=t_institute
	  WHERE teacherId=t_id;
	END IF;
	CLOSE c_tea;
	/*executable_section*/
END;
/
/

-- Name: prd_login_admin; Type: Function; Schema: user1;

CREATE OR REPLACE PROCEDURE user1.prd_login_admin(user_id integer, user_pwd character varying, OUT uid integer, OUT uname character varying, OUT usex character varying, OUT utel character varying, OUT uemail character varying, OUT ucardid character varying, OUT urole character varying)
AS 
DECLARE
/*declaration_section*/
  CURSOR a_cursor IS SELECT adminId, adminName, sex, tel, email, cardId, role
                       FROM admin
                      WHERE adminId = user_id
                        AND pwd = user_pwd;
BEGIN
  OPEN a_cursor;
  FETCH a_cursor INTO uid, uname, usex, utel, uemail, ucardId, urole;
  CLOSE a_cursor;
  /*executable_section*/
END;
/
/

-- Name: admin; Type: Table; Schema: user1;

SET search_path = user1;
CREATE TABLE admin (
	adminid integer DEFAULT nextval('admin_adminid_seq'::regclass) NOT NULL,
	adminname character varying(20) DEFAULT NULL::character varying,
	sex character varying(3) DEFAULT NULL::character varying,
	tel character varying(11) DEFAULT NULL::character varying,
	email character varying(20) DEFAULT NULL::character varying,
	pwd character varying(32) DEFAULT NULL::character varying,
	cardid character varying(18) DEFAULT NULL::character varying,
	role character varying(1) DEFAULT NULL::character varying
)
WITH (orientation=row, compression=no);
ALTER TABLE admin ADD CONSTRAINT admin_pkey PRIMARY KEY (adminid);

--Data for  Name: admin; Type: Table; Schema: user1;

INSERT INTO user1.admin (adminid,adminname,sex,tel,email,pwd,cardid,role)
 VALUES (9527,'超级管理员','男','13658377857','1253838283@qq.com','E10ADC3949BA59ABBE56E057F20F883E','3132','0');


-- Name: exam_manage; Type: Table; Schema: user1;

SET search_path = user1;
CREATE TABLE exam_manage (
	examcode integer DEFAULT nextval('exam_manage_examcode_seq'::regclass) NOT NULL,
	description character varying(50) DEFAULT NULL::character varying,
	source character varying(20) DEFAULT NULL::character varying,
	paperid integer,
	examdate character varying(10) DEFAULT NULL::character varying,
	totaltime integer,
	grade character varying(10) DEFAULT NULL::character varying,
	term character varying(10) DEFAULT NULL::character varying,
	major character varying(40) DEFAULT NULL::character varying,
	institute character varying(20) DEFAULT NULL::character varying,
	totalscore integer,
	type character varying(255) DEFAULT NULL::character varying,
	tips character varying(255) DEFAULT NULL::character varying
)
WITH (orientation=row, compression=no);
ALTER TABLE exam_manage ADD CONSTRAINT exam_manage_pkey PRIMARY KEY (examcode);

--Data for  Name: exam_manage; Type: Table; Schema: user1;

INSERT INTO user1.exam_manage (examcode,description,source,paperid,examdate,totaltime,grade,term,major,institute,totalscore,type,tips)
 VALUES (20190001,'2019年上期期末考试','计算机网络',1001,'2019-03-21',120,'2018','1','计算机科学与技术','软件工程学院',100,'期末考试','快乐千万条，学习第一条，平时不努力，考试两行泪。');
INSERT INTO user1.exam_manage (examcode,description,source,paperid,examdate,totaltime,grade,term,major,institute,totalscore,type,tips)
 VALUES (20190002,'2019年上期期末考试','数据库理论',1002,'2019-03-07',90,'2018','2','网络工程','软件工程学院',100,'期末考试','快乐千万条，学习第一条，平时不努力，考试两行泪。');
INSERT INTO user1.exam_manage (examcode,description,source,paperid,examdate,totaltime,grade,term,major,institute,totalscore,type,tips)
 VALUES (20190003,'2018年下期期末考试','数据结构',1003,'2019-02-27',90,'2017','1','软件工程','软件工程学院',100,'期末考试','快乐千万条，学习第一条，平时不努力，考试两行泪。');
INSERT INTO user1.exam_manage (examcode,description,source,paperid,examdate,totaltime,grade,term,major,institute,totalscore,type,tips)
 VALUES (20190005,'2018年上期期末考试','计算机导论',1004,'2019-03-14',90,'2018','1','计算机科学与技术','软件工程学院',100,'期末考试','快乐千万条，学习第一条，平时不努力，考试两行泪。');
INSERT INTO user1.exam_manage (examcode,description,source,paperid,examdate,totaltime,grade,term,major,institute,totalscore,type,tips)
 VALUES (20190006,'2017年上期期末考试','软件工程',1005,'2019-03-21',120,'2018','1','计算机科学与技术','软件工程学院',100,'期末考试','快乐千万条，学习第一条，平时不努力，考试两行泪。');
INSERT INTO user1.exam_manage (examcode,description,source,paperid,examdate,totaltime,grade,term,major,institute,totalscore,type,tips)
 VALUES (20190007,'2018年上期期末考试','操作系统',1006,'2019-03-13',120,'2018','2','计算机科学与技术','软件工程学院',100,'期末考试','快乐千万条，学习第一条，平时不努力，考试两行泪。');
INSERT INTO user1.exam_manage (examcode,description,source,paperid,examdate,totaltime,grade,term,major,institute,totalscore,type,tips)
 VALUES (20190008,'2018年下期期末考试','C语言',1007,'2019-03-13',120,'2018','1','信息工程','软件工程学院',100,'期末考试','快乐千万条，学习第一条，平时不努力，考试两行泪。');
INSERT INTO user1.exam_manage (examcode,description,source,paperid,examdate,totaltime,grade,term,major,institute,totalscore,type,tips)
 VALUES (20190009,'2018年上期期末考试','高等数学',1008,'2019-03-07',90,'2018','1','信息工程','软件工程学院',100,'期末考试','快乐千万条，学习第一条，平时不努力，考试两行泪。');
INSERT INTO user1.exam_manage (examcode,description,source,paperid,examdate,totaltime,grade,term,major,institute,totalscore,type,tips)
 VALUES (20190013,'测试','测试',1009,'2019-04-24',120,'2017',null,'测试','测试',100,'期末考试','请不要带与考试无关的书籍。');


-- Name: fill_question; Type: Table; Schema: user1;

SET search_path = user1;
CREATE TABLE fill_question (
	questionid integer DEFAULT nextval('fill_question_questionid_seq'::regclass) NOT NULL,
	subject character varying(20) DEFAULT NULL::character varying,
	question character varying(255) DEFAULT NULL::character varying,
	answer character varying(255) DEFAULT NULL::character varying,
	analysis character varying(255) DEFAULT NULL::character varying,
	score integer DEFAULT 2,
	level character varying(5) DEFAULT NULL::character varying,
	section character varying(20) DEFAULT NULL::character varying
)
WITH (orientation=row, compression=no);
ALTER TABLE fill_question ADD CONSTRAINT fill_question_pkey PRIMARY KEY (questionid);

--Data for  Name: fill_question; Type: Table; Schema: user1;

INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10000,'计算机网络','从计算机网络系统组成的角度看，计算机网络可以分为()和()','通信子网资源子网',null,2,'3',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10001,'计算机网络','收发电子邮件，属于ISO/OSI RM中 ()层的功能。','应用',null,2,'1',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10002,'计算机网络','在TCP/IP层次模型中与OSI参考模型第四层相对应的主要协议有()和(),其中后者提供无连接的不可靠传输服','TCP（传输控制协议） UDP（用户数据报协议） ',null,2,'2',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10003,'计算机网络','计算机网络中常用的三种有线媒体是 (),()和 ()','同轴电缆.双绞线 光纤',null,2,'1',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10004,'计算机网络','国内最早的四大网络包括原邮电部的ChinaNet. 原电子部的ChinaGBN. 教育部的()和中科院的CSTnet','CERnet (或中国教育科研网)',null,2,'4',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10005,'计算机网络','复盖一个国家，地区或几个洲的计算机网络称为()，在同一建筑或复盖几公里内范围的网络称为()，而介于两者之间的是()',' 广域网       局域网     城域网',null,2,'1',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10006,'计算机网络','Outlook等常用电子邮件软件接收邮件使用的协议是(),发送邮件时使用的协议是()','POP3    SMTP    ',null,2,'1',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10007,'计算机网络','通信系统中，称调制前的电信号为()信号，调制后的信号为调制信号','基带',null,2,'1',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10008,'计算机网络','按照IPV4标准,IP地址205.3.127.13属于()类地址','C',null,2,'1',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10009,'计算机网络','计算机网络采用()技术，而传统电话网络则采用()技术','分组交换电路交换',null,2,'1',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10010,'计算机网络','计算机内传输的信号是()，而公用电话系统的传输系统只能传输()','数字信号模拟信号',null,2,'1',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10011,'计算机网络','通信系统中，称调制前的电信号为()，调制后的信号叫()。','基带信号调制信号',null,2,'1',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10012,'计算机网络','IP地址分()和()两个部分','网络号主机号',null,2,'1',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10013,'计算机网络',' IP地址协议作网间网中()层协议，提供无连接的数据报传输机制，IP数据报也分为()和()两个部分','网络报头数据区',null,2,'2',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10014,'计算机网络','()是一个简单的远程终端协议。','TELNET',null,2,'1',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10015,'计算机网络','在同一个系统内，相邻层之间交换信息的连接点称之为()，而低层模块向高层提供功能性的支持称之为()。','接口服务',null,2,'1',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10016,'计算机网络','Internet广泛使用的电子邮件传送协议是()','SMTP',null,2,'1',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10017,'计算机网络','按交换方式来分类，计算机网络可以分为电路交换网，  报文交换网  和()三种','分组交换网',null,2,'3',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10018,'计算机网络','Intranet分层结构包括网络、(),应用三个层次。','服务',null,2,'1',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10019,'计算机网络','WWW上的每一个网页都有一个独立的地址，这些地址称为  ()','统一资源定位器/URL ',null,2,'2',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10020,'计算机网络','分组交换网中，附加信息用来在网络中进行路由选择、() 和流量控制','差错纠正  ',null,2,'4',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10021,'计算机网络','根据IEEE802模型的标准将数据链路层划分为LLC子层和 ()子层。',' MAC ',null,2,'3',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10022,'计算机网络','据交换的路由信息的不同，路由算法可以分为两大类：  ()  和链路状态算法','距离向量算法',null,2,'3',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10023,'计算机网络','假定某信道受奈氏准则限制的最高码元速率为2000码元/秒。如果采用振幅调制，把码元的振幅划分为16个不同等级来传送，那么可以获得的数据率为 () b/s。','80000 ',null,2,'5',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10024,'计算机网络','交换型以太网系统中的 ()  ，以其为核心联接站点或者网段，端口之间帧的输入和输出已不再受到CSMA/CD媒体访问控制协议的约束。','以太网交换器 ',null,2,'5',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10025,'计算机网络','局域网络参考模型是以 ()标准为基础的','IEEE802',null,2,'5',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10026,'计算机网络','路由器的核心是 () 。',' 路由表',null,2,'3',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10027,'计算机网络','若 HDLC 帧数据段中出现比特串“ 01011111110 ”，则比特填充后的输出为()','10111110110',null,2,'5',null);
INSERT INTO user1.fill_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10028,'计算机网络','数字调制的三种基本形式：移幅键控法ASK、 ()、移相键控法PSK','移频键控法FSK',null,2,'5',null);


-- Name: judge_question; Type: Table; Schema: user1;

SET search_path = user1;
CREATE TABLE judge_question (
	questionid integer DEFAULT nextval('judge_question_questionid_seq'::regclass) NOT NULL,
	subject character varying(20) DEFAULT NULL::character varying,
	question character varying(255) DEFAULT NULL::character varying,
	answer character varying(255) DEFAULT NULL::character varying,
	analysis character varying(255) DEFAULT NULL::character varying,
	score integer DEFAULT 2,
	level character varying(1) DEFAULT NULL::character varying,
	section character varying(20) DEFAULT NULL::character varying
)
WITH (orientation=row, compression=no);
ALTER TABLE judge_question ADD CONSTRAINT judge_question_pkey PRIMARY KEY (questionid);

--Data for  Name: judge_question; Type: Table; Schema: user1;

INSERT INTO user1.judge_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10001,'计算机网络','与有线网相比,无线网的数据传输率一般相对较慢','T',null,2,'1',null);
INSERT INTO user1.judge_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10002,'计算机网络','OSI参考模型中,不同节点的同等层具有不同的功能','F',null,2,'1',null);
INSERT INTO user1.judge_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10003,'计算机网络','普通电脑不能作为服务器','F',null,2,'1',null);
INSERT INTO user1.judge_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10004,'计算机网络','没有网线的电脑不能连入互联网','F',null,2,'1',null);
INSERT INTO user1.judge_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10005,'计算机网络','网卡必须安装驱动程序','T',null,2,'2',null);
INSERT INTO user1.judge_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10006,'计算机网络','UTP为屏蔽双绞线','F',null,2,'2',null);
INSERT INTO user1.judge_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10007,'计算机网络','网络接口卡又称为网卡,它是构成网络的基本部件','T',null,2,'2',null);
INSERT INTO user1.judge_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10008,'计算机网络','无线AP可以成倍地扩展网络覆盖范围','T',null,2,'3',null);
INSERT INTO user1.judge_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10009,'计算机网络','SMTP是一组用于由源地址到目的地址传送邮件的协议','T',null,2,'4',null);
INSERT INTO user1.judge_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10010,'计算机网络','任务管理器可以关闭所有的进程','F',null,2,'3',null);
INSERT INTO user1.judge_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10011,'计算机网络','利用BT下载时,用户越多,下载速度越快','T',null,2,'2',null);
INSERT INTO user1.judge_question (questionid,subject,question,answer,analysis,score,level,section)
 VALUES (10012,'计算机网络','INTERNET上向朋友发送电子邮件,必须知道对方的真实姓名和家庭住址','F',null,2,'1',null);


-- Name: message; Type: Table; Schema: user1;

SET search_path = user1;
CREATE TABLE message (
	id integer DEFAULT nextval('message_id_seq'::regclass) NOT NULL,
	title character varying(50) DEFAULT NULL::character varying,
	content character varying(255) DEFAULT NULL::character varying,
	"time" timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
)
WITH (orientation=row, compression=no);
ALTER TABLE message ADD CONSTRAINT message_pkey PRIMARY KEY (id);

--Data for  Name: message; Type: Table; Schema: user1;

INSERT INTO user1.message (id,title,content,time)
 VALUES (2,'晚上加班,这感觉非常的nice','今天是星期一的晚上,下班后回到宿舍继续写我的毕业设计,看着项目功能日渐丰满好开心哦,你们也要元气满满哦！','2019-03-18 00:00:00');
INSERT INTO user1.message (id,title,content,time)
 VALUES (15,'咸鱼','我是一条咸鱼','2019-03-18 00:00:00');
INSERT INTO user1.message (id,title,content,time)
 VALUES (16,'今天中午吃什么','今天去吃莲藕排骨汤吧，虽然也不好吃，但这里真的没什么东西可以吃了','2019-03-18 00:00:00');
INSERT INTO user1.message (id,title,content,time)
 VALUES (20,'这个网站不错','博主大大好厉害，网页看着很清新呢，喜欢这样嘞风格。','2019-03-18 00:00:00');
INSERT INTO user1.message (id,title,content,time)
 VALUES (21,'男孩子','哇，这么可爱，那肯定是男孩子呀。','2019-03-18 00:00:00');
INSERT INTO user1.message (id,title,content,time)
 VALUES (22,'好人','你是个好人，可是我们不合适。','2019-03-18 00:00:00');
INSERT INTO user1.message (id,title,content,time)
 VALUES (25,'小乔','花会枯萎，爱永不凋零，小乔要努力变强。','2019-03-18 00:00:00');
INSERT INTO user1.message (id,title,content,time)
 VALUES (26,'妲己','妲己会一直爱主人，因为被设定成这样，来和妲己玩耍吧。','2019-03-18 00:00:00');
INSERT INTO user1.message (id,title,content,time)
 VALUES (27,'土味情话','妈妈从小对我讲，不要早恋，遇到你以后，我决定不听妈妈的话了。','2019-03-31 00:00:00');
INSERT INTO user1.message (id,title,content,time)
 VALUES (35,'贝塔','开坦克','2019-09-05 00:00:00');


-- Name: multi_question; Type: Table; Schema: user1;

SET search_path = user1;
CREATE TABLE multi_question (
	questionid integer DEFAULT nextval('multi_question_questionid_seq'::regclass) NOT NULL,
	subject character varying(20) DEFAULT NULL::character varying,
	question character varying(255) DEFAULT NULL::character varying,
	answera character varying(255) DEFAULT NULL::character varying,
	answerb character varying(255) DEFAULT NULL::character varying,
	answerc character varying(255) DEFAULT NULL::character varying,
	answerd character varying(255) DEFAULT NULL::character varying,
	rightanswer character varying(10) DEFAULT NULL::character varying,
	analysis character varying(255) DEFAULT NULL::character varying,
	score integer DEFAULT 2,
	section character varying(20) DEFAULT NULL::character varying,
	level character varying(1) DEFAULT NULL::character varying
)
WITH (orientation=row, compression=no);
ALTER TABLE multi_question ADD CONSTRAINT multi_question_pkey PRIMARY KEY (questionid);

--Data for  Name: multi_question; Type: Table; Schema: user1;

INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10000,'计算机网络','DNS 服务器和DHCP服务器的作用是（）','将IP地址翻译为计算机名，为客户机分配IP地址','将IP地址翻译为计算机名、解析计算机的MAC地址','将计算机名翻译为IP地址、为客户机分配IP地址','将计算机名翻译为IP地址、解析计算机的MAC地址','C',null,2,'应用层','2');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10001,'计算机网络','HTTP协议通常使用什么协议进行传输（）','ARP','DHCP','UDP','TCP','D',null,2,'应用层','2');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10003,'计算机网络','查看DNS缓存记录的命令（）','ipconfig/displaydns','nslookup','ipconfig/release','ipconfig/flushdns','A',null,2,'应用层','3');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10004,'计算机网络','DHCP(        )报文的目的IP地址为255.255.255.255','DhcpDisover','DhcpOffer','DhcpAck','DhcpNack','A',null,2,'应用层','2');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10005,'计算机网络','下列地址中，（  ）不是DHCP服务器分配的IP地址','196.254.109.100','169.254.12.42','69.254.48.45','96.254.54.15','B',null,2,'应用层','2');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10006,'计算机网络','DHCP通常可以为客户端自动配置哪些网络参数（）','IP，掩码，网关，DNS','IP，掩码，域名，SMTP','网关，掩码，浏览器，FTP','IP，网关，DNS，服务器','A',null,2,'应用层','2');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10007,'计算机网络','DNS服务器在名称解析过程中正确的查询顺序为（）','本地缓存记录→区域记录→转发域名服务器→根域名服务器','区域记录→本地缓存记录→转发域名服务器→根域名服务器','本地缓存记录→区域记录→根域名服务器→转发域名服务器','区域记录→本地缓存记录→根域名服务器→转发域名服务器','A',null,2,'应用层','3');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10008,'计算机网络','在TCP/IP协议中，序号小于（  ）的端口称为熟知端口(well-known port)。','1024','64','256','128','A',null,2,'传输层','1');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10009,'计算机网络','在Internet上用TCP/IP播放视频，想用传输层的最快协议，以减少时延，要使用（ ）','UDP协议的低开销特性','UDP协议的高开销特性','TCP协议的低开销特性','TCP协议的高开销特性','A',null,2,'传输层','2');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10010,'计算机网络','在TCP协议中采用（ ）来区分不同的应用进程','端口号','IP地址','协议类型','MAC地址','A',null,2,'传输层','3');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10011,'计算机网络','可靠的传输协议中的“可靠”指的是（ ）','使用面向连接的会话','使用“尽力而为”的传输','使用滑动窗口来维持可靠性','使用确认重传机制来确保传输的数据不丢失','D',null,2,'传输层','2');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10012,'计算机网络','假设拥塞窗口为50KB，接收窗口为80KB，TCP能够发送的最大字节数为（ ）','50KB','80KB','130KB','30KB','A',null,2,'传输层','4');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10013,'计算机网络','主机A向主机B发送一个（SYN=1，seq=2000）的TCP报文，期望与主机B建立连接，若主机B接受连接请求，则主机B发送的正确有TCP报文可能是（ ）','（SYN=0,ACK=0,seq=2001,ack=2001）','（SYN=1,ACK=1,seq=2000,ack=2000）','•	C.（SYN=1,ACK=1,seq=2001,ack=2001）','（SYN=0,ACK=1,seq=2000,ack=2000）','C',null,2,'传输层','2');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10014,'计算机网络','主机A向主机B连续发送了两个TCP报文段，其序号分别为70和100。试问： （1）第一个报文段携带了（）个字节的数据？',' 70','30','100','170','B',null,2,'传输层','3');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10015,'计算机网络','PCM脉码调制的过程（ ）','采样、量化、编码','量化、编码、采样','编码、量化、采样','采样、编码、量化','A',null,2,'物理层','4');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10016,'计算机网络','若某采用4相位调制的通信链路的数据传输速率为2400bps，则该链路的波特率为（）','600Baud','1200Baud','4800Baud','9600Baud','B',null,2,'物理层','1');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10017,'计算机网络','以下关于数据传输速率的描述中，错误的是( )','数据传输速率表示每秒钟传输构成数据代码的二进制比特数','对于二进制数据，数据传输速率为S=1/T (bps)','常用的数据传输速率单位有: 1Mbps=1.024×106bps','数据传输速率是描述数据传输系统性能的重要技术指标之一','C',null,2,'物理层','2');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10018,'计算机网络','以下关于时分多路复用概念的描述中，错误的是.(  ).','时分多路复用将线路使用的时间分成多个时间片','时分多路复用分为同步时分多路复用与统计时分多路复用','时分多路复用使用“帧”与数据链路层“帧”的概念、作用是不同的','统计时分多路复用将时间片预先分配给各个信道','D',null,2,'物理层','2');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10019,'计算机网络','1000BASE-T标准支持的传输介质是（）','双绞线','同轴电缆','光纤','无线电','A',null,2,'物理层','1');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10020,'计算机网络','一个以太网交换机，读取整个数据帧，对数据帧进行差错校验后再转发出去，这种交换方式称为 （）','直通交换','无碎片交换','无差错交换','存储转发交换','D',null,2,'数据链路层','2');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10021,'计算机网络','关于VLAN，下面的描述中正确的是（）','一个新的交换机没有配置VLAN','通过配置VLAN减少了冲突域的数量','一个VLAN不能跨越多个交换机','各个VLAN属于不同的广播域','D',null,2,'数据链路层','2');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10022,'计算机网络','以太网协议中使用物理地址作用是什么？','.用于不同子网中的主机进行通信','作为第二层设备的唯一标识','用于区别第二层第三层的协议数据单元','保存主机可检测未知的远程设备','B',null,2,'数据链路层','2');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10023,'计算机网络','以太网采用的CSMA/CD协议，当冲突发生时要通过二进制指数后退算法计算后退延时， 关于这个算法，以下论述中错误的是 （）','冲突次数越多，后退的时间越短','平均后退次数的多少与负载大小有关','后退时延的平均值与负载大小有关','重发次数达到一定极限后放弃发送','A',null,2,'数据链路层','3');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10024,'计算机网络','以下关于交换机获取与其端口连接设备的MAC地址的叙述中，正确的是（）','交换机从路由表中提取设备的MAC地址','交换机检查端口流入分组的源地址','交换机之间互相交换地址表','网络管理员手工输入设备的MAC地址','B',null,2,'数据链路层','2');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10025,'计算机网络','如果G (x）为11010010，以下4个CRC校验比特序列中只有哪个可能是正确的 ？','1101011001','101011011','11011011','1011001','B',null,2,'数据链路层','1');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10026,'计算机网络','以下关于Ethernet物理地址的描述中，错误的是','Ethernet物理地址又叫做MAC地址','48位的Ethernet物理地址允许分配的地址数达到247个','网卡的物理地址写入主机的EPROM中','每一块网卡的物理地址在全世界是唯一的','C',null,2,'数据链路层','3');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10027,'计算机网络','下列帧类型中，不属于HDLC帧类型的是（）','信息帧','确认帧','监控帧','无编号帧','B',null,2,'数据链路层','1');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10028,'计算机网络','通过交换机连接的一组站点，关于它们的广播域和冲突域说法正确的是（）','组成一个冲突域，但不是一个广播域','组成一个广播域，但不是一个冲突域','组成一个冲突域，也是一个广播域','既不一个冲突域，也不是一个广播域','B',null,2,'数据链路层','3');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10029,'计算机网络','数据链路层的数据单位是（）','帧','字节','比特','分组','A',null,2,'数据链路层','1');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10030,'计算机网络','LAN参考模型可分为物理层、（ ）','MAC，LLC等三层','LLC，MHS等三层','MAC，FTAM等三层','LLC，VT等三层','A',null,2,'数据链路层','3');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10031,'测试','测试','A','B','C','D','B','解析',2,'测试','4');
INSERT INTO user1.multi_question (questionid,subject,question,answera,answerb,answerc,answerd,rightanswer,analysis,score,section,level)
 VALUES (10032,'计算机网络','DNS 服务器和DHCP服务器的作用是（）','A','B','C','D','B','哦解析',2,'网络层','2');


-- Name: paper_manage; Type: Table; Schema: user1;

SET search_path = user1;
CREATE TABLE paper_manage (
	paperid integer,
	questiontype integer,
	questionid integer
)
WITH (orientation=row, compression=no);

--Data for  Name: paper_manage; Type: Table; Schema: user1;

INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,1,10013);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,1,10005);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,1,10001);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,1,10004);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,1,10000);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,1,10016);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,1,10032);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,1,10025);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,1,10030);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,1,10017);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,1,10027);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,1,10023);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,1,10014);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,1,10009);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,1,10008);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,1,10011);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,1,10010);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,1,10021);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,1,10022);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,1,10026);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,2,10017);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,2,10012);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,2,10004);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,2,10005);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,2,10003);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,2,10008);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,2,10020);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,2,10013);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,2,10006);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,2,10015);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,3,10002);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,3,10009);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,3,10003);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,3,10005);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,3,10004);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,3,10012);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,3,10011);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,3,10006);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,3,10008);
INSERT INTO user1.paper_manage (paperid,questiontype,questionid)
 VALUES (1001,3,10001);


-- Name: replay; Type: Table; Schema: user1;

SET search_path = user1;
CREATE TABLE replay (
	messageid integer,
	replayid integer DEFAULT nextval('replay_replayid_seq'::regclass) NOT NULL,
	replay character varying(255) DEFAULT NULL::character varying,
	replaytime timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
)
WITH (orientation=row, compression=no);
ALTER TABLE replay ADD CONSTRAINT replay_pkey PRIMARY KEY (replayid);

--Data for  Name: replay; Type: Table; Schema: user1;

INSERT INTO user1.replay (messageid,replayid,replay,replaytime)
 VALUES (26,3,'好呀，我来了，你别跑！','2019-03-18 00:00:00');
INSERT INTO user1.replay (messageid,replayid,replay,replaytime)
 VALUES (22,4,'心疼你2秒钟','2019-03-18 00:00:00');
INSERT INTO user1.replay (messageid,replayid,replay,replaytime)
 VALUES (25,5,'我也要变强','2019-03-19 00:00:00');
INSERT INTO user1.replay (messageid,replayid,replay,replaytime)
 VALUES (25,6,'俺也一样','2019-03-19 00:00:00');
INSERT INTO user1.replay (messageid,replayid,replay,replaytime)
 VALUES (21,7,'既然这样，那就迎男而上吧','2019-03-19 00:00:00');
INSERT INTO user1.replay (messageid,replayid,replay,replaytime)
 VALUES (16,8,'那条街确实没什么东西可以吃了。。。','2019-03-19 00:00:00');
INSERT INTO user1.replay (messageid,replayid,replay,replaytime)
 VALUES (15,9,'咸鱼其实还可以吃，而你,emmmm','2019-03-19 00:00:00');
INSERT INTO user1.replay (messageid,replayid,replay,replaytime)
 VALUES (21,11,'我不怕人多','2019-03-19 00:00:00');
INSERT INTO user1.replay (messageid,replayid,replay,replaytime)
 VALUES (20,12,'是嘞，还行。','2019-03-19 00:00:00');
INSERT INTO user1.replay (messageid,replayid,replay,replaytime)
 VALUES (26,13,'我也爱你ε=(´ο｀*)))唉','2019-03-19 00:00:00');
INSERT INTO user1.replay (messageid,replayid,replay,replaytime)
 VALUES (27,14,'你这个坏孩子','2019-03-31 00:00:00');
INSERT INTO user1.replay (messageid,replayid,replay,replaytime)
 VALUES (33,18,'是的，今天是周一。','2019-04-14 00:00:00');
INSERT INTO user1.replay (messageid,replayid,replay,replaytime)
 VALUES (34,19,'1111','2019-04-16 00:00:00');
INSERT INTO user1.replay (messageid,replayid,replay,replaytime)
 VALUES (34,20,'2222','2019-04-16 00:00:00');
INSERT INTO user1.replay (messageid,replayid,replay,replaytime)
 VALUES (35,21,'666','2019-09-05 00:00:00');


-- Name: score; Type: Table; Schema: user1;

SET search_path = user1;
CREATE TABLE score (
	scoreid integer DEFAULT nextval('score_scoreid_seq'::regclass) NOT NULL,
	examcode integer,
	studentid integer,
	subject character varying(20) NOT NULL,
	ptscore integer,
	etscore integer,
	score integer,
	answerdate character varying(10) DEFAULT NULL::character varying
)
WITH (orientation=row, compression=no);
ALTER TABLE score ADD CONSTRAINT score_pkey PRIMARY KEY (scoreid);

--Data for  Name: score; Type: Table; Schema: user1;

INSERT INTO user1.score (scoreid,examcode,studentid,subject,ptscore,etscore,score,answerdate)
 VALUES (4,20190001,20154084,'计算机网络',null,70,null,'2019-04-03');
INSERT INTO user1.score (scoreid,examcode,studentid,subject,ptscore,etscore,score,answerdate)
 VALUES (14,20190002,20154084,'数据库理论',null,78,null,'2019-04-20');
INSERT INTO user1.score (scoreid,examcode,studentid,subject,ptscore,etscore,score,answerdate)
 VALUES (15,20190002,20154084,'数据库理论',null,80,null,'2019-04-20');
INSERT INTO user1.score (scoreid,examcode,studentid,subject,ptscore,etscore,score,answerdate)
 VALUES (16,20190002,20154084,'数据库理论',null,83,null,'2019-04-20');
INSERT INTO user1.score (scoreid,examcode,studentid,subject,ptscore,etscore,score,answerdate)
 VALUES (17,20190001,20154001,'计算机网络',null,74,null,'2019-04-13');
INSERT INTO user1.score (scoreid,examcode,studentid,subject,ptscore,etscore,score,answerdate)
 VALUES (18,20190001,20154001,'计算机网络',null,70,null,'2019-04-10');
INSERT INTO user1.score (scoreid,examcode,studentid,subject,ptscore,etscore,score,answerdate)
 VALUES (19,20190001,20155003,'计算机网络',null,86,null,'2019-04-14');
INSERT INTO user1.score (scoreid,examcode,studentid,subject,ptscore,etscore,score,answerdate)
 VALUES (20,20190001,20155007,'计算机网络',null,90,null,'2019-04-11');
INSERT INTO user1.score (scoreid,examcode,studentid,subject,ptscore,etscore,score,answerdate)
 VALUES (21,20190001,20155007,'计算机网络',null,92,null,'2019-04-12');
INSERT INTO user1.score (scoreid,examcode,studentid,subject,ptscore,etscore,score,answerdate)
 VALUES (22,20190001,20155008,'计算机网络',null,80,null,'2019-04-12');
INSERT INTO user1.score (scoreid,examcode,studentid,subject,ptscore,etscore,score,answerdate)
 VALUES (23,20190001,20155003,'计算机网络',null,90,null,'2019-04-13');
INSERT INTO user1.score (scoreid,examcode,studentid,subject,ptscore,etscore,score,answerdate)
 VALUES (24,20190001,20155008,'计算机网络',null,88,null,'2019-04-14');
INSERT INTO user1.score (scoreid,examcode,studentid,subject,ptscore,etscore,score,answerdate)
 VALUES (27,20190001,20154084,'计算机网络',null,80,null,'2019-04-25');
INSERT INTO user1.score (scoreid,examcode,studentid,subject,ptscore,etscore,score,answerdate)
 VALUES (30,20190001,20154084,'计算机网络',null,0,null,'2019-04-29');
INSERT INTO user1.score (scoreid,examcode,studentid,subject,ptscore,etscore,score,answerdate)
 VALUES (31,20190001,20154084,'计算机网络',null,0,null,'2019-09-06');


-- Name: student; Type: Table; Schema: user1;

SET search_path = user1;
CREATE TABLE student (
	studentid integer DEFAULT nextval('student_studentid_seq'::regclass) NOT NULL,
	studentname character varying(20) DEFAULT NULL::character varying,
	grade character varying(4) DEFAULT NULL::character varying,
	major character varying(50) DEFAULT NULL::character varying,
	clazz character varying(10) DEFAULT NULL::character varying,
	institute character varying(30) DEFAULT NULL::character varying,
	tel character varying(11) DEFAULT NULL::character varying,
	email character varying(30) DEFAULT NULL::character varying,
	pwd character varying(32) DEFAULT NULL::character varying,
	cardid character varying(18) DEFAULT NULL::character varying,
	sex character varying(3) DEFAULT NULL::character varying,
	role character varying(1) DEFAULT '2'::character varying,
	teacherid integer,
    CONSTRAINT fk_teacherid FOREIGN KEY (teacherid) REFERENCES teacher(teacherid)
)
WITH (orientation=row, compression=no);
ALTER TABLE student ADD CONSTRAINT student_pkey PRIMARY KEY (studentid);

--Data for  Name: student; Type: Table; Schema: user1;

INSERT INTO user1.student (studentid,studentname,grade,major,clazz,institute,tel,email,pwd,cardid,sex,role,teacherid)
 VALUES (20154084,'大咸鱼','2015','计算机科学与技术','2','软件工程学院','13658377857','13658377857@sina.cn','E10ADC3949BA59ABBE56E057F20F883E','124123124535','男','2',null);
INSERT INTO user1.student (studentid,studentname,grade,major,clazz,institute,tel,email,pwd,cardid,sex,role,teacherid)
 VALUES (20155003,'张大宝','2015','信息工程','1','软件工程学院','15583829425','15583829425@163.com','E10ADC3949BA59ABBE56E057F20F883E','3242342','男','2',null);
INSERT INTO user1.student (studentid,studentname,grade,major,clazz,institute,tel,email,pwd,cardid,sex,role,teacherid)
 VALUES (20155008,'小王','2015','信息工程','2','软件工程学院','15523619564','15523619564@163.com','E10ADC3949BA59ABBE56E057F20F883E','500234199704022353','男','2',null);
INSERT INTO user1.student (studentid,studentname,grade,major,clazz,institute,tel,email,pwd,cardid,sex,role,teacherid)
 VALUES (20155007,'翠花','2015','网络工程','1','软件学院','18734538457','18734538457@163.com','E10ADC3949BA59ABBE56E057F20F883E','2423423','女','2',null);
INSERT INTO user1.student (studentid,studentname,grade,major,clazz,institute,tel,email,pwd,cardid,sex,role,teacherid)
 VALUES (20154001,'隔壁老王','2015','计算机科学与技术','2','软件学院','13585439532','gblw@163.com','E10ADC3949BA59ABBE56E057F20F883E','3412312','男','2',null);


-- Name: teacher; Type: Table; Schema: user1;

SET search_path = user1;
CREATE TABLE teacher (
	teacherid integer DEFAULT nextval('teacher_teacherid_seq'::regclass) NOT NULL,
	teachername character varying(20) DEFAULT NULL::character varying,
	institute character varying(20) DEFAULT NULL::character varying,
	sex character varying(3) DEFAULT NULL::character varying,
	tel character varying(11) DEFAULT NULL::character varying,
	email character varying(20) DEFAULT NULL::character varying,
	pwd character varying(32) DEFAULT NULL::character varying,
	cardid character varying(18) DEFAULT NULL::character varying,
	type character varying(20) DEFAULT NULL::character varying,
	role character varying(1) DEFAULT NULL::character varying
)
WITH (orientation=row, compression=no);
ALTER TABLE teacher ADD CONSTRAINT teacher_pkey PRIMARY KEY (teacherid);

--Data for  Name: teacher; Type: Table; Schema: user1;

INSERT INTO user1.teacher (teacherid,teachername,institute,sex,tel,email,pwd,cardid,type,role)
 VALUES (20081001,'张','软件工程学院','男','13598458442','13598458442@163.com','E10ADC3949BA59ABBE56E057F20F883E','423423283498','讲师','1');
INSERT INTO user1.teacher (teacherid,teachername,institute,sex,tel,email,pwd,cardid,type,role)
 VALUES (20081002,'王大志','软件工程学院','男','1231221312','1231221312@163.com','E10ADC3949BA59ABBE56E057F20F883E','24241234','讲师','1');


-- Name: admin_adminid_seq; Type: SEQUENCE OWNED BY ; Schema: user1;

ALTER SEQUENCE admin_adminid_seq OWNED BY admin.adminid ;

-- Name: exam_manage_examcode_seq; Type: SEQUENCE OWNED BY ; Schema: user1;

ALTER SEQUENCE exam_manage_examcode_seq OWNED BY exam_manage.examcode ;

-- Name: fill_question_questionid_seq; Type: SEQUENCE OWNED BY ; Schema: user1;

ALTER SEQUENCE fill_question_questionid_seq OWNED BY fill_question.questionid ;

-- Name: judge_question_questionid_seq; Type: SEQUENCE OWNED BY ; Schema: user1;

ALTER SEQUENCE judge_question_questionid_seq OWNED BY judge_question.questionid ;

-- Name: message_id_seq; Type: SEQUENCE OWNED BY ; Schema: user1;

ALTER SEQUENCE message_id_seq OWNED BY message.id ;

-- Name: multi_question_questionid_seq; Type: SEQUENCE OWNED BY ; Schema: user1;

ALTER SEQUENCE multi_question_questionid_seq OWNED BY multi_question.questionid ;

-- Name: replay_replayid_seq; Type: SEQUENCE OWNED BY ; Schema: user1;

ALTER SEQUENCE replay_replayid_seq OWNED BY replay.replayid ;

-- Name: score_scoreid_seq; Type: SEQUENCE OWNED BY ; Schema: user1;

ALTER SEQUENCE score_scoreid_seq OWNED BY score.scoreid ;

-- Name: student_studentid_seq; Type: SEQUENCE OWNED BY ; Schema: user1;

ALTER SEQUENCE student_studentid_seq OWNED BY student.studentid ;

-- Name: teacher_teacherid_seq; Type: SEQUENCE OWNED BY ; Schema: user1;

ALTER SEQUENCE teacher_teacherid_seq OWNED BY teacher.teacherid ;

-- Name: admin_adminid_seq; Type: Sequence; Schema: user1;


SET search_path = user1 ;
 CREATE  SEQUENCE admin_adminid_seq
 START  WITH  1
 INCREMENT  BY  1
 NO MINVALUE  
 MAXVALUE 9223372036854775807
 CACHE 1;

--Data for  Name: admin_adminid_seq; Type: Sequence; Schema: user1;

SELECT pg_catalog.setVal('admin_adminid_seq',1,false);

-- Name: exam_manage_examcode_seq; Type: Sequence; Schema: user1;


SET search_path = user1 ;
 CREATE  SEQUENCE exam_manage_examcode_seq
 START  WITH  1
 INCREMENT  BY  1
 NO MINVALUE  
 MAXVALUE 9223372036854775807
 CACHE 1;

--Data for  Name: exam_manage_examcode_seq; Type: Sequence; Schema: user1;

SELECT pg_catalog.setVal('exam_manage_examcode_seq',1,false);

-- Name: fill_question_questionid_seq; Type: Sequence; Schema: user1;


SET search_path = user1 ;
 CREATE  SEQUENCE fill_question_questionid_seq
 START  WITH  1
 INCREMENT  BY  1
 NO MINVALUE  
 MAXVALUE 9223372036854775807
 CACHE 1;

--Data for  Name: fill_question_questionid_seq; Type: Sequence; Schema: user1;

SELECT pg_catalog.setVal('fill_question_questionid_seq',1,false);

-- Name: judge_question_questionid_seq; Type: Sequence; Schema: user1;


SET search_path = user1 ;
 CREATE  SEQUENCE judge_question_questionid_seq
 START  WITH  1
 INCREMENT  BY  1
 NO MINVALUE  
 MAXVALUE 9223372036854775807
 CACHE 1;

--Data for  Name: judge_question_questionid_seq; Type: Sequence; Schema: user1;

SELECT pg_catalog.setVal('judge_question_questionid_seq',1,false);

-- Name: message_id_seq; Type: Sequence; Schema: user1;


SET search_path = user1 ;
 CREATE  SEQUENCE message_id_seq
 START  WITH  1
 INCREMENT  BY  1
 NO MINVALUE  
 MAXVALUE 9223372036854775807
 CACHE 1;

--Data for  Name: message_id_seq; Type: Sequence; Schema: user1;

SELECT pg_catalog.setVal('message_id_seq',1,false);

-- Name: multi_question_questionid_seq; Type: Sequence; Schema: user1;


SET search_path = user1 ;
 CREATE  SEQUENCE multi_question_questionid_seq
 START  WITH  1
 INCREMENT  BY  1
 NO MINVALUE  
 MAXVALUE 9223372036854775807
 CACHE 1;

--Data for  Name: multi_question_questionid_seq; Type: Sequence; Schema: user1;

SELECT pg_catalog.setVal('multi_question_questionid_seq',1,false);

-- Name: replay_replayid_seq; Type: Sequence; Schema: user1;


SET search_path = user1 ;
 CREATE  SEQUENCE replay_replayid_seq
 START  WITH  1
 INCREMENT  BY  1
 NO MINVALUE  
 MAXVALUE 9223372036854775807
 CACHE 1;

--Data for  Name: replay_replayid_seq; Type: Sequence; Schema: user1;

SELECT pg_catalog.setVal('replay_replayid_seq',1,false);

-- Name: score_scoreid_seq; Type: Sequence; Schema: user1;


SET search_path = user1 ;
 CREATE  SEQUENCE score_scoreid_seq
 START  WITH  1
 INCREMENT  BY  1
 NO MINVALUE  
 MAXVALUE 9223372036854775807
 CACHE 1;

--Data for  Name: score_scoreid_seq; Type: Sequence; Schema: user1;

SELECT pg_catalog.setVal('score_scoreid_seq',1,false);

-- Name: student_studentid_seq; Type: Sequence; Schema: user1;


SET search_path = user1 ;
 CREATE  SEQUENCE student_studentid_seq
 START  WITH  1
 INCREMENT  BY  1
 NO MINVALUE  
 MAXVALUE 9223372036854775807
 CACHE 1;

--Data for  Name: student_studentid_seq; Type: Sequence; Schema: user1;

SELECT pg_catalog.setVal('student_studentid_seq',1,false);

-- Name: teacher_teacherid_seq; Type: Sequence; Schema: user1;


SET search_path = user1 ;
 CREATE  SEQUENCE teacher_teacherid_seq
 START  WITH  1
 INCREMENT  BY  1
 NO MINVALUE  
 MAXVALUE 9223372036854775807
 CACHE 1;

--Data for  Name: teacher_teacherid_seq; Type: Sequence; Schema: user1;

SELECT pg_catalog.setVal('teacher_teacherid_seq',1,false);
