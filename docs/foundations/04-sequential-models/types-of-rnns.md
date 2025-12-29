---
title: "Types of RNNs: LSTMs and GRUs"
description: "Explore advanced Recurrent Neural Network (RNN) architectures – Long Short-Term Memory (LSTM) networks and Gated Recurrent Units (GRUs) – designed to overcome the vanishing gradient problem and better capture long-term dependencies in sequential data."
sidebar_position: 4
---

# Types of RNNs: LSTMs and GRUs

:::info[The Solution to Short-Term Memory]
In the last section, we saw that basic RNNs struggle with the **vanishing gradient problem**, giving them a poor long-term memory. LSTMs and GRUs are the direct answer to this challenge. They introduce a powerful new concept called **gates**, which are like valves that allow the network to meticulously control what information is remembered, what is forgotten, and what is passed on. This gives them the ability to learn dependencies over much longer sequences.
:::

While basic [Recurrent Neural Networks (RNNs)](./introduction-to-sequential-data-and-rnn.md) introduced the concept of memory for sequential data, they suffered from significant limitations, most notably the **vanishing gradient problem**. This made it challenging for them to learn and retain information over long sequences, leading to a "short-term memory" effect.

To address these issues, more sophisticated RNN architectures were developed, with **Long Short-Term Memory (LSTM)** networks and **Gated Recurrent Units (GRUs)** being the most prominent. These models introduce "gating mechanisms" that allow them to selectively remember or forget information, enabling them to capture long-term dependencies much more effectively.

## 1. Long Short-Term Memory (LSTM) Networks

LSTMs, introduced by Hochreiter & Schmidhuber in 1997, are a powerful extension to RNNs designed specifically to learn order dependence in sequence prediction problems. They achieve this through a unique internal structure called a "cell" that maintains a separate "cell state" (or "memory state") in addition to the hidden state.

### The LSTM Cell Architecture

:::tip[Analogy: The Diligent Note-Taker]
Think of an LSTM cell as a very diligent student in a lecture.
*   The **Cell State** is the student's notebook, containing all the important information learned so far.
*   The **Forget Gate** is the student deciding to erase or cross out irrelevant old notes (e.g., "The professor's cat is named Fluffy").
*   The **Input Gate** is the student listening to a new point and deciding to write it down.
*   The **Output Gate** is the student deciding which of their notes is most relevant to answer the professor's current question.
This system of careful note management allows the LSTM to maintain a clean, useful "memory" over long periods.
:::

The core idea of an LSTM is the **cell state**, which acts as a conveyor belt, carrying relevant information across time steps. Information can be added to or removed from the cell state via three specialized "gates":

1.  **Forget Gate**: Decides what information from the previous cell state should be thrown away or kept. It outputs a number between 0 and 1 for each number in the cell state, where 0 means "completely forget" and 1 means "completely keep."
2.  **Input Gate**: Decides what new information should be stored in the cell state. It has two parts:
    *   A sigmoid layer (like the forget gate) decides which values will be updated.
    *   A `tanh` layer creates a vector of new candidate values that could be added to the cell state.
3.  **Output Gate**: Decides what part of the cell state will be outputted to the hidden state at the current time step. This hidden state then becomes the input to the next RNN cell and also contributes to the current time step's prediction.

**Visual Suggestion**: A detailed diagram of an LSTM cell, showing the three gates (forget, input, output) and how they interact with the cell state and hidden state. This is a standard diagram found in many resources.

```mermaid
graph TD
    PrevCellState(Previous Cell State C_t-1)
    PrevHiddenState(Previous Hidden State h_t-1)
    Input(Input x_t)

    Input --> ForgetGate
    PrevHiddenState --> ForgetGate
    ForgetGate{Forget Gate (sigmoid)} -- f_t --> ForgetMultiply(x)

    Input --> InputGate_i
    PrevHiddenState --> InputGate_i
    InputGate_i{Input Gate (sigmoid)} -- i_t --> InputMultiply(x)

    Input --> InputGate_c
    PrevHiddenState --> InputGate_c
    InputGate_c{Candidate Values (tanh)} -- c_tilde_t --> InputAdd(+)

    PrevCellState --> ForgetMultiply
    ForgetMultiply --> UpdateCellState(New Cell State C_t)
    InputMultiply --> InputAdd
    InputAdd --> UpdateCellState

    UpdateCellState --> OutputGate_o
    Input --> OutputGate_o
    PrevHiddenState --> OutputGate_o
    OutputGate_o{Output Gate (sigmoid)} -- o_t --> OutputMultiply(x)

    UpdateCellState --> OutputTanh(tanh)
    OutputTanh --> OutputMultiply
    OutputMultiply --> CurrentHiddenState(Current Hidden State h_t)

    CurrentHiddenState --> NextPrevHiddenState(Previous Hidden State h_t-1 for next step)
    UpdateCellState --> NextPrevCellState(Previous Cell State C_t-1 for next step)
```

