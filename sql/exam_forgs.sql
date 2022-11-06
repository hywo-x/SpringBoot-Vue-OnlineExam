

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS admin;
CREATE TABLE admin
(
    adminId   SERIAL PRIMARY KEY NOT NULL,
    adminName VARCHAR(20)        NULL DEFAULT NULL,
    sex       VARCHAR(3)         NULL DEFAULT NULL,
    tel       VARCHAR(11)        NULL DEFAULT NULL,
    email     VARCHAR(20)        NULL DEFAULT NULL,
    pwd       VARCHAR(100)        NULL DEFAULT NULL,
    cardId    VARCHAR(18)        NULL DEFAULT NULL,
    role      VARCHAR(1)         NULL DEFAULT NULL
);

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO admin
VALUES (9527, '超级管理员', '男', '13658377857', '1253838283@qq.com', 'E10ADC3949BA59ABBE56E057F20F883E', '3132', '0');

-- ----------------------------
-- Table structure for exam_manage
-- ----------------------------
DROP TABLE IF EXISTS exam_manage;
CREATE TABLE exam_manage
(
    examCode    SERIAL PRIMARY KEY NOT NULL,
    description VARCHAR(50)        NULL DEFAULT NULL,
    source      VARCHAR(20)        NULL DEFAULT NULL,
    paperId     INTEGER            NULL DEFAULT NULL,
    examDate    VARCHAR(10)        NULL DEFAULT NULL,
    totalTime   INTEGER            NULL DEFAULT NULL,
    grade       VARCHAR(10)        NULL DEFAULT NULL,
    term        VARCHAR(10)        NULL DEFAULT NULL,
    major       VARCHAR(40)        NULL DEFAULT NULL,
    institute   VARCHAR(20)        NULL DEFAULT NULL,
    totalScore  INTEGER            NULL DEFAULT NULL,
    type        VARCHAR(255)       NULL DEFAULT NULL,
    tips        VARCHAR(255)       NULL DEFAULT NULL
);

-- ----------------------------
-- Records of exam_manage
-- ----------------------------
INSERT INTO exam_manage
VALUES (20190001, '2019年上期期末考试', '计算机网络', 1001, '2019-03-21', 120, '2018', '1', '计算机科学与技术',
        '软件工程学院', 100, '期末考试', '快乐千万条，学习第一条，平时不努力，考试两行泪。');
INSERT INTO exam_manage
VALUES (20190002, '2019年上期期末考试', '数据库理论', 1002, '2019-03-07', 90, '2018', '2', '网络工程', '软件工程学院',
        100, '期末考试', '快乐千万条，学习第一条，平时不努力，考试两行泪。');
INSERT INTO exam_manage
VALUES (20190003, '2018年下期期末考试', '数据结构', 1003, '2019-02-27', 90, '2017', '1', '软件工程', '软件工程学院',
        100, '期末考试', '快乐千万条，学习第一条，平时不努力，考试两行泪。');
INSERT INTO exam_manage
VALUES (20190005, '2018年上期期末考试', '计算机导论', 1004, '2019-03-14', 90, '2018', '1', '计算机科学与技术',
        '软件工程学院', 100, '期末考试', '快乐千万条，学习第一条，平时不努力，考试两行泪。');
INSERT INTO exam_manage
VALUES (20190006, '2017年上期期末考试', '软件工程', 1005, '2019-03-21', 120, '2018', '1', '计算机科学与技术',
        '软件工程学院', 100, '期末考试', '快乐千万条，学习第一条，平时不努力，考试两行泪。');
INSERT INTO exam_manage
VALUES (20190007, '2018年上期期末考试', '操作系统', 1006, '2019-03-13', 120, '2018', '2', '计算机科学与技术',
        '软件工程学院', 100, '期末考试', '快乐千万条，学习第一条，平时不努力，考试两行泪。');
INSERT INTO exam_manage
VALUES (20190008, '2018年下期期末考试', 'C语言', 1007, '2019-03-13', 120, '2018', '1', '信息工程', '软件工程学院', 100,
        '期末考试', '快乐千万条，学习第一条，平时不努力，考试两行泪。');
INSERT INTO exam_manage
VALUES (20190009, '2018年上期期末考试', '高等数学', 1008, '2019-03-07', 90, '2018', '1', '信息工程', '软件工程学院',
        100, '期末考试', '快乐千万条，学习第一条，平时不努力，考试两行泪。');
INSERT INTO exam_manage
VALUES (20190013, '测试', '测试', 1009, '2019-04-24', 120, '2017', NULL, '测试', '测试', 100, '期末考试',
        '请不要带与考试无关的书籍。');

