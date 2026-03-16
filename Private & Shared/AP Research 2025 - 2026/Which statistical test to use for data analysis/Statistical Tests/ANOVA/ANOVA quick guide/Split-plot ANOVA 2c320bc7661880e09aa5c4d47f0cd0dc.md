# Split-plot ANOVA

# of predictors: >2
Example Research Question: Does MONTH (Whole Plot) affect MASS, and do different SITEs (Sub-Plot) respond differently? (Often applied in agriculture/ecology)
Factor Type: Mixed (Spatial/Temporal)

[Back to ANOVA](../../ANOVA%202c320bc7661880989015e2e06dd78bf6.md)

# **Goal**

- Used when one factor (Whole-Plot) is difficult to apply to small experimental units, and another factor (Sub-Plot) is easily applied.
- It's mathematically similar to a Mixed ANOVA but often described differently in applied fields like ecology.

# **Design**

- General formula
    - **Y ~ A * B * C + Error(A/B/C)**
- A combination of a Between-Subjects (Whole-Plot) and a Repeated Measures/Within-Subjects (Sub-Plot) factor.
- **Data Structure Needed:** Requires Whole-Plot ID (Between) and Sub-Plot conditions (Within).

# **Example Variables (Hypothetical)**

[swallows-adults.csv](Split-plot%20ANOVA/swallows-adults.csv)

- **DV:** `MASS`
- **Whole-Plot (Between):** `SITE` (The sites are large plots, and a treatment is applied to the whole site).
- **Sub-Plot (Within/Repeated):** `Time` (Measurements are taken repeatedly at different times within the site).