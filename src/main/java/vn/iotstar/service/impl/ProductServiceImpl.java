package vn.iotstar.service.impl;

import java.io.File;
import java.util.List;

import vn.iotstar.dao.ProductDao;
import vn.iotstar.dao.impl.ProductDaoImpl;
import vn.iotstar.model.Product;
import vn.iotstar.service.ProductService;
import vn.iotstar.util.Constant;

public class ProductServiceImpl implements ProductService {
    ProductDao productDao = new ProductDaoImpl();

    @Override
    public void insert(Product product) {
        productDao.insert(product);
    }

    @Override
    public void edit(Product newProduct) {
        Product oldProduct = productDao.get(newProduct.getId());
        if (oldProduct == null) {
            return;
        }
        oldProduct.setName(newProduct.getName());
        oldProduct.setPrice(newProduct.getPrice());
        oldProduct.setDescription(newProduct.getDescription());
        oldProduct.setQuantity(newProduct.getQuantity());
        oldProduct.setCategory(newProduct.getCategory());

        if (newProduct.getImage() != null) {
            String oldFileName = oldProduct.getImage();
            if (oldFileName != null && !oldFileName.startsWith("http")) {
                File file = new File(Constant.DIR + "/" + oldFileName);
                if (file.exists()) {
                    file.delete();
                }
            }
            oldProduct.setImage(newProduct.getImage());
        }
        productDao.edit(oldProduct);
    }

    @Override
    public void delete(int id) {
        productDao.delete(id);
    }

    @Override
    public Product get(int id) {
        return productDao.get(id);
    }

    @Override
    public List<Product> getAll() {
        return productDao.getAll();
    }

    @Override
    public List<Product> getLatest(int limit) {
        return productDao.getLatest(limit);
    }

    @Override
    public List<Product> getPage(int pageIndex, int pageSize) {
        if (pageIndex < 1) {
            pageIndex = 1;
        }
        return productDao.getPage(pageIndex, pageSize);
    }

    @Override
    public long countAll() {
        return productDao.countAll();
    }

    @Override
    public int countTotalPages(int pageSize) {
        long total = countAll();
        return (int) Math.ceil(total / (double) pageSize);
    }

    @Override
    public List<Product> getByCategory(int cateId) {
        return productDao.getByCategory(cateId);
    }

    @Override
    public List<Product> getPageByCategory(int pageIndex, int pageSize, int cateId) {
        if (pageIndex < 1) {
            pageIndex = 1;
        }
        return productDao.getPageByCategory(pageIndex, pageSize, cateId);
    }

    @Override
    public int countTotalPagesByCategory(int pageSize, int cateId) {
        long total = productDao.countByCategory(cateId);
        return (int) Math.ceil(total / (double) pageSize);
    }
}
