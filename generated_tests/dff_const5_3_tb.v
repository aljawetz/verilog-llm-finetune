`timescale 1ns/1ps

module tb_dff_const5;

reg clk;
reg reset;
wire q;

// Instantiate the module under test
dff_const5 uut (
    .clk(clk),
    .reset(reset),
    .q(q)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    reset = 0;

    // Apply reset
    reset = 1;
    #10; // Wait for 10ns
    reset = 0;

    // Check initial output after reset
    if (q !== 1'b0) begin
        $display("FAIL: Initial output after reset is not 0");
        $finish;
    end

    // Wait for one clock cycle
    #10;

    // Check output after first clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: Output after first clock cycle is not 0");
        $finish;
    end

    // Wait for second clock cycle
    #10;

    // Check output after second clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: Output after second clock cycle is not 1");
        $finish;
    end

    // Wait for third clock cycle
    #10;

    // Check output after third clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: Output after third clock cycle is not 1");
        $finish;
    end

    // Wait for fourth clock cycle
    #10;

    // Check output after fourth clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: Output after fourth clock cycle is not 1");
        $finish;
    end

    // Wait for fifth clock cycle
    #10;

    // Check output after fifth clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: Output after fifth clock cycle is not 1");
        $finish;
    end

    // Finish the simulation
    $display("PASS");
    $finish;
end

endmodule