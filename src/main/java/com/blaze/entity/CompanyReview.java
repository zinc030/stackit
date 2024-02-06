package com.blaze.entity;

import java.util.Date;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.blaze.enums.SwField;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "company_reviews", uniqueConstraints = @UniqueConstraint(columnNames = {"user_id", "company_id", "swField"}))
public class CompanyReview {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    private SwField swField;

    @ManyToOne
    private User user;

    @ManyToOne
    private Company company;

    private String title;

    private String status;

    @Min(0)
    @Max(5)
    private Byte rating;
    
    @Column(columnDefinition = "TEXT")
    private String pro;

    @Column(columnDefinition = "TEXT")
    private String con;

    @Column(nullable = false, columnDefinition = "integer default 0")
    private Integer voteCount;

    @Column(columnDefinition = "TEXT")
    private String advice;

    @CreationTimestamp
    private Date createdDate;

    @UpdateTimestamp
    private Date updatedDate;
    
}
