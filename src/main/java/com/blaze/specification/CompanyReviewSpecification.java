package com.blaze.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.blaze.entity.CompanyReview;
import com.blaze.enums.SwField;

import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.Predicate;



public class CompanyReviewSpecification {
    public static Specification<CompanyReview> hasTitleOrProOrCon(String keyword) {
        return (root, query, cb) -> {
            if (keyword == null || keyword.isEmpty()) {
                return null;
            }
            Predicate hasTitle = cb.like(root.get("title"), "%" + keyword + "%");
            Predicate hasPro = cb.like(root.get("pro"), "%" + keyword + "%");
            Predicate hasCon = cb.like(root.get("con"), "%" + keyword + "%");
            return cb.or(hasTitle, hasPro, hasCon);
        };
    }

    public static Specification<CompanyReview> hasSwFieldIn(List<SwField> swFields) {
        return (root, query, cb) -> {
            if (swFields == null || swFields.isEmpty()) {
                return null;
            }
            return root.get("swField").in(swFields);
        };
    }

    public static Specification<CompanyReview> hasCompanyId(Long companyId) {
        return (root, query, cb) -> companyId == null ? null : cb.equal(root.get("company").get("id"), companyId);
    }

    public static Specification<CompanyReview> hasStarsIn(List<Integer> starRatings) {
    return (root, query, cb) -> {
        if (starRatings == null || starRatings.isEmpty()) {
            return null;
        }
        CriteriaBuilder.In<Byte> inClause = cb.in(root.get("rating"));
        for (Integer rating : starRatings) {
            inClause.value(rating.byteValue());
        }
        return inClause;
    };
}
}