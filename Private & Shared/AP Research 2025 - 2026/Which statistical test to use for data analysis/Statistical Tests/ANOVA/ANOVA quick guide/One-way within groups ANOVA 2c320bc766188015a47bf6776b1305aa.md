# One-way within groups ANOVA

# of predictors: 1
Example Research Question: Does swallow mass change significantly across Time (e.g., baseline, 1 month, 2 months)?
Factor Type: Within-Subjects

# **Goal**

- Test if a single factor causes a change over time or condition *within the same subject*.

# **Design**

- General formula
    - **y ~ Error(Subject/A)**
- One IV with multiple levels (Time or Condition)
- **Data Structure Needed:** The same **Individual Bird ID** appears multiple times, once for each level of the IV.

# **Example Variables (Hypothetical)**

[swallows-adults.csv](One-way%20within%20groups%20ANOVA/swallows-adults.csv)

- **DV:** `MASS`
- **IV (Within-Subjects):** `Time` (e.g., Measurement at Day 1, Day 7, Day 14).