package com.bionic.domain;

import java.util.List;

public interface DataTablesAjaxHolder<T> {

    List<T> getData();

    void setData(List<T> data);
}
