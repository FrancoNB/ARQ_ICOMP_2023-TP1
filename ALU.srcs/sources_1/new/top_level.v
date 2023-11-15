//////////////////////////////////////////////////////////////////////////////////
// Company: Facultad de Ciencias Exactas Físicas y Naturales
// Authors: Robledo Valentin y Bottini Franco Nicolas 
// 
// Module Name: top_level
// Project Name: TP 1 - Arquitectura de Computadoras 2023 - Unidad Aritmetico Logica
// Description: Modulo de nivel superior para la ALU implementada
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

`include "top_level.vh"
`include "ALU.vh"

module top_level
    #(
        parameter IO_BUS_WIDTH = `IO_BUS_WIDTH
    )
    (
        input  [`SWITCHES_QUANTITY - 1 : 0]  in_switches,
        input  [`SELECTORS_QUANTITY - 1 : 0] in_selectors,
        input                                in_reset,
        input                                in_clk,
        output [IO_BUS_WIDTH - 1 : 0]        out_leds
    );
    
    reg [IO_BUS_WIDTH - 1: 0]   data_a;
    reg [IO_BUS_WIDTH - 1: 0]   data_b;
    reg [`OP_CODE_WIDTH - 1: 0] op_code;

    always @(posedge in_clk)
    begin
        if(in_reset)
        begin
            data_a  <= {IO_BUS_WIDTH {1'b0}};
            data_b  <= {IO_BUS_WIDTH {1'b0}};
            op_code <= {`OP_CODE_WIDTH {1'b0}};
        end
        
        case(in_selectors)
            `SELECT_IN_DATA_A : data_a  <= in_switches[IO_BUS_WIDTH - 1 : 0];
            `SELECT_IN_DATA_B : data_b  <= in_switches[IO_BUS_WIDTH - 1 : 0];
            `SELECT_IN_OP_CODE: op_code <= in_switches[`OP_CODE_WIDTH - 1 : 0];
        endcase
    end
    
    alu
    #(
      .IO_BUS_WIDTH(IO_BUS_WIDTH)
    )
    u_alu
    (
      .op_code (op_code),
      .data_a  (data_a),
      .data_b  (data_b),
      .out_data(out_leds)
    );
endmodule
