# SAFE Artificial Intelligence in Finance

Date: 09/13/2025
Field: Economics, Maths
Files & media: ../SAFE_Artificial_Intelligence_in_finance.pdf
Type: Literature

[SAFE Artificial Intelligence in finance.pdf](https://d3n7w3548u188s.cloudfront.net/c2fec3b4-0ed8-41b2-b77c-92d608048c02)

## SAFE AI Framework Overview

The SAFE framework represents a comprehensive approach to evaluating AI trustworthiness in finance through four integrated metrics: **Sustainability**, **Accuracy**, **Fairness**, and **Explainability**. This framework addresses the critical gap in standardized metrics for assessing high-risk AI applications as required by the European AI Act.

**Core Innovation**: All four metrics are unified under the Lorenz Zonoid statistical tool, providing a robust and consistent measurement approach that is resilient to extreme data points and applicable across different response variable types (binary, categorical, continuous).

**Key Advantages**:

- Model-agnostic assessment capability
- Normalized scores for easy interpretation and comparison
- Robust to data variations and extreme observations
- Unified mathematical foundation for all trustworthiness dimensions

## Lorenz Zonoid Mathematical Foundation

The Lorenz Zonoid serves as the mathematical backbone of the SAFE framework, extending the traditional Lorenz curve concept to measure statistical dispersion in terms of mutual variability among observations.

**Mathematical Definition**:

![1757735096138(1).png](SAFE%20Artificial%20Intelligence%20in%20Finance/1757735096138(1).png)

Where:

- r(·) represents rank-scores of the variable
- E(·) is the expected value
- n is the sample size

**Key Properties**:

- **Inclusion Property**:
    
    ![1757735752223.png](SAFE%20Artificial%20Intelligence%20in%20Finance/1757735752223.png)
    
    predicted values' Lorenz Zonoid is contained within the actual response variable's Lorenz Zonoid
    
- **Robustness**: Based on mutual variability rather than variance from mean, making it resilient to extreme observations
- **Universality**: Applicable to any ordered response variable type

## Explainability Measurement

Explainability in the SAFE framework combines Shapley values with Lorenz Zonoids to create 

**Shapley-Lorenz values**, providing normalized and robust measures of variable contribution to predictive accuracy.

**Shapley-Lorenz Formula**:

![1757735861237.png](SAFE%20Artificial%20Intelligence%20in%20Finance/1757735861237.png)

**Explainability Score**:

![1757735910307(1).png](SAFE%20Artificial%20Intelligence%20in%20Finance/1757735910307(1).png)

**Advantages over Standard Shapley Values**:

- Normalized to [0,1] interval for easy interpretation
- Measures contribution to predictive accuracy rather than prediction values
- Robust to extreme observations
- Applicable across different response variable types

## Accuracy Assessment

Accuracy measurement leverages the Lorenz Zonoid's universality to provide a consistent metric across binary, categorical, and continuous response variables, unlike traditional metrics that are response-type specific.

**Accuracy Score Definition**:

![1757735954517(1).png](SAFE%20Artificial%20Intelligence%20in%20Finance/1757735954517(1).png)

Where:

![1758067501234.png](SAFE%20Artificial%20Intelligence%20in%20Finance/1758067501234.png)

is the Lorenz Zonoid of predicted values using k predictors

![1758067563495.png](SAFE%20Artificial%20Intelligence%20in%20Finance/1758067563495.png)

is the Lorenz Zonoid of actual response values in test set

**Model Selection Enhancement**:

- Forward stepwise procedure based on Lorenz Zonoid comparisons
- Statistical significance testing for predictor inclusion
- **Pay-off calculation**:

![1757736215798(1).png](SAFE%20Artificial%20Intelligence%20in%20Finance/1757736215798(1).png)

- Results in parsimonious models with enhanced sustainability

## Fairness Evaluation

Fairness assessment extends the Gini coefficient to measure concentration of explanatory variables' effects across different population groups, identifying potential biases in AI model predictions.

**Methodology**:

1. Calculate Shapley-Lorenz values for each predictor in each population group
2. Create vector 

![1757736276024.png](SAFE%20Artificial%20Intelligence%20in%20Finance/1757736276024.png)

1. Apply Gini coefficient to measure concentration across groups

**Fairness Score**:

![1757735307994(1).png](SAFE%20Artificial%20Intelligence%20in%20Finance/1757735307994(1).png)

**Interpretation**:

- Values close to 1: Fair distribution across population groups
- Values close to 0: Biased effects concentrated in specific groups

![represents the Gini coefficient of Shapley-Lorenz values across populations](SAFE%20Artificial%20Intelligence%20in%20Finance/1757735468533(1).png)

represents the Gini coefficient of Shapley-Lorenz values across populations

## Sustainability Measurement

Sustainability evaluation assesses model robustness against extreme data events and cyber manipulations by analyzing predictive consistency across ordered data subsets.

**Dual Definition of Sustainability**:

1. **Operational**: Ability to maintain consistent output despite extreme data events or cyber manipulations
2. **Environmental**: Minimizing energy consumption and CO2 emissions through model efficiency

**Measurement Process**:

1. Order predictions by accuracy from highest to lowest
2. Divide into G equal-sized groups (e.g., deciles)
3. Calculate Shapley-Lorenz values for each group
4. Apply Gini coefficient to measure concentration

**Sustainability Score**:

![1757735681068.png](SAFE%20Artificial%20Intelligence%20in%20Finance/1757735681068.png)

**Benefits**:

- Identifies model vulnerability to data manipulation
- Promotes selection of parsimonious, more stable models
- Supports both operational and environmental sustainability goals

## Bitcoin Price Prediction Case Study

The SAFE framework was applied to cryptocurrency time series data (May 2016 - April 2018) to demonstrate practical implementation and compare with traditional metrics.

**Dataset Characteristics**:

- **Response Variable**: Bitcoin prices (continuous and binary classifications)
- **Explanatory Variables**: Oil prices, Gold prices, SP500 index, EUR/USD exchange rate
- **Time Period**: 735 daily observations
- **Model Types**: Random Forest, Neural Networks, Linear Regression

**Key Findings**:

- SAFE metrics provided more interpretable and comparable results across different response types
- Lorenz Zonoid-based measures showed greater robustness to data variations
- Framework successfully identified optimal predictor subsets for enhanced sustainability
- Direct comparison possible between binary and continuous cases (unlike RMSE/AUROC)

### Comparative Analysis Results

**SAFE vs Traditional Metrics Performance**:

| Metric Type | SAFE Framework | Traditional Metrics |
| --- | --- | --- |
| **Universality** | Single approach for all response types | Response-specific (RMSE, AUROC) |
| **Normalization** | All scores in [0,1] range | Different scales, difficult comparison |
| **Robustness** | Resilient to extreme observations | Sensitive to outliers |
| **Interpretability** | Unified interpretation across metrics | Metric-specific interpretation |

**Empirical Observations**:

- Gini coefficient values showed consistency across binary and continuous response cases
- SAFE metrics enabled direct comparison of model performance regardless of response variable type
- Traditional metrics (RMSE, AUROC) provided limited comparability due to scale differences
- Lorenz Zonoid approach demonstrated superior stability under data perturbations

## Regulatory Compliance and Implementation

The SAFE framework directly addresses European AI Act requirements for high-risk AI applications, providing standardized metrics for regulatory compliance and risk monitoring.

**AI Act Alignment**:

- **High-Risk Applications**: Financial AI systems requiring trustworthiness assessment
- **Mandatory Requirements**: Sustainability, accuracy, fairness, explainability metrics
- **Risk-Based Approach**: Quantitative measures for different risk categories
- **Continuous Monitoring**: Time-series assessment capabilities

**Implementation Benefits**:

- **Asset Management Companies**: Portfolio optimization and risk assessment
- **Financial Authorities**: Regulatory oversight and compliance monitoring
- **Researchers**: Standardized evaluation framework for AI model comparison
- **Risk Managers**: Comprehensive trustworthiness assessment tools

**Practical Applications**:

- Credit lending decision validation
- Algorithmic trading system evaluation
- Robo-advisor performance assessment
- Fraud detection system monitoring

## Future Research Directions and Limitations

While the SAFE framework provides a comprehensive approach to AI trustworthiness assessment, several areas warrant further investigation and development.

**Research Opportunities**:

- **Temporal Dynamics**: Extending metrics to capture time-varying trustworthiness patterns
- **Multi-Modal Applications**: Adapting framework for diverse AI applications beyond finance
- **Computational Efficiency**: Optimizing Shapley-Lorenz calculations for large-scale implementations
- **Threshold Determination**: Establishing industry-specific benchmarks for acceptable SAFE scores

**Current Limitations**:

- Computational complexity increases with number of predictors in Shapley-Lorenz calculations
- Framework requires sufficient data for robust Lorenz Zonoid estimation
- Limited empirical validation across diverse financial AI applications
- Need for standardized implementation protocols across institutions

**Integration Challenges**:

- Harmonization with existing risk management frameworks
- Training requirements for practitioners
- Regulatory acceptance and standardization processes

Generated by [Ponder](https://ponder.ing/)