-- ----------------------------
-- Table structure for fill_question
-- ----------------------------
DROP TABLE IF EXISTS fill_question;
CREATE TABLE fill_question
(
    questionId SERIAL PRIMARY KEY NOT NULL,
    subject    VARCHAR(20)        NULL DEFAULT NULL,
    question   VARCHAR(255)       NULL DEFAULT NULL,
    answer     VARCHAR(255)       NULL DEFAULT NULL,
    analysis   VARCHAR(255)       NULL DEFAULT NULL,
    score      INTEGER            NULL DEFAULT 2,
    level      VARCHAR(5)         NULL DEFAULT NULL,
    section    VARCHAR(20)        NULL DEFAULT NULL
);
-- ----------------------------
-- Records of fill_question
-- ----------------------------
INSERT INTO fill_question
VALUES (10000, '计算机网络', '从计算机网络系统组成的角度看，计算机网络可以分为()和()', '通信子网资源子网', NULL, 2, '3',
        NULL);
INSERT INTO fill_question
VALUES (10001, '计算机网络', '收发电子邮件，属于ISO/OSI RM中 ()层的功能。', '应用', NULL, 2, '1', NULL);
INSERT INTO fill_question
VALUES (10002, '计算机网络',
        '在TCP/IP层次模型中与OSI参考模型第四层相对应的主要协议有()和(),其中后者提供无连接的不可靠传输服',
        'TCP（传输控制协议） UDP（用户数据报协议） ', NULL, 2, '2', NULL);
INSERT INTO fill_question
VALUES (10003, '计算机网络', '计算机网络中常用的三种有线媒体是 (),()和 ()', '同轴电缆.双绞线 光纤', NULL, 2, '1', NULL);
INSERT INTO fill_question
VALUES (10004, '计算机网络', '国内最早的四大网络包括原邮电部的ChinaNet. 原电子部的ChinaGBN. 教育部的()和中科院的CSTnet',
        'CERnet (或中国教育科研网)', NULL, 2, '4', NULL);
INSERT INTO fill_question
VALUES (10005, '计算机网络',
        '复盖一个国家，地区或几个洲的计算机网络称为()，在同一建筑或复盖几公里内范围的网络称为()，而介于两者之间的是()',
        ' 广域网       局域网     城域网', NULL, 2, '1', NULL);
INSERT INTO fill_question
VALUES (10006, '计算机网络', 'Outlook等常用电子邮件软件接收邮件使用的协议是(),发送邮件时使用的协议是()',
        'POP3    SMTP    ', NULL, 2, '1', NULL);
INSERT INTO fill_question
VALUES (10007, '计算机网络', '通信系统中，称调制前的电信号为()信号，调制后的信号为调制信号', '基带', NULL, 2, '1', NULL);
INSERT INTO fill_question
VALUES (10008, '计算机网络', '按照IPV4标准,IP地址205.3.127.13属于()类地址', 'C', NULL, 2, '1', NULL);
INSERT INTO fill_question
VALUES (10009, '计算机网络', '计算机网络采用()技术，而传统电话网络则采用()技术', '分组交换电路交换', NULL, 2, '1', NULL);
INSERT INTO fill_question
VALUES (10010, '计算机网络', '计算机内传输的信号是()，而公用电话系统的传输系统只能传输()', '数字信号模拟信号', NULL, 2,
        '1', NULL);
INSERT INTO fill_question
VALUES (10011, '计算机网络', '通信系统中，称调制前的电信号为()，调制后的信号叫()。', '基带信号调制信号', NULL, 2, '1',
        NULL);
INSERT INTO fill_question
VALUES (10012, '计算机网络', 'IP地址分()和()两个部分', '网络号主机号', NULL, 2, '1', NULL);
INSERT INTO fill_question
VALUES (10013, '计算机网络', ' IP地址协议作网间网中()层协议，提供无连接的数据报传输机制，IP数据报也分为()和()两个部分',
        '网络报头数据区', NULL, 2, '2', NULL);
INSERT INTO fill_question
VALUES (10014, '计算机网络', '()是一个简单的远程终端协议。', 'TELNET', NULL, 2, '1', NULL);
INSERT INTO fill_question
VALUES (10015, '计算机网络',
        '在同一个系统内，相邻层之间交换信息的连接点称之为()，而低层模块向高层提供功能性的支持称之为()。', '接口服务', NULL,
        2, '1', NULL);
INSERT INTO fill_question
VALUES (10016, '计算机网络', 'Internet广泛使用的电子邮件传送协议是()', 'SMTP', NULL, 2, '1', NULL);
INSERT INTO fill_question
VALUES (10017, '计算机网络', '按交换方式来分类，计算机网络可以分为电路交换网，  报文交换网  和()三种', '分组交换网', NULL,
        2, '3', NULL);
INSERT INTO fill_question
VALUES (10018, '计算机网络', 'Intranet分层结构包括网络、(),应用三个层次。', '服务', NULL, 2, '1', NULL);
INSERT INTO fill_question
VALUES (10019, '计算机网络', 'WWW上的每一个网页都有一个独立的地址，这些地址称为  ()', '统一资源定位器/URL ', NULL, 2,
        '2', NULL);
INSERT INTO fill_question
VALUES (10020, '计算机网络', '分组交换网中，附加信息用来在网络中进行路由选择、() 和流量控制', '差错纠正  ', NULL, 2, '4',
        NULL);
