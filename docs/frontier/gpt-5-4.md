---
title: OpenAI GPT-5.4 Family
category: frontier
tags: [gpt-5, openai, flagship, agentic, coding]
sources: ["OpenAI API Documentation", "OpenAI Blog"]
created: 2026-04-08
updated: 2026-04-08
---

# OpenAI GPT-5.4 Family

The GPT-5.4 family represents OpenAI's production standard as of April 2026, featuring **integrated coding capabilities**, **agentic reasoning**, and a suite of **specialized variants** for different use cases.

---

## Overview

GPT-5.4 marks a departure from the traditional single-model approach. Instead of one flagship, OpenAI now offers **five distinct variants** released across March 2026, each optimized for specific workloads.

**Release Date**: March 5-17, 2026  
**Status**: Active (in production)  
**Pricing Tier**: Premium ($2.50/M input, $15.00/M output for Standard)

---

## Core Innovation: Integrated Coding

**Previous approach**: Specialized "Codex" model for code tasks  
**GPT-5.4 approach**: Native code understanding integrated into all variants

This means:
- ✅ All GPT-5.4 models understand code natively (no separate model needed)
- ✅ Better code-language interleaving
- ✅ Unified API for mixed tasks (code + natural language)
- ✅ Agentic capabilities now default, not specialized

---

## Model Variants

### 1. GPT-5.4 Standard
**Primary use case**: General-purpose, default choice

- **Release**: March 5, 2026
- **Status**: Active
- **Capabilities**: Balanced reasoning, coding, analysis
- **Key benchmark**: OSWorld 75% (computer use)
- **Context window**: ~128K tokens
- **Pricing**: $2.50/M input, $15.00/M output
- **Speed**: Fast inference
- **Use when**:
  - General-purpose applications
  - Mixed reasoning + coding tasks
  - When you need agentic capabilities (web/desktop automation)
  - Default choice unless other variants fit better

**Recommendation**: Start here unless cost or speed is critical.

---

### 2. GPT-5.4 Thinking
**Primary use case**: Deep reasoning, complex analysis

- **Release**: March 5, 2026
- **Status**: Active
- **Capabilities**: Extended reasoning, problem-solving
- **Approach**: "Thinking" variant (reasons internally before outputting)
- **Latency**: Slower (reasoning overhead)
- **Pricing**: Higher than Standard
- **Best for**:
  - Complex mathematical problems
  - Long-form reasoning
  - Multi-step problem solving
  - Research and analysis
  - When accuracy > speed

**Example use cases**:
- Theorem proving
- Complex algorithm design
- Deep code review
- Scientific reasoning

---

### 3. GPT-5.4 Mini
**Primary use case**: Cost-optimized, high-volume tasks

- **Release**: March 17, 2026
- **Status**: Active
- **Capability claim**: 95% of Standard model at 17% of cost
- **SWE-bench Pro**: 54.38% (vs Standard 57.7%)
- **Pricing**: ~$0.15/M input, ~$0.60/M output (6x cheaper)
- **Context window**: ~64K tokens
- **Speed**: Very fast
- **Use when**:
  - Cost is critical (high-volume applications)
  - Simple/moderate complexity tasks
  - Real-time requirements
  - Prototyping and testing
  - Running on consumer hardware

**Cost-benefit**: Trade 5% capability loss for 85% cost savings. Excellent value.

**Example workloads**:
- Content generation at scale
- Classification and tagging
- Simple Q&A and customer support
- High-frequency API calls

---

### 4. GPT-5.4 Nano
**Primary use case**: Edge/embedded devices, extreme constraints

- **Release**: March 17, 2026
- **Status**: Active
- **Target**: Mobile, IoT, embedded systems
- **Parameter efficiency**: Heavily quantized
- **Context window**: ~16K tokens
- **Speed**: Real-time on edge devices
- **Use when**:
  - Running on smartphones/tablets
  - Embedded IoT devices
  - Offline-first applications
  - Ultra-low latency required
  - Network bandwidth is expensive

**Deployment scenarios**:
- Mobile app assistants
- In-car AI systems
- Home automation
- Field devices (no cloud access)

---

### 5. GPT-5.4 Spark
**Primary use case**: Real-time streaming applications

- **Release**: Q1 2026 (March 2026)
- **Status**: Active
- **Feature**: Streaming/real-time output
- **Latency**: Optimized for continuous generation
- **Use case**: Live transcription, real-time chat, streaming analytics
- **Output format**: Token-by-token streaming
- **Use when**:
  - Live streaming applications
  - Real-time chat interfaces
  - Continuous monitoring/analysis
  - Video/audio processing streams

---

## Performance Benchmarks

### Agentic Capabilities (Computer Use)

| Variant | OSWorld Score | Notes |
|---------|---------------|-------|
| Standard | 75% | Near-human desktop/web navigation |
| Thinking | 78% | Better reasoning for complex tasks |
| Mini | 62% | 82% of Standard, 6x cheaper |
| Nano | 48% | Basic automation only |
| Spark | 75% | Stream-optimized, same reasoning |

