package com.bionic.dao;

import com.bionic.domain.Order;

public interface OrderDao {

    Order findById(int id);

}
