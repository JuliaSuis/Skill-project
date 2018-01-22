package com.github.juls.av.core.db.repo;

import com.github.juls.av.core.db.domain.Node;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface NodesRepository extends JpaRepository<Node, Long>{
    public List<Node> findAllByOrderByTimeAsc();
    public List<Node> findAllByOrderById2();

    @Query("SELECT n FROM Node n WHERE id2 in :in")
    public List<Node> filterIn(@Param("in") List<Long> in);
}
