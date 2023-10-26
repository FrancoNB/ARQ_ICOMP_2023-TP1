//////////////////////////////////////////////////////////////////////////////////
// Company: Facultad de Ciencias Exactas Físicas y Naturales
// Authors: Robledo Valentin y Bottini Franco Nicolas 
// 
// Module Name: tb_alu
// Project Name: TP 1 - Arquitectura de Computadoras 2023 - Unidad Aritmetico Logica
// Description: Modulo de testeo simple para la ALU implementada
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

`include "ALU.vh"
`include "top_level.vh"
`include "common.vh"

module tb_alu
    #(
        parameter IO_BUS_WIDTH = `IO_BUS_WIDTH
    );
    
    reg                                clock;
    reg                                in_reset;
    reg  [`SWITCHES_QUANTITY - 1 : 0]  in_switches;
    reg  [`SELECTORS_QUANTITY - 1 : 0] in_selectors;
    
    wire [IO_BUS_WIDTH - 1 : 0]        out_leds;

   always #5 clock = ~clock;
   
    initial
    begin
        clock            =  `LOW;
        in_switches     <=  {`SWITCHES_QUANTITY {`LOW}};
        in_selectors    <=  `SELECT_IN_CLEAR;
        
        #10 @(posedge clock) in_reset = `HIGH;
        
        #10 in_reset                 = `LOW;
        #10 in_switches              = `IO_BUS_WIDTH'b11;
        #10 in_selectors             = `SELECT_IN_DATA_A;
        #10 in_selectors             = `SELECT_IN_CLEAR;
        #10 in_switches              = `IO_BUS_WIDTH'b10;
        #10 in_selectors             = `SELECT_IN_DATA_B;
        #10 in_selectors             = `SELECT_IN_CLEAR;
        #10 in_switches              = `OP_ADD;
        #10 in_selectors             = `SELECT_IN_OP_CODE;
        #10 in_selectors             = `SELECT_IN_CLEAR;
        #10 $finish;
    end
    
    top_level
    #(
        .IO_BUS_WIDTH(IO_BUS_WIDTH)
    )
    u_top_level
    (
        .in_selectors (in_selectors),
        .in_switches  (in_switches),
        .out_leds     (out_leds),
        .in_reset     (in_reset),
        .in_clk       (clock)
    );
    
endmodule
