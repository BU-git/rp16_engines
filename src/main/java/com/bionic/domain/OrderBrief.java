package com.bionic.domain;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.Date;

public class OrderBrief {

    /**
     * Order number [nummer in XML}
     * NotNull
     */
    private long number;

    /**
     * This is time when this order was imported to BO Server.
     * After import it never changed.
     * NotNull
     */
    @Temporal(TemporalType.TIMESTAMP)
    private Date importDate;

    /**
     * This is time when this order was changed in BO Server.
     * If order changed in BO this field has to be updated.
     * This field will be used by Android App to check if order has to be updated from server.
     * When order is imported to BO Server this time is set the same value as lastServerChangeTimestamp
     * This field will NOT changed in Android App.
     * NotNull
     */
    @Temporal(TemporalType.TIMESTAMP)
    private Date lastServerChangeDate;

    /**
     * This is time when this order was changed in Android.
     * If order changed in Android App this field has to be updated.
     * This field will be used by Android App to check if order need to be updated to server.
     * This field will NOT changed in BO Server.
     * When order is imported to BO Server this time is set the same value as lastServerChangeTimestamp
     * NotNull
     */
    @Temporal(TemporalType.TIMESTAMP)
    private Date lastAndroidChangeDate;

    /**
     * Order status
     */
    private int status;

    private final static int ORDER_STATUS_NOT_STARTED = 0;
    private final static int ORDER_STATUS_IN_PROGRESS = 1;
    private final static int ORDER_STATUS_COMPLETE = 2;
    private final static int ORDER_STATUS_COMPLETE_UPLOADED = 3;


    public OrderBrief() {
    }

    public OrderBrief(long number, Date importDate, Date lastServerChangeDate, Date lastAndroidChangeDate) {
        this.number = number;
        this.importDate = importDate;
        this.lastServerChangeDate = lastServerChangeDate;
        this.lastAndroidChangeDate = lastAndroidChangeDate;
    }

    public long getNumber() {
        return number;
    }

    public void setNumber(long number) {
        this.number = number;
    }

    public Date getImportDate() {
        return importDate;
    }

    public void setImportDate(Date importDate) {
        this.importDate = importDate;
    }

    public Date getLastServerChangeDate() {
        return lastServerChangeDate;
    }

    public void setLastServerChangeDate(Date lastServerDate) {
        this.lastServerChangeDate = lastServerDate;
    }

    public Date getLastAndroidChangeDate() {
        return lastAndroidChangeDate;
    }

    public void setLastAndroidChangeDate(Date lastAndroidChangeDate) {
        this.lastAndroidChangeDate = lastAndroidChangeDate;
    }
}
