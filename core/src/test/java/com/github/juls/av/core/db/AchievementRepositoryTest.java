package com.github.juls.av.core.db;

import com.github.juls.av.Core;
import com.github.juls.av.core.db.domain.Achievement;
import com.github.juls.av.core.db.repo.AchievementRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = {Core.class})
public class AchievementRepositoryTest {
    private static final Logger LOG = LoggerFactory.getLogger(AchievementRepositoryTest.class);

    @Autowired
    private AchievementRepository achievementRepository;

    @Test
    @Transactional
    public void shouldPersistEntity() {
        LOG.info("Previous amount of persisted entities = {}", achievementRepository.count());

        achievementRepository.deleteAll();

        Achievement achievement = new Achievement();
        achievement.setInfo("info");
        achievement.setShortInfo("short info");
        achievement.setParentId(123L);
        achievementRepository.save(achievement);

        Achievement persisted = achievementRepository.findAll().get(0);
        assertNotNull(persisted);
        assertEquals("info", persisted.getInfo());
        assertEquals("short info", persisted.getShortInfo());
        assertEquals((Object) 123L, persisted.getParentId());
    }

}