INSERT INTO fill_question
VALUES (10021, '计算机网络', '根据IEEE802模型的标准将数据链路层划分为LLC子层和 ()子层。', ' MAC ', NULL, 2, '3', NULL);
INSERT INTO fill_question
VALUES (10022, '计算机网络', '据交换的路由信息的不同，路由算法可以分为两大类：  ()  和链路状态算法', '距离向量算法', NULL,
        2, '3', NULL);
INSERT INTO fill_question
VALUES (10023, '计算机网络',
        '假定某信道受奈氏准则限制的最高码元速率为2000码元/秒。如果采用振幅调制，把码元的振幅划分为16个不同等级来传送，那么可以获得的数据率为 () b/s。',
        '80000 ', NULL, 2, '5', NULL);
INSERT INTO fill_question
VALUES (10024, '计算机网络',
        '交换型以太网系统中的 ()  ，以其为核心联接站点或者网段，端口之间帧的输入和输出已不再受到CSMA/CD媒体访问控制协议的约束。',
        '以太网交换器 ', NULL, 2, '5', NULL);
INSERT INTO fill_question
VALUES (10025, '计算机网络', '局域网络参考模型是以 ()标准为基础的', 'IEEE802', NULL, 2, '5', NULL);
INSERT INTO fill_question
VALUES (10026, '计算机网络', '路由器的核心是 () 。', ' 路由表', NULL, 2, '3', NULL);
INSERT INTO fill_question
VALUES (10027, '计算机网络', '若 HDLC 帧数据段中出现比特串“ 01011111110 ”，则比特填充后的输出为()', '10111110110', NULL,
        2, '5', NULL);
INSERT INTO fill_question
VALUES (10028, '计算机网络', '数字调制的三种基本形式：移幅键控法ASK、 ()、移相键控法PSK', '移频键控法FSK', NULL, 2, '5',
        NULL);

-- ----------------------------
-- Table structure for judge_question
-- ----------------------------
DROP TABLE IF EXISTS judge_question;
CREATE TABLE judge_question
(
    questionId SERIAL PRIMARY KEY NOT NULL,
    subject    VARCHAR(20)        NULL DEFAULT NULL,
    question   VARCHAR(255)       NULL DEFAULT NULL,
    answer     VARCHAR(255)       NULL DEFAULT NULL,
    analysis   VARCHAR(255)       NULL DEFAULT NULL,
    score      INTEGER            NULL DEFAULT 2,
    level      VARCHAR(1)         NULL DEFAULT NULL,
    section    VARCHAR(20)        NULL DEFAULT NULL
);
-- ----------------------------
-- Records of judge_question
-- ----------------------------
INSERT INTO judge_question
VALUES (10001, '计算机网络', '与有线网相比,无线网的数据传输率一般相对较慢', 'T', NULL, 2, '1', '');
INSERT INTO judge_question
VALUES (10002, '计算机网络', 'OSI参考模型中,不同节点的同等层具有不同的功能', 'F', NULL, 2, '1', NULL);
INSERT INTO judge_question
VALUES (10003, '计算机网络', '普通电脑不能作为服务器', 'F', NULL, 2, '1', NULL);
INSERT INTO judge_question
VALUES (10004, '计算机网络', '没有网线的电脑不能连入互联网', 'F', NULL, 2, '1', NULL);
INSERT INTO judge_question
VALUES (10005, '计算机网络', '网卡必须安装驱动程序', 'T', NULL, 2, '2', NULL);
INSERT INTO judge_question
VALUES (10006, '计算机网络', 'UTP为屏蔽双绞线', 'F', NULL, 2, '2', NULL);
INSERT INTO judge_question
VALUES (10007, '计算机网络', '网络接口卡又称为网卡,它是构成网络的基本部件', 'T', NULL, 2, '2', NULL);
INSERT INTO judge_question
VALUES (10008, '计算机网络', '无线AP可以成倍地扩展网络覆盖范围', 'T', NULL, 2, '3', NULL);
INSERT INTO judge_question
VALUES (10009, '计算机网络', 'SMTP是一组用于由源地址到目的地址传送邮件的协议', 'T', NULL, 2, '4', NULL);
INSERT INTO judge_question
VALUES (10010, '计算机网络', '任务管理器可以关闭所有的进程', 'F', NULL, 2, '3', NULL);
INSERT INTO judge_question
VALUES (10011, '计算机网络', '利用BT下载时,用户越多,下载速度越快', 'T', NULL, 2, '2', NULL);
INSERT INTO judge_question
VALUES (10012, '计算机网络', 'INTERNET上向朋友发送电子邮件,必须知道对方的真实姓名和家庭住址', 'F', NULL, 2, '1', NULL);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS message;
CREATE TABLE message
(
    id      SERIAL PRIMARY KEY NOT NULL,
    title   VARCHAR(50)        NULL DEFAULT NULL,
    content VARCHAR(255)       NULL DEFAULT NULL,
    time    date               NULL DEFAULT NULL
);
-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO message
VALUES (2, '晚上加班,这感觉非常的nice',
        '今天是星期一的晚上,下班后回到宿舍继续写我的毕业设计,看着项目功能日渐丰满好开心哦,你们也要元气满满哦！',
        '2019-03-18');
