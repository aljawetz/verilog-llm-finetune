`timescale 1ns/1ps

module tb_pipo;

reg clk;
reg reset;
reg [3:0] di;
wire [3:0] do;

// Instantiate the module under test (uut)
pipo uut (
    .reset(reset),
    .clk(clk),
    .di(di),
    .do(do)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    reset = 1;
    di = 4'b0000;
    
    // Wait for a clock cycle
    #10;
    
    // Release reset
    reset = 0;
    #10;

    // Test case 1: Check output after reset
    di = 4'b1010; // Input data
    #10; // Wait for clock edge
    if (do !== 4'b1010) begin
        $display("FAIL: Output should be 1010 after clock edge with reset inactive");
        $finish;
    end

    // Test case 2: Check output when reset is active
    reset = 1;
    #10; // Wait for clock edge
    if (do !== 4'b0000) begin
        $display("FAIL: Output should be 0000 when reset is active");
        $finish;
    end

    // Test case 3: Check output after reset is released again
    reset = 0;
    di = 4'b1111; // New input data
    #10; // Wait for clock edge
    if (do !== 4'b1111) begin
        $display("FAIL: Output should be 1111 after clock edge with reset inactive");
        $finish;
    end

    // Test case 4: Check output with another input
    di = 4'b0011; // Another input data
    #10; // Wait for clock edge
    if (do !== 4'b0011) begin
        $display("FAIL: Output should be 0011 after clock edge with reset inactive");
        $finish;
    end

    // Test case 5: Check output when reset is active again
    reset = 1;
    #10; // Wait for clock edge
    if (do !== 4'b0000) begin
        $display("FAIL: Output should be 0000 when reset is active");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule