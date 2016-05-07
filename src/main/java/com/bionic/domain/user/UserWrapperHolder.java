package com.bionic.domain.user;

import java.util.List;

import com.bionic.domain.DataTablesAjaxHolder;

public class UserWrapperHolder implements DataTablesAjaxHolder<UserWrapper> {

    private List<UserWrapper> data;

    @Override
    public List<UserWrapper> getData() {
        return data;
    }

    @Override
    public void setData(List<UserWrapper> data) {
        this.data = data;
    }
}