INSERT INTO message
VALUES (15, '咸鱼', '我是一条咸鱼', '2019-03-18');
INSERT INTO message
VALUES (16, '今天中午吃什么', '今天去吃莲藕排骨汤吧，虽然也不好吃，但这里真的没什么东西可以吃了', '2019-03-18');
INSERT INTO message
VALUES (20, '这个网站不错', '博主大大好厉害，网页看着很清新呢，喜欢这样嘞风格。', '2019-03-18');
INSERT INTO message
VALUES (21, '男孩子', '哇，这么可爱，那肯定是男孩子呀。', '2019-03-18');
INSERT INTO message
VALUES (22, '好人', '你是个好人，可是我们不合适。', '2019-03-18');
INSERT INTO message
VALUES (25, '小乔', '花会枯萎，爱永不凋零，小乔要努力变强。', '2019-03-18');
INSERT INTO message
VALUES (26, '妲己', '妲己会一直爱主人，因为被设定成这样，来和妲己玩耍吧。', '2019-03-18');
INSERT INTO message
VALUES (27, '土味情话', '妈妈从小对我讲，不要早恋，遇到你以后，我决定不听妈妈的话了。', '2019-03-31');
INSERT INTO message
VALUES (35, '贝塔', '开坦克', '2019-09-05');

-- ----------------------------
-- Table structure for multi_question
-- ----------------------------
DROP TABLE IF EXISTS multi_question;
CREATE TABLE multi_question
(
    questionId  SERIAL PRIMARY KEY NOT NULL,
    subject     VARCHAR(20)        NULL DEFAULT NULL,
    question    VARCHAR(255)       NULL DEFAULT NULL,
    answerA     VARCHAR(255)       NULL DEFAULT NULL,
    answerB     VARCHAR(255)       NULL DEFAULT NULL,
    answerC     VARCHAR(255)       NULL DEFAULT NULL,
    answerD     VARCHAR(255)       NULL DEFAULT NULL,
    rightAnswer VARCHAR(10)        NULL DEFAULT NULL,
    analysis    VARCHAR(255)       NULL DEFAULT NULL,
    score       INTEGER            NULL DEFAULT 2,
    section     VARCHAR(20)        NULL DEFAULT NULL,
    level       VARCHAR(1)         NULL DEFAULT NULL
);
-- ----------------------------
-- Records of multi_question
-- ----------------------------
INSERT INTO multi_question
VALUES (10000, '计算机网络', 'DNS 服务器和DHCP服务器的作用是（）', '将IP地址翻译为计算机名，为客户机分配IP地址',
        '将IP地址翻译为计算机名、解析计算机的MAC地址', '将计算机名翻译为IP地址、为客户机分配IP地址',
        '将计算机名翻译为IP地址、解析计算机的MAC地址', 'C', NULL, 2, '应用层', '2');
INSERT INTO multi_question
VALUES (10001, '计算机网络', 'HTTP协议通常使用什么协议进行传输（）', 'ARP', 'DHCP', 'UDP', 'TCP', 'D', NULL, 2, '应用层',
        '2');
INSERT INTO multi_question
VALUES (10003, '计算机网络', '查看DNS缓存记录的命令（）', 'ipconfig/displaydns', 'nslookup', 'ipconfig/release',
        'ipconfig/flushdns', 'A', NULL, 2, '应用层', '3');
INSERT INTO multi_question
VALUES (10004, '计算机网络', 'DHCP(        )报文的目的IP地址为255.255.255.255', 'DhcpDisover', 'DhcpOffer', 'DhcpAck',
        'DhcpNack', 'A', NULL, 2, '应用层', '2');
INSERT INTO multi_question
VALUES (10005, '计算机网络', '下列地址中，（  ）不是DHCP服务器分配的IP地址', '196.254.109.100', '169.254.12.42',
        '69.254.48.45', '96.254.54.15', 'B', NULL, 2, '应用层', '2');
INSERT INTO multi_question
VALUES (10006, '计算机网络', 'DHCP通常可以为客户端自动配置哪些网络参数（）', 'IP，掩码，网关，DNS', 'IP，掩码，域名，SMTP',
        '网关，掩码，浏览器，FTP', 'IP，网关，DNS，服务器', 'A', NULL, 2, '应用层', '2');
INSERT INTO multi_question
VALUES (10007, '计算机网络', 'DNS服务器在名称解析过程中正确的查询顺序为（）',
        '本地缓存记录→区域记录→转发域名服务器→根域名服务器', '区域记录→本地缓存记录→转发域名服务器→根域名服务器',
        '本地缓存记录→区域记录→根域名服务器→转发域名服务器', '区域记录→本地缓存记录→根域名服务器→转发域名服务器', 'A',
        NULL, 2, '应用层', '3');
INSERT INTO multi_question
VALUES (10008, '计算机网络', '在TCP/IP协议中，序号小于（  ）的端口称为熟知端口(well-known port)。', '1024', '64', '256',
        '128', 'A', NULL, 2, '传输层', '1');
