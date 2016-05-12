package com.bionic.domain.order;


import com.bionic.domain.DataTablesAjaxHolder;

import java.util.List;

public class OrderWrapperHolder {

    private static int draw;
    private long recordsTotal;
    private long recordsFiltered;
    private List<OrderWrapper> data;


    public long getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(long recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public long getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(long recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    public static int getDraw() {
        return draw;
    }

    public List<OrderWrapper> getData() {
        return this.data;
    }

    public void setData(List<OrderWrapper> data) {
        draw++;
        this.data = data;
    }
}