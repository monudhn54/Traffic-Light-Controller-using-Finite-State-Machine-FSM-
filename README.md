# 🚦 Traffic Light Controller using Finite State Machine (FSM)

A digital logic design project implementing a **Traffic Light Controller using a Moore Finite State Machine (FSM)**. The controller manages the sequence of **Red, Green, and Yellow traffic signals** using sequential logic and predefined state transitions.

The design was verified through simulation to ensure correct state transitions and traffic light sequencing.

---

## 📌 Project Overview

Traffic light controllers are classic examples of **Finite State Machine (FSM)** applications in digital electronics.

In this project, the traffic controller is designed using a **Moore FSM**, where the output signals depend only on the current state.

The controller cycles through the following sequence:

```text
        ┌─────────┐
        │  GREEN  │
        └────┬────┘
             │
             ▼
        ┌─────────┐
        │ YELLOW  │
        └────┬────┘
             │
             ▼
        ┌─────────┐
        │   RED   │
        └────┬────┘
             │
             └──────────► GREEN
```

---

## ⚙️ Features

* Designed using a **Moore Finite State Machine**
* Implements **Red, Yellow, and Green** traffic signals
* Uses sequential logic for state transitions
* Includes reset functionality
* Simulated and verified for correct operation
* Demonstrates practical application of FSM concepts
* Helps understand state registers, flip-flops, and sequential circuits

---

## 🧠 FSM Design

The controller consists of three primary states:

| State    | Traffic Signal |
| -------- | -------------- |
| `GREEN`  | 🟢 Green ON    |
| `YELLOW` | 🟡 Yellow ON   |
| `RED`    | 🔴 Red ON      |

### State Transition

```text
GREEN → YELLOW → RED → GREEN → ...
```

The FSM changes from one state to another based on the clock signal.

---

## 🔄 State Transition Table

| Current State | Next State | Red | Yellow | Green |
| ------------- | ---------- | --: | -----: | ----: |
| GREEN         | YELLOW     |   0 |      0 |     1 |
| YELLOW        | RED        |   0 |      1 |     0 |
| RED           | GREEN      |   1 |      0 |     0 |

Since this is a **Moore FSM**, the output signals are determined by the current state.

---

## 🏗️ System Architecture

```text
                 ┌──────────────┐
                 │    Clock     │
                 └──────┬───────┘
                        │
                        ▼
               ┌─────────────────┐
               │  State Register │
               │   / Flip-Flops  │
               └────────┬────────┘
                        │
                        ▼
               ┌─────────────────┐
               │ Next-State Logic│
               └────────┬────────┘
                        │
                        ▼
               ┌─────────────────┐
               │ Output Logic     │
               │ Red/Yellow/Green│
               └─────────────────┘
```

---

## 💻 Implementation

The controller can be implemented using **Verilog HDL** with separate logic for:

1. State declaration
2. State register
3. Next-state logic
4. Output logic
5. Reset handling

Example FSM structure:

```verilog
always @(posedge clk or posedge reset) begin
    if (reset)
        state <= RED;
    else
        state <= next_state;
end
```

The output logic determines which traffic light is active according to the current FSM state.

---

## 🧪 Simulation & Verification

The design was verified through simulation by observing:

* Clock transitions
* FSM state changes
* Red signal activation
* Yellow signal activation
* Green signal activation
* Reset behavior
* Correct cyclic sequence

Expected sequence:

```text
RED
 ↓
GREEN
 ↓
YELLOW
 ↓
RED
 ↓
GREEN
 ...
```

The simulation confirms that the controller follows the intended traffic-light sequence.

---

## 📁 Project Structure

```text
Traffic-Light-Controller-FSM/
│
├── src/
│   └── traffic_light_controller.v
│
├── simulation/
│   └── traffic_light_controller_tb.v
│
├── waveform/
│   └── simulation_waveform.png
│
├── README.md
└── LICENSE
```

> Update the filenames/folders according to the actual files in your repository.

---

## 🛠️ Technologies & Concepts

### Hardware Description Language

* **Verilog HDL**

### Digital Electronics Concepts

* Finite State Machines (FSM)
* Moore FSM
* Sequential Logic
* Combinational Logic
* Flip-Flops
* State Registers
* State Transitions
* Clocked Logic
* Reset Logic
* Digital Circuit Simulation

---

## 🎯 Learning Outcomes

Through this project, I strengthened my understanding of:

* Designing FSM-based digital systems
* Moore FSM architecture
* State transition design
* Sequential circuits
* Flip-flop based state storage
* Clock-driven state transitions
* RTL design using Verilog
* Simulation and waveform verification

---

## 🔮 Future Improvements

Possible extensions include:

* Add pedestrian crossing functionality
* Add traffic sensors
* Implement configurable timing for each signal
* Support multiple road intersections
* Add emergency vehicle priority
* Implement the design on an FPGA development board
* Add a seven-segment display for countdown timing

---

## 👨‍💻 Author

**Mohit Kumar Soni**

Engineering Student | Electronics & Communication Engineering

---

## ⭐ Project Highlights

```text
✔ Moore FSM Design
✔ Verilog HDL
✔ Sequential Logic
✔ Traffic Signal Control
✔ Simulation & Verification
✔ Digital Electronics
```

If you found this project useful, consider giving the repository a ⭐.
