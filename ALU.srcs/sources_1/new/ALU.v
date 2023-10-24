//////////////////////////////////////////////////////////////////////////////////
// Company: Facultad de Ciencias Exactas Físicas y Naturales
// Authors: Robledo Valentin y Bottini Franco Nicolas 
// 
// Create Date: 24.10.2023 17:27:30
// Module Name: ALU
// Project Name: TP 1 - Arquitectura de Computadoras 2023 - Unidad Aritmetico Logica
// Description: Implementación de una unidad aritmetico logica con las operaciones ADD, SUB, AND, OR, XOR, SRA, SRL, NOR, RESET
// 
// Dependencies: ALU.vh, common.vh
// 
// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////

`include "ALU.vh"
`include "common.vh"

`timescale 1ns / 1ps

module ALU
    #
    (
        parameter IO_BUS_WIDTH = 8
    )
    (
        input  wire [`OP_CODE_WIDTH - 1 : 0] op_code, 
        input  wire [IO_BUS_WIDTH - 1 : 0]   data_a,
        input  wire [IO_BUS_WIDTH - 1 : 0]   data_b,
        
        output wire [IO_BUS_WIDTH - 1 : 0]   out_data
    );
    
    reg[IO_BUS_WIDTH - 1 : 0] result;
    
    always@(*)
    begin
        case(op_code)
            `OP_ADD  : result <= data_a + data_b;
            `OP_SUB  : result <= data_a - data_b;
            `OP_AND  : result <= data_a & data_b;
            `OP_OR   : result <= data_a | data_b;
            `OP_XOR  : result <= data_a ^ data_b;
            `OP_SRA  : result <= data_a >> data_b;
            `OP_SRL  : result <= data_a >>> data_b;
            `OP_NOR  : result <= ~(data_a | data_b);
            default  : result <= {IO_BUS_WIDTH {1'bz}};
        endcase
    end
    
    assign out_data = result; 
    
endmodule