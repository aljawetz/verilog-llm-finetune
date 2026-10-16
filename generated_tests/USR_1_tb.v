`timescale 1ns/1ps

module tb_USR;

reg [3:0] parallel_in;
reg serial_rightin;
reg serial_leftin;
reg [1:0] select;
reg clk;
reg rstN;
wire serial_rightout;
wire serial_leftout;
wire [3:0] parallel_out;

USR uut (
    .parallel_in(parallel_in),
    .serial_rightin(serial_rightin),
    .serial_leftin(serial_leftin),
    .select(select),
    .clk(clk),
    .rstN(rstN),
    .serial_rightout(serial_rightout),
    .serial_leftout(serial_leftout),
    .parallel_out(parallel_out)
);

initial begin
    // Initialize signals
    clk = 0;
    rstN = 0;
    parallel_in = 4'b0000;
    serial_rightin = 0;
    serial_leftin = 0;
    select = 2'b00;

    // Release reset
    #5 rstN = 1;

    // Test 1: Parallel Load
    parallel_in = 4'b1010; // Load 1010
    select = 2'b11; // Select parallel load
    #10;
    if (parallel_out !== 4'b1010) begin
        $display("FAIL: Parallel load failed");
        $finish;
    end

    // Test 2: Shift Right
    select = 2'b01; // Select right shift
    serial_rightin = 1; // Shift in 1
    #10;
    if (parallel_out !== 4'b1101) begin
        $display("FAIL: Right shift failed");
        $finish;
    end

    // Test 3: Shift Left
    select = 2'b10; // Select left shift
    serial_leftin = 1; // Shift in 1
    #10;
    if (parallel_out !== 4'b1011) begin
        $display("FAIL: Left shift failed");
        $finish;
    end

    // Test 4: Retain Value
    select = 2'b00; // Do nothing
    #10;
    if (parallel_out !== 4'b1011) begin
        $display("FAIL: Retain value failed");
        $finish;
    end

    // Test 5: Shift Right with Serial Input
    select = 2'b01; // Select right shift
    serial_rightin = 0; // Shift in 0
    #10;
    if (parallel_out !== 4'b0101) begin
        $display("FAIL: Right shift with serial input failed");
        $finish;
    end

    // Test 6: Shift Left with Serial Input
    select = 2'b10; // Select left shift
    serial_leftin = 0; // Shift in 0
    #10;
    if (parallel_out !== 4'b1010) begin
        $display("FAIL: Left shift with serial input failed");
        $finish;
    end

    // Final Output Check
    if (serial_rightout !== parallel_out[3] || serial_leftout !== parallel_out[0]) begin
        $display("FAIL: Serial output mismatch");
        $finish;
    end

    $display("PASS");
    $finish;
end

always #5 clk = ~clk; // Clock generation

endmodule