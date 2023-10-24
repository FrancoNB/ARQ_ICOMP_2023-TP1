//////////////////////////////////////////////////////////////////////////////////
// Company: Facultad de Ciencias Exactas Físicas y Naturales
// Authors: Robledo Valentin y Bottini Franco Nicolas 
// 
// Create Date: 24.10.2023 17:27:30
// Module Name: top_level
// Project Name: TP 1 - Arquitectura de Computadoras 2023 - Unidad Aritmetico Logica
// Description: Modulo de nivel superior para el testeo de la ALU implementada
// 
// Dependencies: top_level.vh, common.vh
// 
// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

`include "top_level.vh"
`include "common.vh"

module top_level
    #
    (
        parameter IO_BUS_WIDTH = 8
    )
    (
        input  [IO_BUS_WIDTH < `OP_CODE_WIDTH ? `OP_CODE_WIDTH : IO_BUS_WIDTH - 1 : 0] in_switches,
        input  [`SELECTORS_QUANTITY - 1 : 0] in_selectors,
        input                                in_reset,
        input                                in_clk,
        output wire [IO_BUS_WIDTH - 1 : 0]   wire_out_leds
    );
    
    reg [IO_BUS_WIDTH - 1: 0]     data_a;
    reg [IO_BUS_WIDTH - 1: 0]     data_b;
    reg [`OP_CODE_WIDTH - 1: 0]   op_code;
    
    wire [IO_BUS_WIDTH - 1: 0]     wire_data_a; 
    wire [IO_BUS_WIDTH - 1: 0]     wire_data_b; 
    wire [`OP_CODE_WIDTH - 1: 0]   wire_op_code;

    always @(posedge in_clk)
    begin
        if(in_reset)
        begin
            data_a  <= {IO_BUS_WIDTH {1'b0}};
            data_b  <= {IO_BUS_WIDTH {1'b0}};
            op_code <= {`OP_CODE_WIDTH {1'b0}};
        end
        
        case(in_selectors)
            `SELECT_IN_OP_CODE: op_code <= in_switches[`OP_CODE_WIDTH - 1 : 0];
            `SELECT_IN_DATA_A : data_a  <= in_switches[IO_BUS_WIDTH - 1 : 0];
            `SELECT_IN_DATA_B : data_b  <= in_switches[IO_BUS_WIDTH - 1 : 0];
        endcase
    end
    
    assign wire_data_a  = data_a;
    assign wire_data_b  = data_b;
    assign wire_op_code = op_code;
    
    ALU
    #(
      .IO_BUS_WIDTH(IO_BUS_WIDTH)
    )
    u_ALU
    (
      .op_code (wire_op_code),
      .data_a  (wire_data_a),
      .data_b  (wire_data_b),
      .out_data(wire_out_leds)
    );
endmodule
