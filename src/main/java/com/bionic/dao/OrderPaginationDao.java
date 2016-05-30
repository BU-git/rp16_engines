package com.bionic.dao;


import com.bionic.domain.order.Order;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface OrderPaginationDao extends PagingAndSortingRepository<Order, Long> {

    @Query(value = "SELECT o FROM Order o WHERE o.number LIKE CONCAT(?1, '%')")
    Page<Order> findAllByNumberLike(long number, Pageable pageable);

    @Query(value = "SELECT o FROM Order o WHERE o.orderStatus = 3")
    Page<Order> findAllCompleted(Pageable pageable);

    @Query(value = "SELECT o FROM Order o WHERE o.number LIKE CONCAT(?1, '%') AND o.orderStatus = 3")
    Page<Order> findAllCompletedByNumberLike(long number, Pageable pageable);

    @Query(value = "SELECT o FROM Order o WHERE o.orderStatus = 0 OR o.orderStatus = 1")
    Page<Order> findAllNotCompleted(Pageable pageable);

    @Query(value = "SELECT o FROM Order o WHERE o.number LIKE CONCAT(?1, '%') AND (o.orderStatus = 0 OR o.orderStatus = 1)")
    Page<Order> findAllNotCompletedByNumberLike(long number, Pageable pageable);

}