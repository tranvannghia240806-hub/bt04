package vn.iotstar.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "Products")
@Getter
@Setter
@NoArgsConstructor
public class Product implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    private int id;

    @Column(name = "product_name", nullable = false, length = 255)
    private String name;

    @Column(name = "price", nullable = false)
    private BigDecimal price;

    @Column(name = "description", length = 4000)
    private String description;

    @Column(name = "image", length = 255)
    private String image;

    @Column(name = "quantity", nullable = false)
    private int quantity;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "createddate", nullable = false)
    private Date createdDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "cate_id", nullable = false)
    private Category category;

    public Product(String name, BigDecimal price, String description, String image,
                    int quantity, Date createdDate, Category category) {
        this.name = name;
        this.price = price;
        this.description = description;
        this.image = image;
        this.quantity = quantity;
        this.createdDate = createdDate;
        this.category = category;
    }
}
