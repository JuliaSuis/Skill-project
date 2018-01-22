package com.github.juls.av.core.db.repo;

import com.github.juls.av.core.db.domain.Achievement;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface AchievementRepository extends JpaRepository<Achievement, Long> {
}