INSERT INTO multi_question
VALUES (10009, '计算机网络', '在Internet上用TCP/IP播放视频，想用传输层的最快协议，以减少时延，要使用（ ）',
        'UDP协议的低开销特性', 'UDP协议的高开销特性', 'TCP协议的低开销特性', 'TCP协议的高开销特性', 'A', NULL, 2,
        '传输层', '2');
INSERT INTO multi_question
VALUES (10010, '计算机网络', '在TCP协议中采用（ ）来区分不同的应用进程', '端口号', 'IP地址', '协议类型', 'MAC地址', 'A',
        NULL, 2, '传输层', '3');
INSERT INTO multi_question
VALUES (10011, '计算机网络', '可靠的传输协议中的“可靠”指的是（ ）', '使用面向连接的会话', '使用“尽力而为”的传输',
        '使用滑动窗口来维持可靠性', '使用确认重传机制来确保传输的数据不丢失', 'D', NULL, 2, '传输层', '2');
INSERT INTO multi_question
VALUES (10012, '计算机网络', '假设拥塞窗口为50KB，接收窗口为80KB，TCP能够发送的最大字节数为（ ）', '50KB', '80KB', '130KB',
        '30KB', 'A', NULL, 2, '传输层', '4');
INSERT INTO multi_question
VALUES (10013, '计算机网络',
        '主机A向主机B发送一个（SYN=1，seq=2000）的TCP报文，期望与主机B建立连接，若主机B接受连接请求，则主机B发送的正确有TCP报文可能是（ ）',
        '（SYN=0,ACK=0,seq=2001,ack=2001）', '（SYN=1,ACK=1,seq=2000,ack=2000）', '•	C.（SYN=1,ACK=1,seq=2001,ack=2001）',
        '（SYN=0,ACK=1,seq=2000,ack=2000）', 'C', NULL, 2, '传输层', '2');
INSERT INTO multi_question
VALUES (10014, '计算机网络',
        '主机A向主机B连续发送了两个TCP报文段，其序号分别为70和100。试问： （1）第一个报文段携带了（）个字节的数据？', ' 70',
        '30', '100', '170', 'B', NULL, 2, '传输层', '3');
INSERT INTO multi_question
VALUES (10015, '计算机网络', 'PCM脉码调制的过程（ ）', '采样、量化、编码', '量化、编码、采样', '编码、量化、采样',
        '采样、编码、量化', 'A', NULL, 2, '物理层', '4');
INSERT INTO multi_question
VALUES (10016, '计算机网络', '若某采用4相位调制的通信链路的数据传输速率为2400bps，则该链路的波特率为（）', '600Baud',
        '1200Baud', '4800Baud', '9600Baud', 'B', NULL, 2, '物理层', '1');
INSERT INTO multi_question
VALUES (10017, '计算机网络', '以下关于数据传输速率的描述中，错误的是( )',
        '数据传输速率表示每秒钟传输构成数据代码的二进制比特数', '对于二进制数据，数据传输速率为S=1/T (bps)',
        '常用的数据传输速率单位有: 1Mbps=1.024×106bps', '数据传输速率是描述数据传输系统性能的重要技术指标之一', 'C',
        NULL, 2, '物理层', '2');
INSERT INTO multi_question
VALUES (10018, '计算机网络', '以下关于时分多路复用概念的描述中，错误的是.(  ).',
        '时分多路复用将线路使用的时间分成多个时间片', '时分多路复用分为同步时分多路复用与统计时分多路复用',
        '时分多路复用使用“帧”与数据链路层“帧”的概念、作用是不同的', '统计时分多路复用将时间片预先分配给各个信道', 'D',
        NULL, 2, '物理层', '2');
INSERT INTO multi_question
VALUES (10019, '计算机网络', '1000BASE-T标准支持的传输介质是（）', '双绞线', '同轴电缆', '光纤', '无线电', 'A', NULL, 2,
        '物理层', '1');
INSERT INTO multi_question
VALUES (10020, '计算机网络', '一个以太网交换机，读取整个数据帧，对数据帧进行差错校验后再转发出去，这种交换方式称为 （）',
        '直通交换', '无碎片交换', '无差错交换', '存储转发交换', 'D', NULL, 2, '数据链路层', '2');
INSERT INTO multi_question
VALUES (10021, '计算机网络', '关于VLAN，下面的描述中正确的是（）', '一个新的交换机没有配置VLAN',
        '通过配置VLAN减少了冲突域的数量', '一个VLAN不能跨越多个交换机', '各个VLAN属于不同的广播域', 'D', NULL, 2,
        '数据链路层', '2');
INSERT INTO multi_question
VALUES (10022, '计算机网络', '以太网协议中使用物理地址作用是什么？', '.用于不同子网中的主机进行通信',
        '作为第二层设备的唯一标识', '用于区别第二层第三层的协议数据单元', '保存主机可检测未知的远程设备', 'B', NULL, 2,
        '数据链路层', '2');
