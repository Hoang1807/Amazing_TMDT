package com.Amazing.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.Amazing.entity.Product;

public interface ProductDAO extends JpaRepository<Product, String> {
	@Query("SELECT MIN(t.typePrice) FROM Type t GROUP BY t.product.productId")
    List<Integer> findMinPricesGroupedByProductId();
	
	@Query("SELECT MAX(t.typePrice) FROM Product p JOIN p.types t ON p.productId = :productId")
    int findMaxPriceByProductId(@Param("productId") String productId);
	
	@Query("SELECT p.productId, p.productName, MIN(t.typePrice) AS minPrice, MAX(t.typePrice) AS maxPrice, t.typeImage " +
	           "FROM Product p " +
	           "INNER JOIN p.types t " +
	           "GROUP BY p.productId, p.productName, t.typeImage")
	List<Object[]> getAllProductsWithMinAndMaxPriceAndImage();
}