### Advantages of LSTMs

*   **Solves Vanishing Gradients**: The constant error carousel in the cell state allows gradients to flow more easily across many time steps.
*   **Long-Term Memory**: Can learn and remember important information from hundreds or even thousands of time steps ago.
*   **Widespread Use**: Became the state-of-the-art for many sequence modeling tasks before the advent of Transformers.

## 2. Gated Recurrent Units (GRUs)

GRUs, introduced by Cho et al. in 2014, are a slightly simpler variation of LSTMs. They combine the forget and input gates into a single "update gate" and also merge the cell state and hidden state. This makes them less complex to compute and train, while still being highly effective at capturing long-term dependencies.

### The GRU Cell Architecture

:::tip[A Streamlined LSTM]
A GRU can be thought of as a simplified and more efficient version of an LSTM. It combines the "forget" and "input" gates into a single "update" gate and gets rid of the separate cell state. In practice, this means it has fewer parameters and can be faster to train, while often achieving very similar performance to an LSTM.
:::

GRUs have two gates:

1.  **Update Gate**: Decides how much of the past information (from the previous hidden state) should be carried over to the current hidden state, and how much of the new information (from the current input) should be taken into account.
2.  **Reset Gate**: Decides how much of the previous hidden state to *forget*. If the reset gate is close to 0, the previous hidden state is effectively ignored, allowing the model to "reset" its memory for new, potentially unrelated, input.

**Visual Suggestion**: A detailed diagram of a GRU cell, showing the update and reset gates and how they interact to produce the new hidden state.

```mermaid
graph TD
    PrevHiddenState(Previous Hidden State h_t-1)
    Input(Input x_t)

    Input --> UpdateGate
    PrevHiddenState --> UpdateGate
    UpdateGate{Update Gate (sigmoid)} -- z_t --> UpdateMultiply1(x)
    UpdateGate --> UpdateMultiply2(1-z_t)

    Input --> ResetGate
    PrevHiddenState --> ResetGate
    ResetGate{Reset Gate (sigmoid)} -- r_t --> ResetMultiply(x)

    ResetMultiply --> PrevHiddenState_reset(h_t-1 * r_t)
    PrevHiddenState_reset --> CandidateHiddenState_input(x)
    Input --> CandidateHiddenState_input

    CandidateHiddenState_input --> CandidateHiddenState{Candidate h_t (tanh)} -- h_tilde_t --> CandidateMultiply(x)

    PrevHiddenState --> UpdateMultiply1
    UpdateMultiply1 --> AddHiddenState(+)

    CandidateMultiply --> AddHiddenState
    AddHiddenState --> CurrentHiddenState(Current Hidden State h_t)
```

### Advantages of GRUs

*   **Reduced Complexity**: Fewer parameters than LSTMs, leading to faster training and less data required.
*   **Similar Performance**: Often achieve comparable performance to LSTMs on many tasks.
*   **Popularity**: A good default choice for many sequence modeling problems due to its balance of effectiveness and simplicity.

## Relevance to Generative AI and LLMs

:::info[LSTM vs. GRU: Which One Should I Use?]
This is a common question. Here’s a good rule of thumb:
*   **Start with a GRU.** Because they are simpler and faster to train, GRUs are an excellent default choice for most sequence modeling problems.
*   **Try an LSTM if performance is not sufficient.** If you have a very large dataset and your GRU model isn't performing as well as you'd like, the greater expressive power of an LSTM might give you a boost.

Ultimately, while both are powerful, most modern, state-of-the-art LLMs have moved on to the **Transformer architecture**, which solves the long-range dependency problem even more effectively.
:::

LSTMs and GRUs were a critical step in the evolution of sequence models, enabling significant breakthroughs in machine translation, speech recognition, and language modeling. They demonstrated the power of gated mechanisms to manage information flow, a concept that is implicitly carried forward and greatly enhanced in the Transformer architecture. While LSTMs and GRUs are less frequently the primary architecture for state-of-the-art LLMs today, understanding them is crucial for appreciating the advancements that led to Transformers.

## Next Steps

With a grasp of different RNN types, we'll now examine the final advanced RNN architecture: the [Encoder-Decoder Model](./encoder-decoder-model.md), which combines RNNs for sequence-to-sequence tasks.