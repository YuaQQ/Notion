# Repeated measures ANOVA with one within-groups factor (W) and one between-groups factor (B)

# of predictors: 2
Example Research Question: Does the change in mass over Time (W) differ between birds from different SITE (B)s?
Factor Type: Mixed (1 W 1 B)

# **Goal**

- Test for the main effect of a time/condition factor (W), the main effect of a group factor (B), and their interaction. This is the **most common complex ANOVA** in biological studies.

# **Design:**

- General Formula
    - **y ~ B * W + Error(Subject/W)**
- 1 Within-Subjects Factor (W) + 1 Between-Subjects Factor (B).
- **Data Structure Needed:** Each bird is measured multiple times (W), and each bird belongs to only one group (B).

# **Example Variables (Hypothetical)**

[swallows-adults.csv](Repeated%20measures%20ANOVA%20with%20one%20within-groups%20fac/swallows-adults.csv)

- **DV:** `MASS`
- **W (Within-Subjects Factor):** `Time` (e.g., Pre-migration vs. Post-migration).
- **B (Between-Subjects Factor):** `SITE` (Each bird belongs to Site 2 **or** Site 4).