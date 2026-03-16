# One-way ANCOVA with one covariate

y ~ x + A

```r
# ====================== 1. 安装并加载必要的包 ======================
# 若未安装，请先运行：install.packages(c("tidyverse", "car", "emmeans", "ggplot2", "ggpubr", "rstatix"))
library(tidyverse)   # 数据处理和绘图
library(car)         # 方差齐性检验（LeveneTest）、线性假设检验（linearHypothesis）
library(emmeans)     # 计算调整后均值及多重比较
library(ggplot2)     # 绘图
library(ggpubr)      # 辅助添加统计标记
library(rstatix)     # 提供简便的统计检验函数（可选）

# ====================== 2. 准备数据 ======================
# 假设数据框名为 data，其中：
#   var1 : 数值型因变量
#   var2 : 因子型自变量（分组变量，例如处理组）
#   cvar1: 数值型协变量
# 确保 var2 是因子类型
data <- data %>%
  mutate(var2 = as.factor(var2))

# 查看数据结构
glimpse(data)

# 描述性统计（分组展示协变量和因变量的均值、标准差等）
data %>%
  group_by(var2) %>%
  summarise(across(c(var1, cvar1), list(mean = mean, sd = sd), .names = "{.col}_{.fn}"))

# ====================== 3. 检验 ANCOVA 的假设 ======================
# 假设1：协变量与因变量线性关系（通过绘制散点图初步判断）
ggplot(data, aes(x = cvar1, y = var1, color = var2)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  theme_minimal() +
  labs(title = "各组的线性关系")

# 假设2：斜率齐性（即处理组与协变量无交互作用）
# 拟合包含交互项的模型：var1 ~ var2 * cvar1
slope_test <- aov(var1 ~ var2 * cvar1, data = data)
summary(slope_test)
# 查看交互项（var2:cvar1）的 p 值，若 p > 0.05，则满足斜率齐性假设

# 也可用 Anova() 函数（car包）获得类型III平方和检验
# Anova(slope_test, type = 3)

# 假设3：残差正态性（在拟合最终模型后进行，但这里可先预检验）
# 我们将在拟合最终模型后执行

# 假设4：方差齐性（Levene检验，基于模型残差）
# 先拟合不含交互项的模型（假设斜率齐性成立）
model_ancova <- aov(var1 ~ var2 + cvar1, data = data)
leveneTest(residuals(model_ancova) ~ data$var2)   # 检验不同组间残差方差是否相等
# 或直接使用 car::leveneTest(var1 ~ var2, data = data) 但更推荐基于残差

# ====================== 4. 拟合 ANCOVA 模型 ======================
# 如果斜率齐性成立，则拟合主效应模型
model_ancova <- aov(var1 ~ var2 + cvar1, data = data)

# 查看传统的 ANOVA 表（类型I平方和）
summary(model_ancova)

# 更推荐使用类型III平方和（当各组样本量不等时）
# 需要设置对比为 contr.sum 或 contr.treatment，并配合 Anova() 使用
options(contrasts = c("contr.sum", "contr.poly"))  # 设置正交对比
model_ancova_III <- aov(var1 ~ var2 + cvar1, data = data)
car::Anova(model_ancova_III, type = 3)

# ====================== 5. 检验残差正态性 ======================
shapiro.test(residuals(model_ancova))
# p > 0.05 满足正态性

# 绘制残差诊断图
par(mfrow = c(2, 2))
plot(model_ancova)
par(mfrow = c(1, 1))

# ====================== 6. 事后比较（调整后均值） ======================
# 如果分组变量 var2 的主效应显著（p < 0.05），则进行多重比较
# 计算调整后均值（最小二乘均值，即 marginal means）
emmeans_result <- emmeans(model_ancova, specs = ~ var2)

# 显示调整后均值及置信区间
summary(emmeans_result)

# 两两比较（默认 Tukey 法调整 p 值）
pairs_result <- pairs(emmeans_result, adjust = "tukey")
summary(pairs_result)

# 也可以使用 glht 进行更灵活的比较（需加载 multcomp 包）
# library(multcomp)
# glht_result <- glht(model_ancova, linfct = mcp(var2 = "Tukey"))
# summary(glht_result)

# ====================== 7. 可视化 ======================
# 7.1 绘制散点图 + 组回归线（展示协变量调整效果）
ggplot(data, aes(x = cvar1, y = var1, color = var2)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE) +
  theme_minimal() +
  labs(title = "各组的线性回归线（未调整）")

# 7.2 绘制调整后均值的条形图（带误差线）
emmeans_df <- as.data.frame(emmeans_result)
ggplot(emmeans_df, aes(x = var2, y = emmean, fill = var2)) +
  geom_col(position = position_dodge(), alpha = 0.7) +
  geom_errorbar(aes(ymin = lower.CL, ymax = upper.CL), width = 0.2, position = position_dodge(0.9)) +
  theme_minimal() +
  labs(title = "调整后均值（控制协变量）",
       x = "分组变量", y = "调整后因变量均值")

# 7.3 或绘制箱线图叠加调整后均值（可选）
# 先计算调整后均值的预测值，将协变量固定在整体均值
data_pred <- data %>%
  mutate(cvar1_mean = mean(cvar1, na.rm = TRUE)) %>%
  mutate(pred = predict(model_ancova, newdata = data.frame(var2 = var2, cvar1 = cvar1_mean)))
# 然后可绘制原始数据与预测值对比的图
```