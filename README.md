# Vicharak-CPU

# 19-bit RISC CPU Design
## Table of Contents
- [Key Features](#key-features)
- [Architecture Highlights](#architecture-highlights)
- [Pipeline Stages](#pipeline-stages)
- [Key Components](#key-components)
- [Instruction Format](#instruction-format)
- [Signal Flow](#signal-flow)
- [Signal Processing Applications](#signal-processing-applications)
- [Simulation](#simulation)
---
## Key Features

- 19-bit data width
- 16 general-purpose registers
- 256 instruction memory size
- 256 data memory size
---
## Architecture Highlights

```
                     ┌─────────────────┐
                     │  Program Counter│
                     └────────┬────────┘
                              │
                     ┌────────▼────────┐
                     │ Instruction     │
                     │    Fetch        │
                     └────────┬────────┘
                              │
                     ┌────────▼────────┐
                     │ Instruction     │
                     │    Decode       │
                     └────────┬────────┘
                              │
           ┌──────────────────┴───────────────┐
           │                                  │
   ┌───────▼─────┐                    ┌──────▼──────┐
   │  Register   │                    │   Control   │
   │    File     │                    │    Unit     │
   └───────┬─────┘                    └──────┬──────┘
           │                                 │
           └──────────────┬─────────────────┘
                         │
                   ┌─────▼─────┐
                   │    ALU    │
                   └─────┬─────┘
                         │
                   ┌─────▼─────┐
                   │  Memory   │
                   │  Access   │
                   └───────────┘
```
---
## Pipeline Stages

1. **Fetch Stage**
   - Retrieves instructions from instruction memory
   - Updates program counter
   - Handles 19-bit wide instructions

2. **Decode Stage**
   - Breaks down instruction into:
     - 5-bit opcode (operation code)
     - 4-bit source register 1 (rs1)
     - 4-bit source register 2 (rs2)
     - 4-bit destination register (rd)
     - 11-bit immediate value (when applicable)

3. **Execute Stage**
   - Performs ALU operations
   - Handles branch/jump decisions
   - Manages function calls and returns

4. **Memory Stage**
   - Handles memory read/write operations
   - Manages data memory access
   - Processes load/store instructions

---

## Key Components 
![image](https://github.com/user-attachments/assets/50799615-7e2c-45ec-b8e9-9dd50c002c0d)

### 1. Program Counter (PC)
The **Program Counter** keeps track of the current instruction address. It is updated on each clock cycle and can be modified by branch, jump, call, and return instructions.

- **Stack**: A 16-level stack is implemented for handling `call` and `ret` instructions, allowing nested subroutine calls.
  
### 2. Instruction Fetch (InstFetch)
The **Instruction Fetch** module fetches the instruction stored at the current address in the instruction memory. When reset, the program counter resets to zero.

- **Instruction Memory**: Can hold up to 256 19-bit instructions.

### 3. Instruction Decoder (InstDeco)
The **Instruction Decoder** extracts the **opcode**, **source registers**, **destination register**, and **immediate value** from a 19-bit instruction. This module serves as a translator between the binary instruction and the control signals required for processing.


### 4. Register File
The **Register File** stores data in 16 general-purpose registers, each 19 bits wide. It reads from two source registers and writes data to a destination register on clock cycles where `regWrite` is enabled.


### 5. ALU (Arithmetic Logic Unit)
The **ALU** performs arithmetic and logical operations on data, determined by a 5-bit opcode.

#### ALU Operations
| **Opcode (5-bit)** | **Operation**   | **Description**                                       | 
|--------------------|-----------------|-------------------------------------------------------|
| `5'b00000`         | ADD             | Adds `op1` and `op2`                                  | 
| `5'b00001`         | SUB             | Subtracts `op2` from `op1`                            | 
| `5'b00010`         | MUL             | Multiplies `op1` and `op2`                            | 
| `5'b00011`         | DIV             | Divides `op1` by `op2`                                |
| `5'b00100`         | AND             | Bitwise AND of `op1` and `op2`                        | 
| `5'b00101`         | OR              | Bitwise OR of `op1` and `op2`                         | 
| `5'b00110`         | XOR             | Bitwise XOR of `op1` and `op2`                        | 
| `5'b00111`         | NOT             | Bitwise NOT of `op1`                                  | 
| `5'b01000`         | MAC             | Multiply-Accumulate (`op1 * op2 + alu_result`)        | 
| `5'b01001`         | SQR             | Square of `op1` (`op1 * op1`)                         | 
| `5'b01010`         | ABS             | Absolute value of `op1`                               | 
| `5'b01011`         | AVG             | Average of `op1` and `op2` (`(op1 + op2) >> 1`)       |
| `5'b01100`         | INC             | Increment `op1` by 1                                  | 
| `5'b01101`         | DEC             | Decrement `op1` by 1                                  | 
| `5'b01111`         | BEQ             | Branch if `op1 == op2` (1 if equal, 0 otherwise)      | 
| `5'b10000`         | BNE             | Branch if `op1 != op2` (1 if not equal, 0 otherwise)  | 

### 6. Control Unit
The **Control Unit** interprets the opcode and sets various control signals for different operations, managing data flow within the CPU.

| Signal      | Description                          |
|-------------|--------------------------------------|
| `regWrite`  | Enables writing data to registers    |
| `memoryRead`| Enables reading data from memory     |
| `memoryWrite`| Enables writing data to memory      |
| `branch`    | Indicates conditional branching      |
| `jump`      | Initiates an unconditional jump      |
| `call`      | Initiates a subroutine call          |
| `ret`       | Returns from a subroutine            |

### 7. Data Memory
The **Data Memory** module allows reading and writing of data to memory addresses based on `memoryRead` and `memoryWrite` signals. It uses a 256-entry memory with 19-bit wide storage.

---

## Instruction Format

| Bits        | Field      | Description                       |
|-------------|------------|-----------------------------------|
| 18–14       | Opcode     | Operation code                   |
| 13–10       | rs1        | Source register 1                |
| 9–6         | rs2        | Source register 2                |
| 5–2         | rd         | Destination register             |
| 10–0        | Immediate  | Immediate value for operations   |

---
## Signal Flow

1. **Program Counter** → **Instruction Fetch**
   - Provides current instruction address
   - Updates to next instruction
   - Handles branches and jumps

2. **Instruction Fetch** → **Instruction Decode**
   - Retrieves 19-bit instruction
   - Calculates next program counter value

3. **Instruction Decode** → **Register File & Control Unit**
   - Extracts operation and register addresses
   - Generates control signals
   - Manages immediate values

4. **Register File** → **ALU**
   - Provides operand values
   - Stores computation results
   - Handles register bypassing

5. **ALU** → **Memory/Register File**
   - Performs calculations
   - Sets condition flags
   - Generates memory addresses
---

## Signal Processing Applications

### Applications by Instruction:

- **MAC (Multiply-Accumulate)**: Useful in FIR filters and convolution operations, especially in audio and real-time signal processing. Each input sample is multiplied by a filter coefficient and accumulated, a key process in applying weighted sums.
- **SQR (Square)**: Used to calculate the power or energy of a signal. Useful in applications needing signal strength analysis or root-mean-square (RMS) computations.
- **ABS (Absolute Value)**: Helps in signal rectification by converting all values to positive, a common preprocessing step in audio signal processing and demodulation.
- **AVG (Average)**: Helps reduce noise in signals, a foundational operation in smoothing, and low-pass filtering, where it can reduce high-frequency noise to make important signal features more discernible.

These operations facilitate crucial DSP tasks, enabling functions like:
- **Filtering:** Using MAC for FIR and IIR filters.
- **Feature Extraction:** Calculating ABS and AVG, often needed in feature extraction to enhance key signal characteristics.
- **Scaling and Normalization:** Using MUL, DIV, and ADD to rescale signals, normalize for amplitude consistency, and control signal strength.

---
## Simulation
![Screenshot 2024-11-06 124619](https://github.com/user-attachments/assets/a32e3cb4-8385-48bd-bcbf-d9dfa0136ecb)
- Here first I executed `ADD` instruction and then `SUB` instruction.
- Tools used: Quartus 2 web edition, Modelsim
- [Videos](https://drive.google.com/drive/folders/1eS_TWkPu0U9vBViRq6ma_H2gPQA1itCu?usp=drive_link)
