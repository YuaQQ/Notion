# Two-way Factorial ANOVA

# of predictors: 2
Example Research Question: Do SITE and MONTH (and their interaction) predict swallow mass?
Factor Type: Between-Subjects

[Back to ANOVA](../../ANOVA%202c320bc7661880989015e2e06dd78bf6.md)

# General characteristics

- Relationship between variables:
    - **y ~ A * B**
- Independent variable:
    - 2 categorical independent variable (between-subjects factor)
- Dependent variable:
    - 1 [continuous](../../../Continuous%20variable%202c320bc7661880b9a90ff829067c71f3.md) (quantitative) variable

# Example

[swallows-adults.csv](Three-way%20Factorial%20ANOVA/swallows-adults.csv)

- IVs:
    - SITE (2, 4, 9)
    - MONTH (aug, sep)
- DV: MASS

```r
# ====================== 1. 安装并加载必要的包 ======================
# 若未安装，请先运行：install.packages(c("tidyverse", "car", "emmeans", "ggplot2", "ggpubr", "rstatix"))
library(tidyverse)   # 数据处理和绘图
library(car)         # 方差齐性检验（leveneTest）、类型III平方和（Anova）
library(emmeans)     # 计算边际均值及事后比较
library(ggplot2)     # 绘图
library(ggpubr)      # 辅助添加统计标记（可选）
library(rstatix)     # 提供管道友好的统计函数（可选）

# ====================== 2. 准备数据 ======================
# 假设数据框名为 data，其中：
#   var1 : 数值型因变量
#   var2 : 第一个因子（分组变量，例如处理A）
#   var3 : 第二个因子（分组变量，例如处理B）
# 确保因子变量为 factor 类型
data <- data %>%
  mutate(var2 = as.factor(var2),
         var3 = as.factor(var3))

# 查看数据结构和摘要
glimpse(data)
summary(data)         # 可查看各变量的基本统计量

# 计算各组的样本量、均值和标准差（可选）
data %>%
  group_by(var2, var3) %>%
  summarise(n = n(),
            mean = mean(var1, na.rm = TRUE),
            sd = sd(var1, na.rm = TRUE),
            .groups = "drop")

# ====================== 3. 拟合双因素方差分析模型 ======================
# 使用 aov() 拟合包含交互作用的模型
model_2way <- aov(var1 ~ var2 * var3, data = data)

# 查看传统的方差分析表（类型I平方和）
summary(model_2way)

# 如果设计不平衡（各组样本量不等），推荐使用类型III平方和
# 需要先设置对比方式，然后用 car::Anova()
options(contrasts = c("contr.sum", "contr.poly"))   # 设置正交对比
model_2way_III <- aov(var1 ~ var2 * var3, data = data)
car::Anova(model_2way_III, type = 3)

# ====================== 4. 检验模型假设 ======================
# 假设1：残差独立性（通过实验设计保证，如随机化）
# 假设2：残差正态性（Shapiro-Wilk检验）
shapiro.test(residuals(model_2way))
# p > 0.05 满足正态性

# 假设3：方差齐性（Levene检验，检验各因子组合下的方差是否相等）
leveneTest(var1 ~ interaction(var2, var3), data = data)
# p > 0.05 满足方差齐性

# 也可绘制残差诊断图
par(mfrow = c(2, 2))
plot(model_2way)
par(mfrow = c(1, 1))

# ====================== 5. 事后比较与简单主效应分析 ======================
# 5.1 检查交互作用是否显著
# 若交互作用显著（p < 0.05），则进行简单主效应分析
# 若交互作用不显著，则进行主效应的事后比较

# 使用 emmeans 包进行处理
# 首先计算每个因子组合的边际均值
emm_interaction <- emmeans(model_2way, ~ var2 * var3)

# 5.2 交互作用显著时的简单主效应分析
# 例如，固定 var3，检验 var2 在不同水平上的效应
simple_var2_by_var3 <- emmeans(model_2way, ~ var2 | var3)
pairs(simple_var2_by_var3, adjust = "tukey")   # 对每个 var3 水平进行 var2 的两两比较

# 同样，固定 var2，检验 var3 的效应
simple_var3_by_var2 <- emmeans(model_2way, ~ var3 | var2)
pairs(simple_var3_by_var2, adjust = "tukey")

# 5.3 若交互作用不显著，则直接进行主效应的事后比较
# 主效应事后比较（Tukey法）
emm_var2 <- emmeans(model_2way, ~ var2)
pairs(emm_var2, adjust = "tukey")

emm_var3 <- emmeans(model_2way, ~ var3)
pairs(emm_var3, adjust = "tukey")

# 注：也可以使用 multcomp 包进行更灵活的比较，但 emmeans 已足够

# ====================== 6. 可视化 ======================
# 6.1 交互作用图（折线图）
emm_df <- as.data.frame(emm_interaction)
ggplot(emm_df, aes(x = var2, y = emmean, group = var3, color = var3)) +
  geom_line(size = 1) +
  geom_point(size = 3) +
  geom_errorbar(aes(ymin = lower.CL, ymax = upper.CL), width = 0.2) +
  theme_minimal() +
  labs(title = "交互作用图（调整后均值 ± 置信区间）",
       x = "因子A (var2)", y = "因变量均值", color = "因子B (var3)")

# 6.2 箱线图（展示原始数据分布）
ggplot(data, aes(x = var2, y = var1, fill = var3)) +
  geom_boxplot(position = position_dodge(0.8), alpha = 0.7) +
  geom_jitter(position = position_jitterdodge(dodge.width = 0.8), alpha = 0.4) +
  theme_minimal() +
  labs(title = "双因素分组箱线图",
       x = "因子A (var2)", y = "因变量", fill = "因子B (var3)")

```