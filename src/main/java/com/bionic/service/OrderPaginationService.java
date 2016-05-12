package com.bionic.service;


import com.bionic.domain.order.OrderWrapper;
import com.bionic.domain.order.OrderWrapperHolder;

import java.util.List;

public interface OrderPaginationService {

    OrderWrapperHolder getAllOrders(int pageNumber, int pageSize, String search, String direction, int column);

    OrderWrapperHolder getOrdersByStatus(int pageNumber, int pageSize, String search, String direction, int column, int status);
}