CREATE DATABASE seckill;

use seckill;

CREATE TABLE seckill(
  `seckill_id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品库存id',
  `name` varchar(120) NOT NULL COMMENT '商品名称',
  `number` int NOT NULL COMMENT '商品数量',
  `start_time` timestamp NOT NULL COMMENT '秒杀开始时间',
  `end_time` TIMESTAMP  NOT NULL COMMENT '秒杀结束时间',
  `create_time` TIMESTAMP not null default CURRENT_TIMESTAMP comment '秒杀创建时间',
  PRIMARY KEY(seckill_id),
  key idx_start_time(start_time),
  key idx_end_time(end_time),
  key idx_create_time(create_time)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='秒杀库存表';

INSERT INTO
  seckill(name, number, start_time,end_time)
VALUES
  ('1000元秒杀iphone7', 100, '2016-12-10 00:00:00', '2016-12-18 59:59:59'),
  ('500元秒杀ipad4', 200, '2016-12-10 00:00:00', '2016-12-18 59:59:59'),
  ('300元秒杀小米4', 300, '2016-12-10 00:00:00', '2016-12-18 59:59:59'),
  ('200元秒杀红米note',400, '2016-12-10 00:00:00', '2016-12-18 59:59:59');


CREATE TABLE success_killed(
  `seckill_id` bigint NOT NULL COMMENT '商品库存id',
  `user_phone` bigint not NULL COMMENT '用户手机',
  `state` tinyint NOT NULL  DEFAULT -1 COMMENT '秒杀状态：-1：无效；0=成功；1：已付款',
  `create_time` timestamp NOT NULL COMMENT '秒杀时间',
  PRIMARY KEY (seckill_id,user_phone),
  key idx_create_time(create_time)
)ENGINE = InnoDB DEFAULT CHARSET=utf8 COMMENT '秒杀成功明细表';
