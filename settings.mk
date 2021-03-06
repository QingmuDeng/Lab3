# Project-specific settings

## Assembly settings

# Assembly program (minus .asm extension)
#PROGRAM := array_loop
PROGRAM := test_2

# Memory image(s) to create from the assembly program
TEXTMEMDUMP := $(PROGRAM).text.hex
DATAMEMDUMP := $(PROGRAM).data.hex


## Verilog settings

# Top-level module/filename (minus .v/.t.v extension)
TOPLEVEL := cpu

# All circuits included by the toplevel $(TOPLEVEL).t.v
CIRCUITS := $(TOPLEVEL).v alu.v memory.v lshift2.v instructionDecoder.v mux.v signextend.v regfile.v dff.v
