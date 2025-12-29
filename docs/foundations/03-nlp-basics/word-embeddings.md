---
title: "Word Embeddings"
description: "Understand the concept of Word Embeddings, how they capture semantic relationships, and why they are fundamental for modern Natural Language Processing (NLP) and Large Language Models (LLMs)."
sidebar_position: 4
---

# Word Embeddings

:::info[The Building Blocks of Meaning]
Think of word embeddings as the foundational vocabulary for an LLM. Before a model can understand sentences, paragraphs, or complex ideas, it must first translate individual words into a meaningful mathematical form. Word embeddings are this form, converting abstract language into a structure that a machine can process and learn from.
:::

At the heart of modern Natural Language Processing (NLP) and the impressive capabilities of Large Language Models (LLMs) lies the concept of **Word Embeddings**. These are dense vector representations of words that capture their semantic meaning and relationships within a multi-dimensional space.

## The Need for Word Embeddings

Traditional NLP techniques, such as one-hot encoding or Bag-of-Words, represent words as discrete, independent units. This approach has significant limitations:

*   **High-dimensionality**: A vocabulary of 100,000 words leads to 100,000-dimensional vectors, most of which are zeros.
*   **No semantic relationship**: "King" and "Queen" are as different as "King" and "Banana" because there's no inherent similarity encoded in their representations.
*   **Context blindness**: The same word always has the same representation, regardless of its context.

Word embeddings solve these problems by representing words as continuous vectors in a lower-dimensional space (e.g., 50 to 300 dimensions), where words with similar meanings are located closer together.

## How Word Embeddings Work (Conceptually)

:::tip[An Intuitive Analogy]
The distributional hypothesis can be summed up with the simple phrase: "You shall know a word by the company it keeps." Just as you can infer a lot about a person by their friends, a model can infer the meaning of a word by the other words that consistently appear around it.
:::

The core idea behind word embeddings is the **distributional hypothesis**: words that appear in similar contexts tend to have similar meanings. Embedding models learn these relationships by analyzing vast amounts of text data.

Imagine a model processing sentences like:
*   "The **king** ruled his **kingdom**."
*   "The **queen** ruled her **queendom**."
*   "The **prince** ruled his **principality**."

By observing that "king," "queen," and "prince" often appear in similar grammatical structures and contexts (e.g., subjects of "ruled," followed by a possessive pronoun and a type of domain), the model learns to place their vectors in proximity within the embedding space.

## Popular Word Embedding Models

Several models have been developed to learn word embeddings, each with its own approach:

1: **Word2Vec (Mikolov et al., 2013)**
*   **Description**: One of the most influential models. It uses a shallow neural network to learn word associations from a large corpus of text.
*   **Two Architectures**:
    *   **Skip-gram**: Predicts context words from a target word.
    *   **CBOW (Continuous Bag-of-Words)**: Predicts a target word from its context words.
*   **Actionable Insight**: This property demonstrates the embeddings' ability to encode complex, multi-dimensional relationships (e.g., gender, country-capital, verb tense). It's a key reason why LLMs can reason about language relations.

    :::info[The Famous Analogy: `vector(King) - vector(Man) + vector(Woman) ≈ vector(Queen)`]
    This famous example from the Word2Vec paper is the quintessential demonstration of embedding power. It shows that the model has learned a "gender" vector that is parallel between the `Man -> Woman` and `King -> Queen` relationships. By performing simple vector arithmetic, we can traverse these learned semantic pathways. This ability to represent abstract relationships as mathematical operations is a cornerstone of modern NLP.
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

2: **GloVe (Global Vectors for Word Representation) (Pennington et al., 2014)**
*   **Description**: Combines the advantages of global matrix factorization and local context window methods. It's trained on global word-word co-occurrence statistics from a corpus.
*   **Actionable Insight**: GloVe often produces embeddings that capture semantic relationships well and are widely used due to their balance of performance and efficiency.

3: **FastText (Bojanowski et al., 2017)**
*   **Description**: An extension of Word2Vec that considers subword information (character n-grams). This means it can generate embeddings for out-of-vocabulary words and handle morphologically rich languages more effectively.
*   **Actionable Insight**: Particularly useful when dealing with rare words or languages with complex word structures, as it can still derive meaning from subword units.

## Properties of Word Embeddings

*   **Dimensionality Reduction**: Maps high-dimensional sparse vectors to low-dimensional dense vectors.
*   **Semantic Similarity**: Words with similar meanings are close in vector space.
*   **Syntactic Similarity**: Words used in similar grammatical roles also tend to be close.
*   **Contextualization (Limited)**: While standard embeddings provide a single vector per word, more advanced (contextual) embeddings (like ELMo, BERT) assign different vectors based on the word's context in a sentence.

    :::caution The "One Word, One Vector" Limitation
    A key drawback of classic embeddings like Word2Vec and GloVe is that they generate a single, static vector for each word. This means the word "bank" has the exact same vector in "river bank" and "investment bank." This limitation was the primary motivation for developing the next generation of **contextual embeddings** (from models like BERT), which generate different vectors for a word depending on the sentence it's in.
    :::

## Visualizing Embeddings

While high-dimensional vectors are hard to visualize directly, dimensionality reduction techniques like t-SNE or PCA can project them into 2D or 3D, revealing clusters of related words. This visually demonstrates the semantic relationships captured by embeddings. (This will be explored further in the next section).

## Relevance to LLMs

Word embeddings are the initial layer of understanding for most LLMs. Transformers take these numerical representations as input, and through self-attention, learn even more sophisticated contextual embeddings for each word in a sentence. The quality of these initial embeddings directly impacts the LLM's ability to grasp nuances, perform reasoning, and generate coherent text.

## Next Steps

Explore the fascinating [Properties and Visualisation of Word Embeddings](./properties-and-visualisation-of-word-embedding.md) to truly appreciate their power.