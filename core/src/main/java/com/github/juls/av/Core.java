package com.github.juls.av;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "com.github.juls.av.core.db")
@EnableTransactionManagement
public class Core {
/*
    private static final Logger LOG = LoggerFactory.getLogger(Core.class);

    public static void main(String[] args) {
        ConfigurableApplicationContext run = SpringApplication.run(Core.class, args);
        AchievementRepository bean = run.getBean(AchievementRepository.class);
        LOG.info("!!!!!!!!!!!!!!!!!!! {}", bean.findAll().toString());

        for (int i = 0; i < 10; i++) {
            Achievement achievement = new Achievement();
            achievement.setInfo("info" + i);
            achievement.setShortInfo("short info" + i);
            achievement.setParentId((long)i);
            bean.save(achievement);
        }
        LOG.info("=================== {}", bean.findAll().toString());
    }
*/

}
