package com.mapper;


import java.util.List;

import com.entity.CatalogOneTwo;

public interface CatalogOneTwoMapper {
	public CatalogOneTwo selectContent(String courseId,String oneId,String twoId);
	public List<CatalogOneTwo> selectCatalogOneTwos (String courseId,String oneId) ;
}
