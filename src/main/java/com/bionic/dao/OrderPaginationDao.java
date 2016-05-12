package com.bionic.dao;


import com.bionic.domain.Order;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface OrderPaginationDao extends PagingAndSortingRepository<Order, Long> {

    @Query(value = "SELECT o FROM Order o WHERE o.number LIKE CONCAT(?1, '%')")
    Page<Order> findByNumberLike(long number, Pageable pageable);

    @Query(value = "SELECT o FROM Order o WHERE o.orderStatus = ?1")
    Page<Order> findByOrderStatus(int orderStatus, Pageable pageable);

    @Query(value = "SELECT o FROM Order o WHERE o.number LIKE CONCAT(?1, '%') AND o.orderStatus =?2")
    Page<Order> findByNumberAndOrderStatusLike(long number, int orderStatus, Pageable pageable);

}