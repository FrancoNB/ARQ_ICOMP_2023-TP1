Arquitectura de Computadoras - 2023 - Trabajo Práctico I

# Trabajo Práctico N°1 - Implementación de una Unidad Aritmético Lógica (ALU)

## Repositorio

https://github.com/FrancoNB/ARQ_ICOMP_2023-TP1

## Autores

Nombres: Valentin Robledo, Franco Bottini

Usuarios en github: valentinrb, FrancoNB

## Descripción General

El módulo ALU (Unidad Lógica Aritmética) es un componente esencial en cualquier sistema de procesamiento de datos. Este módulo, escrito en Verilog, es capaz de realizar una variedad de operaciones aritméticas y lógicas, que son fundamentales para la ejecución de instrucciones en un procesador.

## Parámetros

El módulo ALU tiene dos parámetros:

- `IO_BUS_WIDTH`: Este parámetro define el ancho del bus de entrada/salida. Es decir, determina el número de bits que pueden ser procesados simultáneamente por la ALU. Un ancho de bus mayor permite operar con números más grandes, pero también requiere más recursos de hardware.

- `OP_CODE_WIDTH`: Este parámetro define el ancho del código de operación. El código de operación es un valor binario que determina qué operación se va a realizar. Un ancho de código de operación mayor permite más operaciones diferentes, pero también requiere más recursos de hardware.

## Entradas

El módulo ALU tiene tres entradas:

- `op_code`: Esta entrada es un valor binario que determina qué operación se va a realizar. El valor de `op_code` se compara con las constantes definidas en "alu.vh" para determinar la operación.

- `data_a` y `data_b`: Estas entradas son los operandos sobre los que se realiza la operación. Son valores binarios de `IO_BUS_WIDTH` bits.

## Salida

El módulo ALU tiene una salida:

- `out_data`: Esta salida es el resultado de la operación realizada. Es un valor binario de `IO_BUS_WIDTH` bits.

## Operaciones

El módulo ALU puede realizar las siguientes operaciones, dependiendo del valor de `op_code`:

- `OP_ADD`: Suma `data_a` y `data_b`.
- `OP_SUB`: Resta `data_b` de `data_a`.
- `OP_AND`: Realiza la operación lógica AND entre `data_a` y `data_b`.
- `OP_OR`: Realiza la operación lógica OR entre `data_a` y `data_b`.
- `OP_XOR`: Realiza la operación lógica XOR entre `data_a` y `data_b`.
- `OP_SRA`: Realiza un desplazamiento aritmético a la derecha en `data_a` por la cantidad especificada en `data_b`.
- `OP_SRL`: Realiza un desplazamiento lógico a la derecha en `data_a` por la cantidad especificada en `data_b`.
- `OP_NOR`: Realiza la operación lógica NOR entre `data_a` y `data_b`.

Si el `op_code` no coincide con ninguna de las operaciones definidas, el resultado será indeterminado (`1'bz`).

## Test Benches

## Random

El módulo `tb_alu_random` es un banco de pruebas (test bench) que se utiliza para verificar el correcto funcionamiento de la ALU. Este módulo genera entradas aleatorias para la ALU y verifica que las salidas sean las esperadas.

### Funcionamiento

El módulo `tb_alu_random` genera valores aleatorios para `data_a` y `data_b`, y luego realiza una serie de operaciones en estos valores. Para cada operación, verifica que la salida de la ALU (`out_leds`) sea igual al resultado esperado de la operación.

Las operaciones que se prueban son:

- Suma (`ADD`)
- Resta (`SUB`)
- AND lógico (`AND`)
- OR lógico (`OR`)
- XOR lógico (`XOR`)
- Desplazamiento aritmético a la derecha (`SRA`)
- Desplazamiento lógico a la derecha (`SRL`)
- NOR lógico (`NOR`)

Para cada operación, el módulo `tb_alu_random` muestra un mensaje indicando si la salida de la ALU fue la esperada o no.

### Uso

Para utilizar el módulo `tb_alu_random`, se debe instanciar en un entorno de simulación de Verilog. El módulo se ejecutará automáticamente, generando entradas aleatorias para la ALU y verificando las salidas.

El módulo `tb_alu_random` se ejecuta en un ciclo infinito, por lo que continuará generando y verificando operaciones hasta que se detenga la simulación.

### Parámetros

El módulo `tb_alu_random` tiene un parámetro:

- `IO_BUS_WIDTH`: Define el ancho del bus de entrada/salida, al igual que en el módulo ALU.

### Entradas y Salidas

El módulo `tb_alu_random` tiene varias entradas y salidas que se conectan a la ALU. Estas incluyen `in_switches` y `in_selectors`, que se utilizan para controlar las operaciones de la ALU, y `out_leds`, que se utiliza para leer la salida de la ALU.

## Simple

El módulo `tb_alu` es otro banco de pruebas (test bench) que se utiliza para verificar el correcto funcionamiento de la ALU. A diferencia del módulo `tb_alu_random`, este módulo no genera entradas aleatorias, sino que realiza una serie de operaciones predefinidas.

### Funcionamiento

El módulo `tb_alu` realiza una serie de operaciones en la ALU y verifica que las salidas sean las esperadas. Las operaciones que se realizan son:

1. Se establece `data_a` en `11` y `data_b` en `10`.
2. Se realiza una operación de suma (`OP_ADD`).

Para cada operación, el módulo `tb_alu` muestra un mensaje indicando si la salida de la ALU fue la esperada o no.

### Uso

Para utilizar el módulo `tb_alu`, se debe instanciar en un entorno de simulación de Verilog. El módulo se ejecutará automáticamente, realizando las operaciones predefinidas y verificando las salidas.

El módulo `tb_alu` se ejecuta una vez y luego termina la simulación.

### Parámetros

El módulo `tb_alu` tiene un parámetro:

- `IO_BUS_WIDTH`: Define el ancho del bus de entrada/salida, al igual que en el módulo ALU.

### Entradas y Salidas

El módulo `tb_alu` tiene varias entradas y salidas que se conectan a la ALU. Estas incluyen `in_switches` y `in_selectors`, que se utilizan para controlar las operaciones de la ALU, y `out_leds`, que se utiliza para leer la salida de la ALU.