**OSWorld**: Tests ability to use desktop/browser autonomously (click, type, navigate)

### Code Performance (SWE-bench Pro)

| Variant | Score | Rationale |
|---------|-------|-----------|
| Standard | 57.7% | Full coding capability |
| Thinking | 62% | Better reasoning helps code |
| Mini | 54.38% | 94% of Standard, compelling value |
| Nano | 38% | Basic code only |

---

## API Pricing

### Per-Million-Token Pricing

| Variant | Input | Output | Monthly (1M queries) |
|---------|-------|--------|----------------------|
| **Standard** | $2.50 | $15.00 | ~$2,000-5,000 |
| **Thinking** | $5.00 | $30.00 | ~$4,000-10,000 |
| **Mini** | $0.15 | $0.60 | ~$120-300 |
| **Nano** | $0.02 | $0.08 | ~$16-40 |
| **Spark** | $2.50 | $15.00 | ~$2,000-5,000 |

**Cost optimization tip**: Use Mini + Standard hybrid approach
- 80% of queries via Mini (cheap)
- 20% of complex queries via Standard
- Saves ~60% vs all-Standard

---

## Architecture & Capabilities

### Core Features
- **Modalities**: Text + code (native integration)
- **Context**: 128K tokens (Standard/Thinking/Spark)
- **Multimodal**: No (text/code only)
- **Thinking model**: Yes (separate Thinking variant)
- **Streaming**: Yes (Spark optimized, others support)
- **Vision**: No

### Agentic Capabilities (NEW)
- **Desktop automation**: Click, type, navigate
- **Web automation**: Fill forms, scrape, interact
- **OSWorld score**: 75% (near-human reliability)
- **Use cases**:
  - Autonomous data entry
  - Web scraping
  - Testing automation
  - RPA (Robotic Process Automation)

### Coding Integration (NEW)
- **Native understanding**: No separate Codex model
- **Code generation**: High quality
- **Code analysis**: Strong reasoning
- **Debugging**: Good error identification
- **Architecture design**: Solid recommendations

---

## Decision Tree

```
Do you need reasoning/thinking?
  ├─ Yes → GPT-5.4 Thinking
  └─ No
      ├─ Is cost critical?
      │   ├─ Yes, volume high → GPT-5.4 Mini
      │   └─ No → GPT-5.4 Standard
      │
      ├─ Is this for mobile/edge?
      │   ├─ Yes → GPT-5.4 Nano
      │   └─ No
      │
      └─ Do you need real-time streaming?
          ├─ Yes → GPT-5.4 Spark
          └─ No → GPT-5.4 Standard (default)
```

---

## Comparison to Previous Versions

### vs GPT-5.2 (Retiring June 5, 2026)
- ✅ Better agentic capabilities (OSWorld: 75% vs 68%)
- ✅ Integrated coding (no Codex needed)
- ✅ Better reasoning in Thinking variant
- ✅ More efficient Mini variant
- ✅ Streaming optimized (Spark)
- 💾 Similar context window (128K)
- 💵 Higher cost for Standard tier

**Migration**: Begin moving to GPT-5.4 now (retiring June 5, 2026)

---

## When NOT to Use GPT-5.4

- ❌ Need multimodal (image/audio/video) → Use Gemini 3.1
- ❌ Need open-source / on-prem → Use Llama 4
- ❌ Need longest context (1M+ tokens) → Use Gemini 3.1 or Llama 4 Maverick
- ❌ Need to avoid proprietary APIs → Use Meta Llama 4

---

## API Integration Example

```python
from openai import OpenAI

client = OpenAI(api_key="your-key")

# Standard model (default)
response = client.chat.completions.create(
    model="gpt-5.4",
    messages=[{"role": "user", "content": "Hello"}]
)

# Thinking variant (reasoning)
response = client.chat.completions.create(
    model="gpt-5.4-thinking",
    messages=[{"role": "user", "content": "Solve: 2x + 5 = 17"}]
)

# Mini variant (cost-optimized)
response = client.chat.completions.create(
    model="gpt-5.4-mini",
    messages=[{"role": "user", "content": "Summarize this..."}]
)

# Streaming (Spark)
stream = client.chat.completions.create(
    model="gpt-5.4-spark",
    messages=[{"role": "user", "content": "Write a poem"}],
    stream=True
)
```

---

## Summary

| Use Case | Best Variant | Why |
|----------|--------------|-----|
| General purpose | Standard | Balanced, reliable |
| Deep reasoning | Thinking | Extended deliberation |
| High volume | Mini | 6x cheaper, 95% capable |
| Edge devices | Nano | Runs locally |
| Real-time | Spark | Stream-optimized |
| Agentic/RPA | Standard | 75% OSWorld |
| Budget projects | Mini + Standard | Hybrid approach |

---

## Last Updated
April 8, 2026

## Related
- [Model Comparison](model-comparison.md)
- [Release Timeline](timeline.md)
- [Gemini 3.1 Pro](gemini-3-1.md)
- [Claude 4.6](claude-4-6.md)
