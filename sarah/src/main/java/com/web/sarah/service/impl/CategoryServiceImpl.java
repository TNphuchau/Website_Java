package com.web.sarah.service.impl;

import com.web.sarah.entity.Category;
import com.web.sarah.repository.CategoryRepository;
import com.web.sarah.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryServiceImpl implements CategoryService {
	private final CategoryRepository categoryRepository;

	@Autowired
	public CategoryServiceImpl(CategoryRepository categoryRepository) {
		this.categoryRepository = categoryRepository;
	}

	@Override
	public List<Category> findAll() {
		return categoryRepository.findAll();
	}

	@Override
	public Category getCategoryById(int id) {
		Optional<Category> optionalCategory = categoryRepository.findById((long) id);
		return optionalCategory.orElse(null);
	}

	@Override
	public Category saveCategory(Category category) {
		return categoryRepository.save(category);
	}

	@Override
	public Category updateCategory(Category category) {
		return categoryRepository.save(category);
	}

	@Override
	public void deleteCategoryId(int id) {
		categoryRepository.deleteById((long) id);
	}
}

