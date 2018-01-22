package com.github.juls.av.core.db.repo;

import com.github.juls.av.core.db.domain.Link;
import com.github.juls.av.core.db.domain.Node;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface LinksRepository extends JpaRepository<Link, Long> {
    @Query("SELECT l FROM Link l WHERE SOURCE in :in and DESTINATION in :in")
    public List<Link> filterIn(@Param("in") List<Long> in);

}
