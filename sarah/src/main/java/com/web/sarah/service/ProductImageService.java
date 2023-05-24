package com.web.sarah.service;

import com.web.sarah.entity.ProductImage;

public interface ProductImageService {

	void save(ProductImage productImage);

	void deleteById(int id);

}
