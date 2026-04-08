---
title: Linear Regression
category: concepts
tags: [regression, supervised-learning, linear-models, statistics]
sources: ["Russell & Norvig - AI: A Modern Approach 3rd Edition, Ch 18", "Wikipedia - Linear Regression"]
created: 2026-04-08
updated: 2026-04-08
---

# Linear Regression

**Linear regression** is a fundamental supervised learning algorithm that models the relationship between one or more input variables (features/regressors) and a continuous output variable (target/dependent variable) using a linear function.

## Core Concept

Linear regression assumes the relationship between inputs and outputs can be expressed as:

```
y = w₀ + w₁x₁ + w₂x₂ + ... + wₙxₙ + ε
```

Where:
- **y** = target output (continuous value)
- **x₁, x₂, ..., xₙ** = input features
- **w₀, w₁, ..., wₙ** = weights (parameters to learn)
- **ε** = error/noise

## Simple vs. Multiple Regression

### Simple Linear Regression
One input feature predicting one output:
```
y = w₀ + w₁x + ε
```
**Example**: Predicting house price from square footage

### Multiple Linear Regression
Multiple input features predicting one output:
```
y = w₀ + w₁x₁ + w₂x₂ + ... + wₙxₙ + ε
```
**Example**: Predicting house price from square footage, location, age, etc.

---

## Learning Algorithm

![Linear Regression Least Squares Fit](../images/linear-regression-plot.svg)
*Data points (red dots) with the best-fit line. Green lines show the error (residual) for each point. Linear regression minimizes the sum of squared errors.*

### Objective
Minimize **sum of squared errors** (SSE):
```
Loss = Σᵢ (yᵢ - ŷᵢ)²
```

Where:
- **yᵢ** = actual output for example i
- **ŷᵢ** = predicted output for example i

### Solution Methods

**1. Closed-form (Normal Equation)**
Directly solve for optimal weights in one step:
```
w = (XᵀX)⁻¹Xᵀy
```
- **Advantage**: Exact solution, fast for small datasets
- **Disadvantage**: Computationally expensive for large datasets (matrix inversion O(n³))

**2. Gradient Descent**
Iteratively update weights in direction of steepest loss decrease:
```
w ← w - α∇Loss
```
- **Advantage**: Scales to large datasets, works for non-convex problems
- **Disadvantage**: Requires tuning learning rate α, may converge slowly

---

## Assumptions

Linear regression assumes:

1. **Linearity**: Relationship between inputs and output is linear
2. **Independence**: Observations are independent
3. **Homoscedasticity**: Error variance is constant across all values
4. **Normality**: Errors are normally distributed (for statistical inference)
5. **No multicollinearity**: Input features are not highly correlated

---

## Advantages & Limitations

### ✅ Advantages
- **Simple**: Easy to understand and interpret
- **Fast**: Training is computationally efficient
- **Explainable**: Weights directly show feature importance
- **Foundation**: Building block for more complex models
- **Works well**: For linearly-related features

### ❌ Limitations
- **Limited expressiveness**: Can't model nonlinear relationships
- **Sensitive to outliers**: Large errors have outsized impact (squared loss)
- **Assumes linearity**: May underfit complex patterns
- **Feature engineering**: Often needs manual feature transformations
- **Overfitting**: Requires [[regularization]] with high-dimensional data

---

## Comparison to [[logistic-regression]]

| Aspect | Linear Regression | Logistic Regression |
|--------|-------------------|---------------------|
| **Output** | Continuous (any real value) | Probability (0-1) |
| **Task** | Regression | Classification |
| **Loss function** | Mean squared error | Cross-entropy |
| **Output interpretation** | Predicted value | Probability of class |
| **Example** | Predict house price | Predict spam/not-spam |

---

## Extension: [[neural-networks|Neural Networks]]

Linear regression is limited to linear relationships. [[neural-networks|Neural networks]] overcome this by:
- Stacking multiple layers
- Using nonlinear [[activation-functions|activation functions]]
- Learning hierarchical feature representations

This enables modeling of complex, nonlinear patterns in data.

---

## Practical Use Cases

- **Real estate**: House price prediction from features
- **Finance**: Stock price forecasting
- **Healthcare**: Disease progression prediction
- **Economics**: Trend analysis and forecasting
- **Climate**: Temperature or precipitation modeling
- **Sales**: Revenue prediction from marketing spend

---

## Related Concepts

- [[Machine-Learning]] — Supervised learning paradigm
- [[Logistic-Regression]] — Classification variant
- [[Neural-Networks]] — Nonlinear extension
- [[Regularization]] — Preventing overfitting
- [[Gradient-Descent]] — Optimization method

## References

- Wikipedia: Linear Regression
- Russell & Norvig (2010): Chapter 18 - Machine Learning
