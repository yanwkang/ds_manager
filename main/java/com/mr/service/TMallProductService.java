package com.mr.service;

import java.util.List;
import com.mr.model.TMallProduct;

public interface TMallProductService {

	void addSpu(TMallProduct mallProduct, List<String> list);

	List<TMallProduct> getSpuList(Integer flbh2, Integer ppId);


}
