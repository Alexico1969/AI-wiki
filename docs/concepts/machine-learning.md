---
title: Machine Learning
category: concepts
tags: [learning, induction, supervised, unsupervised, reinforcement]
sources: ["Russell & Norvig - AI: A Modern Approach 3rd Edition, Ch 18"]
created: 2026-04-07
updated: 2026-04-07
---

# Machine Learning

**Machine Learning** is the field of enabling computer systems to learn and improve from experience without being explicitly programmed. It's the key to building flexible, adaptive intelligent agents.

## Learning Problem Definition

A learning agent improves its performance based on:
- **Experience**: Examples from training data
- **Performance metric**: How well it achieves the task
- **Task**: What the agent is trying to learn

**General framework:**
- Collect training examples: (input, output) pairs
- Choose a [hypothesis space](hypothesis-space.md) (possible functions)
- Use a [learning-algorithm](learning-algorithm.md) to find best hypothesis
- Test on new data (generalization)

## Learning Paradigms

![Confusion Matrix for Classification](../images/confusion-matrix.svg)
*Confusion matrix showing true positives, false positives, true negatives, and false negatives. Used to evaluate classification model performance.*

### Supervised Learning
Learn function from labeled examples (input → output)
- **Regression**: Continuous output (price, temperature)
- **Classification**: Discrete output (category, yes/no)
- Requires labeled training data
- Examples: [neural-networks](neural-networks.md), decision trees, SVM

### Unsupervised Learning
Find patterns in unlabeled data
- **Clustering**: Group similar examples
- **Dimensionality reduction**: Find lower-dimensional structure
- No target output specified
- Examples: k-means, principal component analysis

### Reinforcement Learning
Learn via interaction and reward/punishment
- Agent takes actions, receives rewards/penalties
- Goal: maximize long-term cumulative reward
- No labeled target outputs
- Examples: Q-learning, policy gradient methods

### Semi-supervised Learning
Combination of labeled and unlabeled data
- Use small labeled set + large unlabeled set
- Often more practical than pure supervised

## Key Concepts

### Bias-Variance Tradeoff
- **Bias**: Error from oversimplified model (underfitting)
- **Variance**: Error from model sensitivity to training data (overfitting)
- **Tradeoff**: Increase complexity → decrease bias, increase variance
- **Regularization**: Add penalty term to prevent overfitting

### Generalization
- Learning system must generalize to new, unseen data
- Training error ≠ test error
- Cross-validation: Estimate test error using multiple train/test splits

### Hypothesis Space
- Set of possible functions the learner can express
- Small space: Can't learn complex concepts
- Large space: Risk overfitting, harder to search
- **Inductive bias**: Preference for simpler hypotheses ([Occam's-Razor](occam's-razor.md))

### Sample Complexity
How many examples needed to learn well?
- Depends on: task complexity, hypothesis space size, desired accuracy
- [VC-Dimension](vc-dimension.md): Measure of hypothesis space complexity

## Learning Algorithms

### Passive Learning
Learn model from data, then use it (no exploration)
- Examples: Decision trees, [neural-networks](neural-networks.md), Bayesian learning

### Active Learning
Learner chooses which examples to learn from
- Often more efficient (fewer examples needed)
- Examples: Uncertainty sampling, query by committee

### Online Learning
Learn continuously as new data arrives
- Single pass through data
- Update incrementally
- Examples: [perceptron](perceptron.md), [gradient-descent](gradient-descent.md) variants

### Batch Learning
Collect all data first, then learn
- Can optimize globally
- Requires storing all data

## Performance Evaluation

### Metrics
- **Accuracy**: Fraction of correct predictions (classification)
- **Precision/Recall**: For imbalanced classes
- **Mean squared error**: Average squared difference (regression)
- **F1 score**: Harmonic mean of precision and recall

### Validation Strategies
- **Train/test split**: Use 70/30 or 80/20 split
- **K-fold cross-validation**: Split into k parts, test on each
- **Leave-one-out**: Extreme case: test each single example

## Related Concepts

- [Neural-Networks](neural-networks.md) — Nonlinear model learned via backpropagation
- [Decision-Trees](decision-trees.md) — Interpretable tree-based models
- [Gradient-Descent](gradient-descent.md) — General optimization method
- [Reinforcement-Learning](reinforcement-learning.md) — Learning via rewards
- [Bayesian-Learning](bayesian-learning.md) — Probabilistic approach to learning

## References

Russell & Norvig (2010): Chapter 18 - Learning from Examples
