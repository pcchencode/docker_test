class CreateRptFansBuyings < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TABLE `rpt_fans_buyings` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `t_pfid` int(11) unsigned DEFAULT NULL COMMENT '主播編號',
        `cal_date` date DEFAULT NULL COMMENT '計算日期',
        `isfirst` bool DEFAULT NULL COMMENT '第一次獲得粉絲團',
        `buying_counts` mediumint(6) unsigned DEFAULT NULL COMMENT '粉絲團人數',
        `buying_months` mediumint(6) unsigned DEFAULT NULL COMMENT '粉絲團購買月數',
        `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系統建立日期',
        `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系統更新日期',
        PRIMARY KEY (`id`),
        UNIQUE KEY `uni_cal_date_t_pfid` (`cal_date`, `t_pfid`),
        KEY `idx_isfirst` (`isfirst`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='粉絲團購買';
    SQL
  end

  def down
    drop_table :rpt_fans_buyings
  end
end