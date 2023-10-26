//////////////////////////////////////////////////////////////////////////////////
// Company: Facultad de Ciencias Exactas Físicas y Naturales
// Authors: Robledo Valentin y Bottini Franco Nicolas 
// 
// Module Name: tb_alu_random
// Project Name: TP 1 - Arquitectura de Computadoras 2023 - Unidad Aritmetico Logica
// Description: Modulo de testeo aleatorio para la ALU implementada
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

`include "ALU.vh"
`include "top_level.vh"
`include "common.vh"

`define REPEAT_TIMES 20

module tb_alu_random
    #(
        parameter IO_BUS_WIDTH = `IO_BUS_WIDTH
    );
    
    reg                                 clock;
    reg                                 in_reset;
    reg  [`SWITCHES_QUANTITY - 1 : 0]   in_switches;
    reg  [`SELECTORS_QUANTITY - 1 : 0]  in_selectors;
    
    wire [IO_BUS_WIDTH - 1 : 0]         out_leds;
    
    reg  signed [IO_BUS_WIDTH -  1 : 0] data_a;
    reg  signed [IO_BUS_WIDTH -  1 : 0] data_b;
    reg         [2 : 0]                 choise_op;
    
    always #5 clock = ~clock;
   
    task automatic generate_randoms();
    begin
        in_switches  = $random % (2 ** IO_BUS_WIDTH);
        in_selectors = `SELECT_IN_DATA_A;
        data_a       = in_switches;
        #10;
        in_selectors = `SELECT_IN_CLEAR;
        #10;
        in_switches  = $random % (2 ** IO_BUS_WIDTH);
        in_selectors = `SELECT_IN_DATA_B;
        data_b       = in_switches;
        #10
        in_selectors = `SELECT_IN_CLEAR;
        #10;
    end
    endtask
    
    task automatic ADD();
    begin
        $display("Suma %b + %b", data_a, data_b);
        
        #10 in_switches  = `OP_ADD;
        #10 in_selectors = `SELECT_IN_OP_CODE;
        #10;
        
        if ((data_a + data_b) == out_leds)
            $display("Respuesta correcta, resultado: %b", out_leds);
        else
            $display("Respuesta incorrecta, resultado: esperado %b, resultado obtenido %b", (data_a + data_b), out_leds);
            
        #10 in_selectors = `SELECT_IN_CLEAR;
    end
    endtask
    
    task automatic SUB();
    begin
        $display("Resta %b - %b", data_a, data_b);
    
        #10 in_switches  = `OP_SUB;
        #10 in_selectors = `SELECT_IN_OP_CODE;
        #10;
        
        if ((data_a - data_b) == out_leds)
            $display("Respuesta correcta, resultado: %b", out_leds);
        else
            $display("Respuesta incorrecta, resultado: esperado %b, resultado obtenido %b", (data_a - data_b), out_leds);
            
        #10 in_selectors = `SELECT_IN_CLEAR;
    end
    endtask

    task automatic AND();
    begin
        $display("And %b & %b", data_a, data_b);
    
        #10 in_switches  = `OP_AND;
        #10 in_selectors = `SELECT_IN_OP_CODE;
        #10;
        
        if ((data_a & data_b) == out_leds)
            $display("Respuesta correcta, resultado: %b", out_leds);
        else
            $display("Respuesta incorrecta, resultado: esperado %b, resultado obtenido %b", (data_a & data_b), out_leds);
            
        #10 in_selectors = `SELECT_IN_CLEAR;
    end
    endtask

    task automatic OR();
    begin
        $display("Or %b | %b", data_a, data_b);
    
        #10 in_switches  = `OP_OR;
        #10 in_selectors = `SELECT_IN_OP_CODE;
        #10;
        
        if ((data_a | data_b) == out_leds)
            $display("Respuesta correcta, resultado: %b", out_leds);
        else
            $display("Respuesta incorrecta, resultado: esperado %b, resultado obtenido %b", (data_a | data_b), out_leds);
            
        #10 in_selectors = `SELECT_IN_CLEAR;
    end
    endtask
    
    task automatic XOR();
    begin
        $display("Xor %b ^ %b", data_a, data_b);
    
        #10 in_switches  = `OP_XOR;
        #10 in_selectors = `SELECT_IN_OP_CODE;
        #10;
        
        if ((data_a ^ data_b) == out_leds)
            $display("Respuesta correcta, resultado: %b", out_leds);
        else
            $display("Respuesta incorrecta, resultado: esperado %b, resultado obtenido %b", (data_a ^ data_b), out_leds);
            
        #10 in_selectors = `SELECT_IN_CLEAR;
    end
    endtask
    
    task automatic SRA();
    begin
        $display("Sra %b >>> %b", data_a, data_b);
    
        #10 in_switches  = `OP_SRA;
        #10 in_selectors = `SELECT_IN_OP_CODE;
        #10;
        
        if ((data_a >>> data_b) == out_leds)
            $display("Respuesta correcta, resultado: %b", out_leds);
        else
            $display("Respuesta incorrecta, resultado: esperado %b, resultado obtenido %b", (data_a >>> data_b), out_leds);
            
        #10 in_selectors = `SELECT_IN_CLEAR;
    end
    endtask
    
    task automatic SRL();
    begin
        $display("Srl %b >> %b", data_a, data_b);
    
        #10 in_switches  = `OP_SRL;
        #10 in_selectors = `SELECT_IN_OP_CODE;
        #10;
        
        if ((data_a >> data_b) == out_leds)
            $display("Respuesta correcta, resultado: %b", out_leds);
        else
            $display("Respuesta incorrecta, resultado: esperado %b, resultado obtenido %b", (data_a >> data_b), out_leds);
            
        #10 in_selectors = `SELECT_IN_CLEAR;
    end
    endtask

    task automatic NOR();
    begin
        $display("Nor ~(%b | %b)", data_a, data_b);
    
        #10 in_switches  = `OP_NOR;
        #10 in_selectors = `SELECT_IN_OP_CODE;
        #10;
        
        if (~(data_a | data_b) == out_leds)
            $display("Respuesta correcta, resultado: %b", out_leds);
        else
            $display("Respuesta incorrecta, resultado: esperado %b, resultado obtenido %b", ~(data_a | data_b), out_leds);
            
        #10 in_selectors = `SELECT_IN_CLEAR;
    end
    endtask
    
    initial
    begin
        clock                          = `LOW;
        in_reset                       = `LOW;
        in_selectors                   = `SELECT_IN_CLEAR;
        #10 @(posedge clock) in_reset  = `HIGH;
        #10 @(posedge clock) in_reset  = `LOW;
        #10;
        
        repeat (`REPEAT_TIMES) 
        begin
            generate_randoms();
            
            $display("Operandos A: %b, B: %b", data_a, data_b);
            
            choise_op = $random % 8;
            
            case(choise_op)
                0: ADD();
                1: SUB();
                2: AND();
                3: OR();
                4: XOR();
                5: SRA();
                6: SRL();
                7: NOR();
            endcase
            
            #10;
        end
        
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
