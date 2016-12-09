package org.seckill.dao;

import org.seckill.entity.SuccessKilled;

/**
 * Created by ymgan on 2016/12/9.
 */
public interface SuccessKilledDao {

    int insertSuccessKilled(long seckillId, long userPhone);

    SuccessKilled queryByIdWithSeckill(long seckillId);
}