INSERT INTO multi_question
VALUES (10023, '计算机网络',
        '以太网采用的CSMA/CD协议，当冲突发生时要通过二进制指数后退算法计算后退延时， 关于这个算法，以下论述中错误的是 （）',
        '冲突次数越多，后退的时间越短', '平均后退次数的多少与负载大小有关', '后退时延的平均值与负载大小有关',
        '重发次数达到一定极限后放弃发送', 'A', NULL, 2, '数据链路层', '3');
INSERT INTO multi_question
VALUES (10024, '计算机网络', '以下关于交换机获取与其端口连接设备的MAC地址的叙述中，正确的是（）',
        '交换机从路由表中提取设备的MAC地址', '交换机检查端口流入分组的源地址', '交换机之间互相交换地址表',
        '网络管理员手工输入设备的MAC地址', 'B', NULL, 2, '数据链路层', '2');
INSERT INTO multi_question
VALUES (10025, '计算机网络', '如果G (x）为11010010，以下4个CRC校验比特序列中只有哪个可能是正确的 ？', '1101011001',
        '101011011', '11011011', '1011001', 'B', NULL, 2, '数据链路层', '1');
INSERT INTO multi_question
VALUES (10026, '计算机网络', '以下关于Ethernet物理地址的描述中，错误的是', 'Ethernet物理地址又叫做MAC地址',
        '48位的Ethernet物理地址允许分配的地址数达到247个', '网卡的物理地址写入主机的EPROM中',
        '每一块网卡的物理地址在全世界是唯一的', 'C', NULL, 2, '数据链路层', '3');
INSERT INTO multi_question
VALUES (10027, '计算机网络', '下列帧类型中，不属于HDLC帧类型的是（）', '信息帧', '确认帧', '监控帧', '无编号帧', 'B', NULL,
        2, '数据链路层', '1');
INSERT INTO multi_question
VALUES (10028, '计算机网络', '通过交换机连接的一组站点，关于它们的广播域和冲突域说法正确的是（）',
        '组成一个冲突域，但不是一个广播域', '组成一个广播域，但不是一个冲突域', '组成一个冲突域，也是一个广播域',
        '既不一个冲突域，也不是一个广播域', 'B', NULL, 2, '数据链路层', '3');
INSERT INTO multi_question
VALUES (10029, '计算机网络', '数据链路层的数据单位是（）', '帧', '字节', '比特', '分组', 'A', NULL, 2, '数据链路层', '1');
INSERT INTO multi_question
VALUES (10030, '计算机网络', 'LAN参考模型可分为物理层、（ ）', 'MAC，LLC等三层', 'LLC，MHS等三层', 'MAC，FTAM等三层',
        'LLC，VT等三层', 'A', NULL, 2, '数据链路层', '3');
INSERT INTO multi_question
VALUES (10031, '测试', '测试', 'A', 'B', 'C', 'D', 'B', '解析', 2, '测试', '4');
INSERT INTO multi_question
VALUES (10032, '计算机网络', 'DNS 服务器和DHCP服务器的作用是（）', 'A', 'B', 'C', 'D', 'B', '哦解析', 2, '网络层', '2');

-- ----------------------------
-- Table structure for paper_manage
-- ----------------------------
DROP TABLE IF EXISTS paper_manage;
CREATE TABLE paper_manage
(
    paperId      INTEGER NULL DEFAULT NULL,
    questionType INTEGER NULL DEFAULT NULL,
    questionId   INTEGER NULL DEFAULT NULL
);
-- ----------------------------
-- Records of paper_manage
-- ----------------------------
INSERT INTO paper_manage
VALUES (1001, 1, 10013);
INSERT INTO paper_manage
VALUES (1001, 1, 10005);
INSERT INTO paper_manage
VALUES (1001, 1, 10001);
INSERT INTO paper_manage
VALUES (1001, 1, 10004);
INSERT INTO paper_manage
VALUES (1001, 1, 10000);
INSERT INTO paper_manage
VALUES (1001, 1, 10016);
INSERT INTO paper_manage
VALUES (1001, 1, 10032);
INSERT INTO paper_manage
VALUES (1001, 1, 10025);
INSERT INTO paper_manage
VALUES (1001, 1, 10030);
INSERT INTO paper_manage
VALUES (1001, 1, 10017);
INSERT INTO paper_manage
VALUES (1001, 1, 10027);
INSERT INTO paper_manage
VALUES (1001, 1, 10023);
INSERT INTO paper_manage
VALUES (1001, 1, 10014);
INSERT INTO paper_manage
VALUES (1001, 1, 10009);
INSERT INTO paper_manage
VALUES (1001, 1, 10008);
INSERT INTO paper_manage
VALUES (1001, 1, 10011);
INSERT INTO paper_manage
VALUES (1001, 1, 10010);
INSERT INTO paper_manage
VALUES (1001, 1, 10021);
INSERT INTO paper_manage
VALUES (1001, 1, 10022);
INSERT INTO paper_manage
VALUES (1001, 1, 10026);
INSERT INTO paper_manage
VALUES (1001, 2, 10017);
INSERT INTO paper_manage
VALUES (1001, 2, 10012);
INSERT INTO paper_manage
VALUES (1001, 2, 10004);
INSERT INTO paper_manage
VALUES (1001, 2, 10005);
INSERT INTO paper_manage
VALUES (1001, 2, 10003);
INSERT INTO paper_manage
VALUES (1001, 2, 10008);
INSERT INTO paper_manage
VALUES (1001, 2, 10020);
INSERT INTO paper_manage
VALUES (1001, 2, 10013);
INSERT INTO paper_manage
VALUES (1001, 2, 10006);
INSERT INTO paper_manage
VALUES (1001, 2, 10015);
INSERT INTO paper_manage
VALUES (1001, 3, 10002);
INSERT INTO paper_manage
VALUES (1001, 3, 10009);
INSERT INTO paper_manage
VALUES (1001, 3, 10003);
INSERT INTO paper_manage
VALUES (1001, 3, 10005);
INSERT INTO paper_manage
VALUES (1001, 3, 10004);
INSERT INTO paper_manage
VALUES (1001, 3, 10012);
INSERT INTO paper_manage
VALUES (1001, 3, 10011);
INSERT INTO paper_manage
VALUES (1001, 3, 10006);
INSERT INTO paper_manage
VALUES (1001, 3, 10008);
INSERT INTO paper_manage
VALUES (1001, 3, 10001);

