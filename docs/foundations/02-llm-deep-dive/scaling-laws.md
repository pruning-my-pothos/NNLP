---
sidebar_label: 'Scaling Laws'
title: 'LLM Scaling Laws'
---

# LLM Scaling Laws

One of the most important discoveries in the development of Large Language Models is the concept of **scaling laws**. In simple terms, scaling laws describe the predictable relationship between a model's performance and the factors used to train it:

1.  **Model Size:** The number of parameters in the model.
2.  **Dataset Size:** The amount of data the model is trained on.
3.  **Compute:** The amount of computational power used for training.

Scaling laws show that as you increase these factors, the model's performance (typically measured by its loss on a test set) improves in a predictable, power-law relationship. This predictability is what has given researchers the confidence to invest in training ever-larger models.

For context, you should be familiar with the concepts of [LLM training and datasets](./training-and-datasets.md).

## The "Chinchilla" Scaling Laws

A landmark 2022 paper from DeepMind, "Training Compute-Optimal Large Language Models," (often referred to as the "Chinchilla" paper) refined the understanding of these scaling laws.

Prior to this paper, the conventional wisdom was to prioritize increasing model size over dataset size. However, the Chinchilla paper demonstrated that for optimal performance at a given compute budget, **model size and dataset size should be scaled in equal proportion.**

### Key Findings:

1.  **Compute-Optimal Training:** For every doubling of model size, the training dataset size should also be doubled.
2.  **Smaller, Better-Trained Models:** The paper introduced "Chinchilla," a 70-billion parameter model trained on 1.4 trillion tokens. Despite being much smaller than other models at the time (like the 175B parameter GPT-3, trained on 300B tokens), Chinchilla outperformed them on a wide range of downstream tasks.
3.  **Rethinking the Budget:** This finding implies that many large models at the time were "over-trained" on too little data for their size. It showed that performance could be improved more efficiently by gathering more data rather than simply adding more parameters.

:::note[What does "Compute-Optimal" mean?]
"Compute-optimal" simply means getting the best possible model performance for a fixed amount of computational budget (and therefore, a fixed financial budget). The Chinchilla paper provided a recipe for how to best allocate that budget between making a model *larger* (more parameters) and training it on *more* data.
:::

### Visualizing the Chinchilla Finding

The chart below illustrates the concept. For a fixed level of compute (the diagonal lines), the lowest loss (best performance) is achieved by a specific combination of model size and data size, not by maximizing one over the other.

```mermaid
xychart-beta
    title "Performance vs. Model and Data Size"
    x-axis "Model Size (Parameters)"
    y-axis "Training Data Size (Tokens)"
    
    line "Iso-loss Curve" [
      [10, 100],
      [20, 50],
      [40, 25],
      [80, 12.5]
    ]

    line "Compute-Optimal Line" [
        [10, 10],
        [80, 80]
    ]

    annotation "Fixed Compute Budget" [
        [10, 100],
        "Lower performance"
    ]
    annotation "Fixed Compute Budget" [
        [40, 25],
        "Optimal point"
    ]
```

## Why Do Scaling Laws Matter?

-   **Predictability and Planning:** Scaling laws allow organizations to forecast the performance of a model before they undertake the expensive process of training it. They can estimate the performance gain they will get from a given increase in budget for compute or data.
-   **Efficiency:** The Chinchilla findings, in particular, provide a "recipe" for training models in a more compute-optimal way, ensuring that resources are not wasted on a mis-proportioned balance of model size and data.
-   **Future of AI:** Scaling laws suggest that performance on many tasks will continue to improve as we are able to scale models, data, and compute even further. While it's an open question if scaling alone is sufficient to reach Artificial General Intelligence (AGI), it has proven to be a remarkably effective path for improving model capabilities so far.

## Next Steps

- **[LLM Training and Datasets](./training-and-datasets.md):** Revisit the concepts of training data and how it's used in the training pipeline.
- **[Model Selection](/docs/01-handbook-method/03-model-selection):** Learn how these theoretical concepts influence the practical decision of which model to choose for your project.
