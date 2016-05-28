package com.bionic.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bionic.dao.OrderPaginationDao;
import com.bionic.domain.Order;
import com.bionic.domain.order.OrderStatus;
import com.bionic.domain.order.OrderWrapper;
import com.bionic.domain.order.OrderWrapperHolder;

@Service
@Transactional
public class OrderPaginationServiceImpl implements OrderPaginationService {

    private static long total;

    @Autowired
    private OrderPaginationDao orderPaginationDao;

    @Override
    public OrderWrapperHolder getAllOrders(Map<String, String> requestParam, int target){
        try{
            Properties p = new Properties()
                    .setPageNumber(Integer.parseInt(requestParam.get("start"))/Integer.parseInt(requestParam.get("length")))
                    .setPageSize(Integer.parseInt(requestParam.get("length")))
                    .setSearch(requestParam.get("search[value]"))
                    .setDir(requestParam.get("order[0][dir]"))
                    .setColumn(Integer.parseInt(requestParam.get("order[0][column]")));
            switch (target){
                case OrderStatus.ALL: return fillUpOrderWrapperHolder(getOrderPage(p.setStatus(OrderStatus.ALL)));
                case OrderStatus.COMPLETED: return fillUpOrderWrapperHolder(getOrderPage(p.setStatus(OrderStatus.COMPLETED)));
                case OrderStatus.NOT_COMPLETED: return fillUpOrderWrapperHolder(getOrderPage(p.setStatus(OrderStatus.NOT_COMPLETED)));
                default: return new OrderWrapperHolder();
            }
        }catch (Exception e){
            return new OrderWrapperHolder();
        }
    }

    private Page<Order> getOrderPage(Properties p){
        Sort.Direction dir = p.dir != null && p.dir.equals("asc") ? Sort.Direction.DESC : Sort.Direction.ASC;
        PageRequest request = new PageRequest(p.pageNumber, p.pageSize, dir, resolveColumnName(p.column));
        if(p.search != null && p.search.length() > 0){
            long number = parseString(p.search);
            if(number >= 0){
                switch (p.status){
                    case OrderStatus.ALL: return orderPaginationDao.findAllByNumberLike(number, request);
                    case OrderStatus.COMPLETED: return orderPaginationDao.findAllCompletedByNumberLike(number, request);
                    default: return orderPaginationDao.findAllNotCompletedByNumberLike(number, request);
                }
            }
        }
        Page<Order> page;
        switch (p.status){
            case OrderStatus.ALL: {
                page = orderPaginationDao.findAll(request);
                break;
            }
            case OrderStatus.COMPLETED: {
                page = orderPaginationDao.findAllCompleted(request);
                break;
            }
            default: page = orderPaginationDao.findAllNotCompleted(request);
        }
        total = page.getTotalElements();
        return page;
    }

    private String resolveColumnName(int number){
        switch (number){
            case 0:  return "number";
            default: return "date";
        }
    }

    private OrderWrapperHolder fillUpOrderWrapperHolder(Page<Order> page){
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

    private class Properties{

        private int pageNumber;
        private int pageSize;
        private String search;
        private String dir;
        private int column;
        private int status;

        public Properties setPageNumber(int pageNumber) {
            this.pageNumber = pageNumber;
            return this;
        }

        public Properties setStatus(int status) {
            this.status = status;
            return this;
        }

        public Properties setPageSize(int pageSize) {
            this.pageSize = pageSize;
            return this;
        }

        public Properties setSearch(String search) {
            this.search = search;
            return this;
        }

        public Properties setDir(String dir) {
            this.dir = dir;
            return this;
        }

        public Properties setColumn(int column) {
            this.column = column;
            return this;
        }
    }
}