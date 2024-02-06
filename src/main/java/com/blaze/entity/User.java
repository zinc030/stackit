package com.blaze.entity;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor 
@AllArgsConstructor 
@Entity
@Table(name="users")
public class User {
    
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(nullable=false, unique=true)
    private String username;

    @Column(nullable=false)
    private String password;

    @Column(nullable=false, unique=true)
    private String nickname;
    
    private String name;

    @Column(nullable=false, unique=true)
    private String email;

    @ManyToMany(fetch = FetchType.EAGER, cascade=CascadeType.ALL)
    @JoinTable(
            name="users_roles",
            joinColumns={@JoinColumn(name="USER_ID", referencedColumnName="ID")},
            inverseJoinColumns={@JoinColumn(name="ROLE_ID", referencedColumnName="ID")})
    private List<Role> roles = new ArrayList<>();

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL) // one user, many upvoted reviews
    private Set<HelpfulVote> helpfulVotes;
    
    @Transient // not persisted in the database. It's derived from the helpfulVotes set, which is persisted. 
    private List<CompanyReview> helpfulReviews;

    public List<CompanyReview> getHelpfulReviews() {
        if (helpfulReviews == null) {
            helpfulReviews = helpfulVotes.stream()
                .map(HelpfulVote::getReview)
                .collect(Collectors.toList());
        }
        return helpfulReviews;
    }

    @ManyToMany
    @JoinTable(
        name = "user_bookmarked_job_posts",
        joinColumns = @JoinColumn(name = "user_id"),
        inverseJoinColumns = @JoinColumn(name = "job_post_id")
    )
    private List<JobPost> bookmarkedJobPosts;

    public boolean hasBookmarked(JobPost jobPost) {
        return bookmarkedJobPosts.contains(jobPost);
    }
}
