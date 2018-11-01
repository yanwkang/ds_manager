package com.mr.service;

import java.util.List;

import com.mr.model.ObjectTMallAttr;
import com.mr.model.TMallAttrVO;

public interface TMallAttrService {

	void addAttr(Integer flbh2, TMallAttrVO mallAttrVO);

	List<ObjectTMallAttr> getAttrList(Integer flbh2);

}
