package com.bionic.service;


import com.bionic.dao.OrderPaginationDao;
import com.bionic.domain.Order;
import com.bionic.domain.order.OrderWrapper;
import com.bionic.domain.order.OrderWrapperHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class OrderPaginationServiceImpl implements OrderPaginationService {

    private static long total;
    private static final int ALL_ORDERS = 1;

    @Autowired
    private OrderPaginationDao orderPaginationDao;

    @Override
    public OrderWrapperHolder getAllOrders(int pageNumber, int pageSize, String search, String direction, int column) {
        return fillUpOrderWrapperHolder(getOrderPage(pageNumber, pageSize, search, direction, column, ALL_ORDERS), total);
    }

    @Override
    public OrderWrapperHolder getOrdersByStatus(int pageNumber, int pageSize, String search, String direction, int column, int status) {
        return fillUpOrderWrapperHolder(getOrderPage(pageNumber, pageSize, search, direction, column, status), total);
    }

    private Page<Order> getOrderPage(int pageNumber, int pageSize, String search, String direction, int column, int status){
        Sort.Direction dir = direction != null && direction.equals("asc") ?
                Sort.Direction.DESC : Sort.Direction.ASC;
        PageRequest request = new PageRequest(pageNumber, pageSize, dir, resolveColumnName(column));
        if(search != null && search.length() > 0){
            long number = parseString(search);
            if(number >= 0){
                switch (status){
                    case ALL_ORDERS: return orderPaginationDao.findByNumberLike(number, request);
                    default: return orderPaginationDao.findByNumberAndOrderStatusLike(number, status, request);
                }
            }
        }
        Page<Order> page;
        switch (status){
            case ALL_ORDERS: {
                page = orderPaginationDao.findAll(request);
                break;
            }
            default: page = orderPaginationDao.findByOrderStatus(status, request);
        }
        total = page.getTotalElements();
        return page;
    }

    private String resolveColumnName(int number){
        switch (number){
            case 0: return "number";
            case 1: return "date";
            case 2: return "orderStatus";
            case 3: return "installation";
            case 4: return "tasks";
            case 5: return "address";
            default:return "date";
        }
    }

    private OrderWrapperHolder fillUpOrderWrapperHolder(Page<Order> page, long total){
        List<Order> list = page.getContent();
        List<OrderWrapper> result = new ArrayList<>();
        for(Order o: list){
            OrderWrapper wrapper = new OrderWrapper(o);
            result.add(wrapper);
        }
        OrderWrapperHolder holder = new OrderWrapperHolder();
        holder.setData(result);
        holder.setRecordsFiltered(page.getTotalElements());
        holder.setRecordsTotal(total);
        return holder;
    }

    private long parseString(String searchNumber){
        try{
            return Long.parseLong(searchNumber);
        }catch (Exception e){
            return -1;
        }
    }
}