-- ----------------------------
-- Table structure for replay
-- ----------------------------
DROP TABLE IF EXISTS replay;
CREATE TABLE replay
(
    messageId  INTEGER            NULL DEFAULT NULL,
    replayId   SERIAL PRIMARY KEY NOT NULL,
    replay     VARCHAR(255)       NULL DEFAULT NULL,
    replayTime date               NULL DEFAULT NULL
);
-- ----------------------------
-- Records of replay
-- ----------------------------
INSERT INTO replay
VALUES (26, 3, '好呀，我来了，你别跑！', '2019-03-18');
INSERT INTO replay
VALUES (22, 4, '心疼你2秒钟', '2019-03-18');
INSERT INTO replay
VALUES (25, 5, '我也要变强', '2019-03-19');
INSERT INTO replay
VALUES (25, 6, '俺也一样', '2019-03-19');
INSERT INTO replay
VALUES (21, 7, '既然这样，那就迎男而上吧', '2019-03-19');
INSERT INTO replay
VALUES (16, 8, '那条街确实没什么东西可以吃了。。。', '2019-03-19');
INSERT INTO replay
VALUES (15, 9, '咸鱼其实还可以吃，而你,emmmm', '2019-03-19');
INSERT INTO replay
VALUES (21, 11, '我不怕人多', '2019-03-19');
INSERT INTO replay
VALUES (20, 12, '是嘞，还行。', '2019-03-19');
INSERT INTO replay
VALUES (26, 13, '我也爱你ε=(´ο｀*)))唉', '2019-03-19');
INSERT INTO replay
VALUES (27, 14, '你这个坏孩子', '2019-03-31');
INSERT INTO replay
VALUES (33, 18, '是的，今天是周一。', '2019-04-14');
INSERT INTO replay
VALUES (34, 19, '1111', '2019-04-16');
INSERT INTO replay
VALUES (34, 20, '2222', '2019-04-16');
INSERT INTO replay
VALUES (35, 21, '666', '2019-09-05');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS score;
CREATE TABLE score
(
    scoreId    SERIAL PRIMARY KEY NOT NULL,
    examCode   INTEGER            NULL DEFAULT NULL,
    studentId  INTEGER            NULL DEFAULT NULL,
    subject    VARCHAR(20)        NOT NULL,
    ptScore    INTEGER            NULL DEFAULT NULL,
    etScore    INTEGER            NULL DEFAULT NULL,
    score      INTEGER            NULL DEFAULT NULL,
    answerDate VARCHAR(10)        NULL DEFAULT NULL
);
-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO score
VALUES (4, 20190001, 20154084, '计算机网络', NULL, 70, NULL, '2019-04-03');
INSERT INTO score
VALUES (14, 20190002, 20154084, '数据库理论', NULL, 78, NULL, '2019-04-20');
INSERT INTO score
VALUES (15, 20190002, 20154084, '数据库理论', NULL, 80, NULL, '2019-04-20');
INSERT INTO score
VALUES (16, 20190002, 20154084, '数据库理论', NULL, 83, NULL, '2019-04-20');
INSERT INTO score
VALUES (17, 20190001, 20154001, '计算机网络', NULL, 74, NULL, '2019-04-13');
INSERT INTO score
VALUES (18, 20190001, 20154001, '计算机网络', NULL, 70, NULL, '2019-04-10');
INSERT INTO score
VALUES (19, 20190001, 20155003, '计算机网络', NULL, 86, NULL, '2019-04-14');
INSERT INTO score
VALUES (20, 20190001, 20155007, '计算机网络', NULL, 90, NULL, '2019-04-11');
INSERT INTO score
VALUES (21, 20190001, 20155007, '计算机网络', NULL, 92, NULL, '2019-04-12');
INSERT INTO score
VALUES (22, 20190001, 20155008, '计算机网络', NULL, 80, NULL, '2019-04-12');
INSERT INTO score
VALUES (23, 20190001, 20155003, '计算机网络', NULL, 90, NULL, '2019-04-13');
INSERT INTO score
VALUES (24, 20190001, 20155008, '计算机网络', NULL, 88, NULL, '2019-04-14');
INSERT INTO score
VALUES (27, 20190001, 20154084, '计算机网络', NULL, 80, NULL, '2019-04-25');
INSERT INTO score
VALUES (30, 20190001, 20154084, '计算机网络', NULL, 0, NULL, '2019-04-29');
INSERT INTO score
VALUES (31, 20190001, 20154084, '计算机网络', NULL, 0, NULL, '2019-09-06');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS student;
CREATE TABLE student
(
    studentId   SERIAL PRIMARY KEY NOT NULL,
    studentName VARCHAR(20)        NULL DEFAULT NULL,
    image       VARCHAR(100)        NULL DEFAULT NULL,
    grade       VARCHAR(4)         NULL DEFAULT NULL,
    major       VARCHAR(50)        NULL DEFAULT NULL,
    clazz       VARCHAR(10)        NULL DEFAULT NULL,
    institute   VARCHAR(30)        NULL DEFAULT NULL,
    tel         VARCHAR(11)        NULL DEFAULT NULL,
    email       VARCHAR(30)        NULL DEFAULT NULL,
    pwd         VARCHAR(100)        NULL DEFAULT NULL,
    cardId      VARCHAR(18)        NULL DEFAULT NULL,
    sex         VARCHAR(3)         NULL DEFAULT NULL,
    role        VARCHAR(1)         NULL DEFAULT '2'
);
-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO student
VALUES (20154001, '隔壁老王', '','2015', '计算机科学与技术', '2', '软件工程学院', '13585439532', 'gblw@163.com', 'E10ADC3949BA59ABBE56E057F20F883E',
        '3412312', '男', '2');
