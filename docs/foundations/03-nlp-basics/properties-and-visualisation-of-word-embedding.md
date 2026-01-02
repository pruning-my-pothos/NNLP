---
title: "Properties and Visualisation of Word Embeddings"
description: "Delve into the inherent properties of word embeddings and explore techniques to visualize these high-dimensional representations, revealing semantic and syntactic relationships."
sidebar_position: 5
---

# Properties and Visualisation of Word Embeddings

:::info[From Representation to Reasoning]
The properties discussed here are not just interesting side effects; they are the very foundation of how LLMs appear to "reason." When a model can represent abstract relationships (like gender, tense, or nationality) as simple math, it gains a powerful and scalable way to process and generate language. Visualizing these relationships helps us peek inside the model's "mind."
:::

Word embeddings are powerful numerical representations that encode a wealth of linguistic information. Understanding their properties and how to visualize them can provide profound insights into how machines "understand" language, which is crucial for working with Generative AI and Large Language Models (LLMs).

## Inherent Properties of Word Embeddings

Beyond simply representing words as vectors, embeddings exhibit fascinating properties:

### 1. Semantic Similarity

*   **Description**: Words with similar meanings are located close to each other in the embedding space. The "distance" (e.g., cosine similarity) between two word vectors correlates with their semantic relatedness.
*   **Actionable Insight**: This property is fundamental for tasks like synonym detection, recommendation systems, and query expansion in search engines. LLMs leverage this to understand the nuanced meaning of words and phrases.
    *   **Example**: The vector for "cat" will be closer to "kitten" and "feline" than to "car" or "house."

### 2. Semantic Analogy (Vector Arithmetic)

*   **Description**: Embeddings can capture relational similarities, allowing for vector arithmetic to solve analogies. The most famous example is: `vector("king") - vector("man") + vector("woman") ≈ vector("queen")`. This implies that the vector difference between "king" and "man" is similar to the difference between "queen" and "woman," representing the "gender" dimension.
*   **Actionable Insight**: This property demonstrates the embeddings' ability to encode complex, multi-dimensional relationships (e.g., gender, country-capital, verb tense). It's a key reason why LLMs can reason about language relations.

    :::info[A Glimpse of True Reasoning]
    The ability to perform vector arithmetic that reflects real-world analogies is arguably one of the most profound discoveries in NLP. It's a primitive form of reasoning that allows models to generalize from learned examples to new ones. When an LLM correctly answers "What is the capital of France?", it's leveraging a learned relationship vector similar to `vector(Germany) - vector(Berlin) + vector(France)`.
    :::

    *   **Visual Suggestion**:
        ```mermaid
        graph TD
            subgraph Embedding Space
                M(Man)
                W(Woman)
                K(King)
                Q(Queen)
                M --> MW[Man to Woman]
                K --> KQ[King to Queen]
                MW -- parallel --> KQ
            end
        ```
        A 2D plot showing vectors for man, woman, king, queen, with arrows illustrating the parallel "gender" vector.

### 3. Syntactic Regularity

*   **Description**: Embeddings also capture syntactic relationships. Words that share grammatical roles often cluster together or exhibit similar vector differences.
*   **Example**: `vector("walking") - vector("walk") + vector("swimming") ≈ vector("swim")` (verb tense).

### 4. Dimensionality and Density

*   **Description**: Embeddings convert sparse, high-dimensional one-hot vectors into dense, lower-dimensional continuous vectors. Typical dimensions range from 50 to 300 for traditional word embeddings.
*   **Why it matters**: Reduced dimensionality makes computations more efficient and helps generalize relationships better, as each dimension can represent a latent semantic feature.

## Visualisation Techniques for Word Embeddings

:::tip[What to Look For]
When you see these visualizations, don't just look at the pretty colors. The goal is to find evidence of the properties we've discussed:
*   **Clusters**: Look for groups of related words (e.g., fruits, animals, verbs).
*   **Relationships**: See if you can spot geometric patterns, like parallel lines connecting countries to their capitals, or similar directions for gender or verb tense transformations.
These patterns are visual proof that the model has learned meaningful linguistic structures.
:::

Visualizing high-dimensional data is challenging, but techniques exist to project embeddings into 2D or 3D space while preserving as much of their original structure as possible. This helps humans understand the relationships learned by the model.

### 1. t-SNE (t-Distributed Stochastic Neighbor Embedding)

*   **Description**: A non-linear dimensionality reduction technique particularly well-suited for visualizing high-dimensional datasets. It aims to find a low-dimensional representation of the data such that the pairwise similarities between points are retained.
*   **Actionable Insight**: Excellent for revealing clusters of semantically related words.
    *   **Conceptual Plot**: A scatter plot where clusters of words like (apple, orange, banana) are seen together, and (king, queen, prince) form another cluster, with distances reflecting similarity.

### 2. PCA (Principal Component Analysis)

*   **Description**: A linear dimensionality reduction technique that transforms data to a new coordinate system such that the greatest variance by any projection comes to lie on the first coordinate (called the first principal component), the second greatest variance on the second coordinate, and so on.
*   **Actionable Insight**: Useful for identifying the most dominant dimensions of variation in the embedding space, but might not capture complex non-linear semantic relationships as well as t-SNE.

### 3. Plotting Specific Analogies

*   **Description**: By selecting a few words that form a known analogy (e.g., man, woman, king, queen) and plotting their vectors (after PCA/t-SNE reduction), one can visually confirm the vector arithmetic property.
*   **Actionable Insight**: A compelling way to demonstrate the "reasoning" capability embedded within these numerical representations.

### Code Example (Toy, but Deterministic)

```python
import numpy as np
import matplotlib.pyplot as plt

# Simple, hand-crafted 2D vectors to illustrate clustering
word_vectors = {
    "king":   np.array([1.0, 1.2]),
    "queen":  np.array([1.1, 1.1]),
    "man":    np.array([0.9, 0.8]),
    "woman":  np.array([1.0, 0.9]),
    "apple":  np.array([-1.0, 1.0]),
    "orange": np.array([-1.1, 0.9]),
    "banana": np.array([-0.9, 1.1]),
    "car":    np.array([0.5, -1.0]),
    "truck":  np.array([0.6, -1.1]),
    "bicycle":np.array([0.4, -0.9]),
}

words = list(word_vectors.keys())
vectors = np.stack(list(word_vectors.values()))

plt.figure(figsize=(8, 6))
for i, word in enumerate(words):
    x, y = vectors[i]
    plt.scatter(x, y, color="steelblue")
    plt.annotate(word, (x, y), textcoords="offset points", xytext=(5,5))

plt.axhline(0, color="gray", linewidth=0.5)
plt.axvline(0, color="gray", linewidth=0.5)
plt.title("Toy 2D Embedding (clusters: royalty, fruit, vehicles)")
plt.xlabel("dim 1")
plt.ylabel("dim 2")
plt.grid(True, linestyle="--", alpha=0.4)
plt.tight_layout()
plt.show()
```

## Significance for Generative AI and LLMs

The properties encoded within word embeddings are fundamental to the "understanding" capabilities of LLMs. By providing a rich, semantically aware input to Transformer networks, embeddings allow LLMs to:
*   Identify relationships between words and sentences.
*   Maintain coherence and context over long sequences.
*   Perform sophisticated tasks like question answering, summarization, and creative text generation, all built upon this numerical foundation of meaning.

## Next Steps

Understand how these individual word vectors combine to form an entire [Embedding Matrix](./embedding-matrix.md), which is the complete lookup table for an LLM's vocabulary.
