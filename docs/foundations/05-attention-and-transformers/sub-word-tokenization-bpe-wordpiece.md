---
title: "Sub-Word Tokenization: BPE, WordPiece, Unigram"
description: "Understand the importance of sub-word tokenization strategies like Byte Pair Encoding (BPE), WordPiece, and Unigram Language Model (ULM) in handling large vocabularies, rare words, and out-of-vocabulary (OOV) terms, crucial for modern Large Language Models (LLMs)."
sidebar_position: 6
---

# Sub-Word Tokenization: BPE, WordPiece, Unigram

In Natural Language Processing (NLP), **tokenization** is the process of breaking down raw text into smaller units called tokens. While basic tokenization often splits text by words, this approach faces significant challenges when dealing with:

*   **Large Vocabularies**: Many unique words require a huge vocabulary, increasing model size and complexity.
*   **Rare Words**: Words that appear infrequently might not have enough examples for their embeddings to be learned effectively.
*   **Out-of-Vocabulary (OOV) Words**: Words not seen during training cannot be represented by the model.

**Sub-word tokenization** strategies address these issues by breaking down words into meaningful sub-word units (e.g., prefixes, suffixes, root forms). This allows models to represent rare and OOV words by composing them from known sub-word units, and to manage vocabulary size more efficiently. These techniques are fundamental for the [Transformer Architecture](./transformer-model-architecture.md) and modern Large Language Models (LLMs).

## The Need for Sub-Word Tokenization

Consider the word "unbelievable." A word-level tokenizer would treat this as one token. If the model hasn't seen it before, it's an OOV word. A sub-word tokenizer might break it into "un", "believe", "able" – all of which are common sub-word units the model likely knows.

**Actionable Insight**: Sub-word tokenization strikes a balance between character-level and word-level tokenization. It keeps the vocabulary size manageable while allowing the model to generalize to unseen words.

## Popular Sub-Word Tokenization Algorithms

The most widely used sub-word tokenization algorithms are:

### 1. Byte Pair Encoding (BPE)

*   **Origin**: Originally a data compression algorithm.
*   **How it Works**:
    1.  Start with a vocabulary of individual characters present in the training data.
    2.  Iteratively count the frequency of all adjacent character pairs and merge the most frequent pair into a new sub-word unit.
    3.  Repeat until a predefined vocabulary size is reached or no more merges can be made.
*   **Example**:
    *   Initial: `{"t", "h", "e", "q", "u", "i", "c", "k", "b", "r", "o", "w", "n", "f", "x"}`
    *   Merge "th": `{"th", "e", ...}`
    *   Merge "qu": `{"th", "e", "qu", ...}`
    *   ... Eventually forms "the", "quick", "brown", "fox"
    *   For an OOV word like "lowest": It might break into "low", "est".
*   **Models Using BPE**: GPT-2, GPT-3, RoBERTa.
*   **Actionable Insight**: BPE is effective and simple, allowing open-vocabulary models without an infinitely large vocabulary.

### 2. WordPiece

*   **Origin**: Used in Google's neural machine translation systems and later by BERT.
*   **How it Works**: Similar to BPE but with a key difference in the merge criterion. Instead of merging the most frequent pair, WordPiece merges the pair that, when combined, maximizes the likelihood of the training data. It considers the probability of a word forming from its sub-words.
    1.  Start with a vocabulary of individual characters and all words in the training corpus.
    2.  Iteratively evaluate all possible merges. Select the merge that results in the largest increase in the log-likelihood of the training data when added to the vocabulary.
    3.  Repeat until the desired vocabulary size is reached.
*   **Example**: "unwanted" -> "un", "##want", "##ed". The `##` prefix indicates a sub-word unit that is not the beginning of a word.
*   **Models Using WordPiece**: BERT, DistilBERT.
*   **Actionable Insight**: WordPiece tends to create tokens that are more linguistically meaningful than basic BPE, often resulting in better performance for models like BERT.

### 3. Unigram Language Model (ULM) Tokenization

*   **Origin**: Used by SentencePiece, common in Transformer models like XLNet and T5.
*   **How it Works**: Unlike BPE and WordPiece (which are greedy bottom-up approaches), Unigram LM tokenization is a top-down probabilistic approach.
    1.  Starts with a large vocabulary of possible sub-word units (initially all characters and words).
    2.  Trains a unigram language model on this vocabulary.
    3.  Iteratively prunes the vocabulary by removing sub-words that have a low impact on the overall likelihood of the training data, until a desired vocabulary size is met. It can generate multiple segmentations for a sentence, and then chooses the most probable one.
*   **Example**: "beautiful" might be tokenized as "beau", "tiful" or "be", "aut", "iful".
*   **Models Using ULM**: ALBERT, T5, XLNet.
*   **Actionable Insight**: Unigram LM models allow for multiple valid tokenizations of a word, which can be useful for ambiguous cases, and are often more robust across different languages.

## Actionable Insight: Tokenization Choice Matters

The choice of tokenizer significantly impacts model performance, vocabulary size, and how out-of-vocabulary words are handled. When working with LLMs:

*   **Understand the Tokenizer**: Always know which tokenizer was used to train your LLM. Using a different tokenizer during inference will lead to poor results.
*   **Context Window**: Tokenizers directly affect the number of tokens a given sequence consumes, which directly impacts the effective context window and cost of LLM inference.
*   **Special Tokens**: Be aware of special tokens (e.g., `[CLS]`, `[SEP]`, `<pad>`, `<s>`, `</s>`) that tokenizers add for model-specific processing.

## Visual Suggestion: Tokenization Comparison

```mermaid
graph TD
    A[Original Word: "unbelievable"]
    B[Word Tokenization] --> B1["unbelievable"]
    C[BPE Tokenization] --> C1["un", "believ", "able"]
    D[WordPiece Tokenization] --> D1["un", "##believe", "##able"]
    E[UnigramLM Tokenization] --> E1["un", "beli", "evable"]

    A --> B
    A --> C
    A --> D
    A --> E
```

## Relevance to Generative AI and LLMs

Sub-word tokenization is indispensable for modern LLMs. It's how these models efficiently handle the vast complexity of human language, balancing the need for a rich vocabulary with computational feasibility. By breaking words into smaller, reusable units, LLMs can:
*   **Handle OOV words**: Generate representations for words they've never seen before.
*   **Manage vocabulary size**: Keep the total number of unique tokens manageable.
*   **Learn morphology**: Implicitly learn about word structure (prefixes, suffixes, roots).
*   **Improve cross-lingual transfer**: Sub-word units are often shared across related languages.

## Next Steps

With a solid understanding of tokenization, we can now look at how these representations are used in the context of specific landmark models, starting with **[BERT: Model Architecture](./bert-model-architecture.md)**.
---