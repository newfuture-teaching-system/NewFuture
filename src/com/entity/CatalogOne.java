package com.entity;

import java.util.List;

public class CatalogOne {
private String courseId;
private String catalogOneId;
private String catalogOneName;
private String catalogIntroduction;
private List<CatalogOneTwo> catalogOneTwoList;
private int num; 


public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public List<CatalogOneTwo> getCatalogOneTwoList() {
	return catalogOneTwoList;
}
public void setCatalogOneTwoList(List<CatalogOneTwo> catalogOneTwoList) {
	this.catalogOneTwoList = catalogOneTwoList;
}
public String getCourseId() {
	return courseId;
}
public void setCourseId(String courseId) {
	this.courseId = courseId;
}
public String getCatalogOneId() {
	return catalogOneId;
}
public void setCatalogOneId(String catalogOneId) {
	this.catalogOneId = catalogOneId;
}
public String getCatalogOneName() {
	return catalogOneName;
}
public void setCatalogOneName(String catalogOneName) {
	this.catalogOneName = catalogOneName;
}
public String getCatalogIntroduction() {
	return catalogIntroduction;
}
public void setCatalogIntroduction(String catalogIntroduction) {
	this.catalogIntroduction = catalogIntroduction;
}

}
