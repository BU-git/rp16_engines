package com.bionic.service;


import java.util.Map;

import com.bionic.domain.order.OrderWrapperHolder;

public interface OrderPaginationService {

    OrderWrapperHolder getAllOrders(Map<String, String> allRequestParams, int target);

}