# FPGA-PWM-Sequence-Generator
##FPGA-Based 8-Channel, 8-Bit Real-Time PWM Sequence Generator using Verilog HDL and Xilinx Vivado.

##  Project Overview

* This project implements an **FPGA-based 8-channel, 8-bit PWM (Pulse Width Modulation) sequence generator using Verilog HDL**.
* The design generates **eight independent PWM output signals**, where each channel has an 8-bit duty-cycle value ranging from **0 to 255**.
* Instead of using a fixed duty cycle, the system automatically changes the duty-cycle values according to a predefined sequence stored in a sequence memory.
* The complete design is developed using **Verilog HDL** and verified through **behavioral simulation in Xilinx Vivado**.

### Key idea
* **8-bit** → PWM resolution
* **8-channel** → Eight independent PWM outputs
* **Sequence generator** → Automatically changes the duty-cycle pattern

##  Project Objectives

The main objectives of this project are:

- Design an **8-bit PWM generator** using Verilog HDL.
- Generate **8 independent PWM output channels**.
- Implement predifined duty-cycle sequences.
- Design a sequence controller for automatic pattern switching.
- Implement a clock-based tick generator for sequence timing.
- Verify the complete design using behavioral simulation.
- Understand hierarchical RTL design and module interconnection.
- Analyze PWM waveforms and duty-cycle behavior using Vivado.

## Design Modules
## PWM Fundamentals

### Pulse Width Modulation (PWM):
 pwm is a digital technique used to control the average power or effective level of a signal by varying the width of the HIGH portion of a periodic pulse.
* The percentage of time for which the signal remains HIGH is called the **duty cycle**.

### Duty Cycle
Duty Cycle (%) = (HIGH Time / Total Period) × 100

### PWM Sequence Generator:
* A conventional PWM generator normally operates with a single fixed duty-cycle value.
* A PWM sequence generator extends this concept by automatically changing the duty-cycle values according to a predefined sequence.
-> In this project:
     - A sequence is selected.
     - The sequence memory provides eight duty-cycle values.
     - The eight values are supplied to the eight PWM channels.
     - After a defined time interval, the sequence controller selects the next sequence.
     - The process repeats continuously.

## Understanding 8-Bit and 8-Channel PWM
### 8-Bit PWM Resolution
- The PWM counter is 8 bits wide.
- Therefore, it provides 256 count levels.
- The duty-cycle control value ranges from 0 to 255.
- Higher values produce a longer HIGH duration within each PWM period.
- 
  0 → 255
  256 possible levels

## System Architecture

+----------------------+         +----------------------+           +----------------------+            +----------------------+
|      Clock / Reset   |   -->   |   Tick Generator     |   -->     | Sequence Controller |      -->    |  Sequence Memory     |
+----------------------+         |  Sequence Timing     |           |  Address Generation |             |  Duty-Cycle Values   |
                                 +----------+-----------+           +----------+-----------+            +----------+-----------+

                                                                                                                 |
                                                                                                                 v
                                                      +----------------------+                    +------------+------------+
                         PWM_OUT[7:0]       < --      |  8-Channel PWM       |         <--        |           |            |
                                                      |     Generator        |                 Duty 0      Duty 1      ...Duty 7
                                                      +----------+-----------+                    |            |            |
                                                                                                   +------------+------------+
    ![System Block Diagram](screenshots/block_diagram.png)      

 ## Design Flow:
 
The project follows the following RTL design and verification flow:
Specification
     ↓
RTL Module Design
     ↓
Module Integration
     ↓
Testbench Development
     ↓
Behavioral Simulation
     ↓
Waveform Analysis
     ↓
Functional Verification
 
## Working Principle

The FPGA-based 8-channel, 8-bit PWM Sequence Generator operates through a set of interconnected Verilog HDL modules. The system generates eight independent PWM signals and automatically changes their duty-cycle values according to predefined sequences.
### Step 1: Clock Input / Simulation Clock
- The system operates using a clock signal supplied to the top-level module.
- During simulation, the testbench generates a clock with a 10 ns period.
- This corresponds to a 100 MHz simulation clock.
- The clock provides the timing reference for all synchronous modules.

### Step 2: Tick Generation
- The `tick_generator.v` module generates a periodic `tick` signal.
- It uses a counter to count incoming clock cycles.
- When the programmed count is reached, the counter resets and a one-clock-cycle tick is generated.
- The tick determines when the next PWM sequence should be selected.
- A smaller tick count is used during simulation so that sequence changes can be observed easily.

