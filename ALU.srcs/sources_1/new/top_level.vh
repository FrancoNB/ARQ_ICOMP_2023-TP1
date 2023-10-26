`ifndef __TOP_LEVEL_VH__
`define __TOP_LEVEL_VH__
    `define SELECTORS_QUANTITY 3
    
    `define SELECT_IN_CLEAR    3'b000
    `define SELECT_IN_DATA_A   3'b001
    `define SELECT_IN_DATA_B   3'b010
    `define SELECT_IN_OP_CODE  3'b100
    
    `define SWITCHES_QUANTITY IO_BUS_WIDTH < `OP_CODE_WIDTH ? `OP_CODE_WIDTH : IO_BUS_WIDTH
`endif // __TOP_LEVEL_VH__