INSERT INTO student
VALUES (20154084, '大咸鱼', '','2015', '计算机科学与技术', '2', '软件工程学院', '13658377857', '13658377857@sina.cn',
        'E10ADC3949BA59ABBE56E057F20F883E', '124123124535', '男', '2');
INSERT INTO student
VALUES (20155003, '张大宝', '','2015', '信息工程', '1', '软件工程学院', '15583829425', '15583829425@163.com', 'E10ADC3949BA59ABBE56E057F20F883E',
        '3242342', '男', '2');
INSERT INTO student
VALUES (20155007, '翠花', '','2015', '网络工程', '1', '软件工程学院', '18734538457', '18734538457@163.com', 'E10ADC3949BA59ABBE56E057F20F883E',
        '2423423', '女', '2');
INSERT INTO student
VALUES (20155008, '小王', '','2015', '信息工程', '2', '软件工程学院', '15523619564', '15523619564@163.com', 'E10ADC3949BA59ABBE56E057F20F883E',
        '500234199704022353', '男', '2');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS teacher;
CREATE TABLE teacher
(
    teacherId   SERIAL PRIMARY KEY NOT NULL,
    teacherName VARCHAR(20)        NULL DEFAULT NULL,
    institute   VARCHAR(20)        NULL DEFAULT NULL,
    sex         VARCHAR(3)         NULL DEFAULT NULL,
    tel         VARCHAR(11)        NULL DEFAULT NULL,
    email       VARCHAR(20)        NULL DEFAULT NULL,
    pwd         VARCHAR(100)        NULL DEFAULT NULL,
    cardId      VARCHAR(18)        NULL DEFAULT NULL,
    type        VARCHAR(20)        NULL DEFAULT NULL,
    role        VARCHAR(1)         NULL DEFAULT NULL
);
-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO teacher
VALUES (20081001, '张', '软件工程学院', '男', '13598458442', '13598458442@163.com', 'E10ADC3949BA59ABBE56E057F20F883E', '423423283498', '讲师',
        '1');
INSERT INTO teacher
VALUES (20081002, '王大志', '软件工程学院', '男', '1231221312', '1231221312@163.com', 'E10ADC3949BA59ABBE56E057F20F883E', '24241234', '讲师',
        '1');

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

CREATE OR REPLACE PROCEDURE user1.prd_insert_update_student(stu_id integer, stu_name character varying,stu_image character varying, stu_grade character varying, stu_major character varying, stu_class character varying, stu_institute character varying, stu_tel character varying, stu_email character varying, stu_pwd character varying, stu_cardid character varying, stu_sex character varying, stu_role character varying, teacher_id integer)
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
    INSERT INTO student(studentname, image, grade, major, clazz, institute, tel,
                        email, pwd, cardid, sex, role, teacherid)
    VALUES(stu_name, stu_image, stu_grade, stu_major, stu_class, stu_institute, stu_tel,
                        stu_email, stu_pwd, stu_cardId, stu_sex, stuVALUE, teacher_id);
	ELSE
	  UPDATE student SET studentname=stu_name, image=stu_image, grade=stu_grade, major=stu_major, clazz=stu_class, institute=stu_institute, tel=stu_tel,
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