### Step 3: Sequence Control
- The `sequence_controller.v` module controls the sequence selection.
- It maintains a 2-bit sequence address.
- The sequence address changes whenever a valid tick is received.
- The sequence order is:
Sequence 0 → Sequence 1 → Sequence 2 → Sequence 3 → Sequence 0           

### Step 4: Sequence Memory
- The sequence_memory.v module stores the predefined PWM duty-cycle patterns.
- The 2-bit sequence address selects one of the four stored sequences.
- Each sequence provides eight 8-bit duty-cycle values.
- These values are supplied to PWM channels 0 to 7.
   Sequence 0:
      CH0 = 64
      CH1 = 128
      CH2 = 192
      CH3 = 255
      CH4 = 32
      CH5 = 96
      CH6 = 160
      CH7 = 224
### Step 5: 8-Bit PWM Generation
- The pwm_8bit.v module generates one PWM signal.
- An 8-bit counter continuously counts from 0 to 255.
- The counter value is compared with the selected duty-cycle value.
- The PWM output is HIGH when:
      *PWM Counter < Duty Cycle
- Otherwise, the PWM output is LOW.

### Step 6: Multi-Channel PWM Generation
- The multi_channel_pwm.v module creates eight independent PWM channels.
- It instantiates eight pwm_8bit modules.
- Each channel receives its own 8-bit duty-cycle value.
- The eight outputs are combined into:
      *  PWM_OUT[7:0]
- This allows all eight PWM signals to operate in parallel.
   
### Step 7: Top-Level Integration
- The pwm_top.v module connects all the individual modules together.
- The complete signal flow is:
      Clock / Reset
          ↓
     Tick Generator
          ↓
    Sequence Controller
          ↓
     Sequence Memory
          ↓
  8-bit Duty-Cycle Values
          ↓
  8-Channel PWM Generator
          ↓
     PWM_OUT[7:0]

### step 8: Simulation and Verification
- The pwm_top_tb.v testbench provides the clock and reset signals.
- The complete design is verified using behavioral simulation in Xilinx Vivado.
- The simulation waveform can be used to observe:
- Clock and reset operation.
- Sequence address changes.
- Duty-cycle values.
- Eight independent PWM outputs.
- Continuous sequence transitions.
 ### ![Simulation Waveform](screenshots/waveform.png)

## Verification Results
The behavioral simulation confirms the expected operation of the PWM sequence generator.
The following behaviors were verified:
- Correct clock and reset operation.
- Correct generation of the periodic tick signal.
- Correct sequence address progression.
- Correct selection of predefined duty-cycle patterns.
- Independent PWM generation for all eight channels.
- Correct variation of PWM duty cycles according to the selected sequence.
- Continuous cyclic transition between Sequence 0, Sequence 1, Sequence 2, and Sequence 3.
The simulation waveform provides visual verification of the complete signal flow from sequence selection to the final `PWM_OUT[7:0]` outputs.

> [!NOTE]
> The current implementation has been functionally verified through behavioral simulation in Xilinx Vivado. FPGA hardware implementation and real-time external control are planned as future work.

 ### FSM / Sequence Control
 - The sequence-control logic follows a cyclic four-step progression
   ### ![FSM Diagram](screenshots/fsm_diagram.png)

## Applications :
The PWM sequence generator architecture can be extended to:
- LED brightness control
- Motor and actuator control
- Robotics and embedded systems
- Multi-channel digital control
- FPGA-based waveform generation
- Time-coded control signals
- Communication and RF control systems
- Research-oriented FPGA control applications
- 
## Conclusion
- This project demonstrates the design and simulation of a modular 8-channel, 8-bit PWM sequence generator using Verilog HDL.
- The architecture combines PWM generation, sequence memory, sequence control, and timing logic to produce multiple independently controlled PWM outputs.
- The design was successfully verified using Xilinx Vivado behavioral simulation, providing a foundation for future extensions such as programmable sequences, external communication interfaces, Python-based control, and FPGA hardware implementation.
- The project also provides practical experience in RTL design, synchronous digital logic, PWM generation, hierarchical Verilog design, and FPGA-based system development.

##License
This project is licensed under the MIT License.





















