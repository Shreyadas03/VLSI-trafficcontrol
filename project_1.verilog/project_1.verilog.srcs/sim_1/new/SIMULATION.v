`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2024 02:11:00
// Design Name: 
// Module Name: SIMULATION
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SIMULATION;
    reg clk, rst;
    wire [2:0] light_M1;
    wire [2:0] light_S;
    wire [2:0] light_MT;
    wire [2:0] light_M2;

    trafficlight dut(
        .clk(clk),
        .rst(rst),
        .light_M1(light_M1),
        .light_S(light_S),
        .light_MT(light_MT),
        .light_M2(light_M2)
    );

    initial begin
        clk = 1'b0;
        forever #(10) clk = ~clk;  // Adjust the clock period for faster simulation
    end

    initial begin
        rst = 1;  // Start with reset asserted
        #50;      // Hold reset for 50 time units
        rst = 0;  // Deassert reset
        #(1000);  // Run simulation for a longer period to observe state transitions
        $finish;
    end

    initial begin
        $monitor("Time=%0d clk=%b rst=%b light_M1=%b light_S=%b light_MT=%b light_M2=%b",
                  $time, clk, rst, light_M1, light_S, light_MT, light_M2);
    end
endmodule
