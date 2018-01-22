package com.github.juls.av.web.retrieve;

import com.github.juls.av.core.db.domain.Achievement;
import com.github.juls.av.core.db.repo.AchievementRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class AchievementsRetriever {

    private final AchievementRepository achievementRepository;

    @Autowired
    public AchievementsRetriever(AchievementRepository achievementRepository) {
        this.achievementRepository = achievementRepository;
    }

    public List<Achievement> getAchievements() {
        return achievementRepository.findAll();
    }

}
