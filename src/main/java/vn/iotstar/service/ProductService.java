package vn.iotstar.service;

import java.util.List;

import vn.iotstar.model.Product;

public interface ProductService {
    void insert(Product product);
    void edit(Product product);
    void delete(int id);
    Product get(int id);
    List<Product> getAll();
    List<Product> getLatest(int limit);
    List<Product> getPage(int pageIndex, int pageSize);
    long countAll();
    int countTotalPages(int pageSize);
    List<Product> getByCategory(int cateId);

    List<Product> getPageByCategory(int pageIndex, int pageSize, int cateId);

    int countTotalPagesByCategory(int pageSize, int cateId);
}
