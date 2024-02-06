package com.blaze.specification;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.blaze.entity.JobPost;
import com.blaze.enums.SwField;

import jakarta.persistence.criteria.Predicate;

public class JobPostSpecification {

    public static Specification<JobPost> hasTitleOrCompanyName(String query) {
        return (root, cq, cb) -> {
            if (query == null) {
                return cb.isTrue(cb.literal(true)); // always true = no filtering
            }
            return cb.or(
                cb.like(root.get("title"), "%" + query + "%"),
                cb.like(root.get("company").get("name"), "%" + query + "%")
            );
        };
    }

    public static Specification<JobPost> hasMinSalary(Integer minSalary) {
        return (root, cq, cb) -> {
            if (minSalary == null) {
                return cb.isTrue(cb.literal(true)); // always true = no filtering
            }
            return cb.greaterThanOrEqualTo(root.get("salary"), minSalary);
        };
    }

    public static Specification<JobPost> hasMaxSalary(Integer maxSalary) {
        return (root, query, cb) -> {
            if (maxSalary == null) {
                return cb.isTrue(cb.literal(true)); // always true = no filtering
            }
            return cb.lessThanOrEqualTo(root.get("salary"), maxSalary);
        };
    }

    public static Specification<JobPost> hasSeniority(String seniority) {
        return (root, query, cb) -> {
            if (seniority == null || seniority.isEmpty()) {
                return cb.isTrue(cb.literal(true)); // always true = no filtering
            }
            return cb.equal(root.get("seniority"), seniority);
        };
    }

    public static Specification<JobPost> hasEmploymentType(String employmentType) {
        return (root, query, cb) -> {
            if (employmentType == null || employmentType.isEmpty()) {
                return cb.isTrue(cb.literal(true)); // always true = no filtering
            }
            return cb.equal(root.get("employmentType"), employmentType);
        };
    }

    public static Specification<JobPost> hasSwField(String[] swFields) {
        return (root, query, cb) -> {
            if (swFields == null || swFields.length == 0) {
                return cb.conjunction(); // returns a predicate that always evaluates to true
            } else {
                List<Predicate> predicates = new ArrayList<>();
                for (String swField : swFields) {
                    predicates.add(cb.equal(root.get("swField"), SwField.valueOf(swField)));
                }
                return cb.or(predicates.toArray(new Predicate[0]));
            }
        };
    }

}