
package com.bionic.dao;

import java.util.List;

import com.bionic.domain.template.Field;

public interface FieldDao {

    public List<Field> findByType(String type);
}
