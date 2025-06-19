# FIFO-UVM Verification Project

This repository contains the **design** and **SystemVerilog UVM-style testbench** for a First-In-First-Out (FIFO) memory. The project is developed and verified using **Xilinx Vivado 2025.1** and demonstrates basic concepts of RTL design, stimulus generation, and functional verification.

---

## 📁 Project Structure
FIFO-UVM/
├── FIFO.sv # RTL: FIFO design (8-bit, 16-depth)
├── fifo_tb.sv # Top-level testbench
├── fifo_if.sv # Interface connecting DUT and testbench components
├── fifo_pkg.sv # Package: includes agent, monitor, driver, scoreboard, generator
├── .gitignore # Ignores Vivado-generated simulation/cache files
├── FIFOUVM_sv.xpr # Vivado project file
├── sim/, srcs/, cache/ # Vivado simulation/build folders (ignored from Git)

 FIFO Design Specs
- **Width**: 8 bits  
- **Depth**: 16 entries  
- **Control**: `wr`, `rd`, `rst`, `clock`  
- **Status Flags**: `empty`, `full`  
- **Behavior**:  
  - Write if not full  
  - Read if not empty  
  - Synchronous logic with reset  

##  Verification Features

UVM-style layered testbench  
Random stimulus generation (read/write operations)  
Functional coverage via scoreboard  
Interface-based transaction handling  
Read-after-write, underflow, overflow scenarios  
Console logs for monitor/scoreboard feedback

---

## Sample Simulation Output (Vivado XSim)

```text
[GEN] : Oper : 1 iteration : 2
[DRV] : DATA WRITE  data : 8
[SCO] : DATA STORED IN QUEUE :8

[GEN] : Oper : 0 iteration : 3
[DRV] : DATA READ
[SCO] : DATA MATCH

[SCO] : FIFO IS EMPTY
---------------------------------------------
Error Count : 0
How to Run
Open Vivado → FIFOUVM_sv.xpr

Make sure all .sv files are in the proper file sets

Run Behavioral Simulation

Observe console log or waveform for results


.gitignore Highlights
# Vivado generated
*.cache/
*.sim/
*.hw/
*.ip_user_files/
*.runs/
*.Xil/
*.xpr
*.log
*.wdb
*.vcd
