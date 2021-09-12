package com.cos.webproject.dto;

public class Item {

    private String airlineNm;
    private String arrAirportNm;
    private Long arrPlandTime;
    private String depAirportNm;
    private Long depPlandTime;
    private Integer economyCharge;
    private Integer prestigeCharge;
    private String vihicleId;

    public String getAirlineNm() {
        return airlineNm;
    }

    public void setAirlineNm(String airlineNm) {
        this.airlineNm = airlineNm;
    }

    public String getArrAirportNm() {
        return arrAirportNm;
    }

    public void setArrAirportNm(String arrAirportNm) {
        this.arrAirportNm = arrAirportNm;
    }

    public Long getArrPlandTime() {
        return arrPlandTime;
    }

    public void setArrPlandTime(Long arrPlandTime) {
        this.arrPlandTime = arrPlandTime;
    }

    public String getDepAirportNm() {
        return depAirportNm;
    }

    public void setDepAirportNm(String depAirportNm) {
        this.depAirportNm = depAirportNm;
    }

    public Long getDepPlandTime() {
        return depPlandTime;
    }

    public void setDepPlandTime(Long depPlandTime) {
        this.depPlandTime = depPlandTime;
    }

    public Integer getEconomyCharge() {
        return economyCharge;
    }

    public void setEconomyCharge(Integer economyCharge) {
        this.economyCharge = economyCharge;
    }

    public Integer getPrestigeCharge() {
        return prestigeCharge;
    }

    public void setPrestigeCharge(Integer prestigeCharge) {
        this.prestigeCharge = prestigeCharge;
    }

    public String getVihicleId() {
        return vihicleId;
    }

    public void setVihicleId(String vihicleId) {
        this.vihicleId = vihicleId;
    }

}