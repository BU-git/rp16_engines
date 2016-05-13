package com.bionic.service;


import com.bionic.domain.order.OrderWrapperHolder;

public interface OrderPaginationService {

    OrderWrapperHolder getAllOrders(int pageNumber, int pageSize, String search, String direction, int column, int status);

}