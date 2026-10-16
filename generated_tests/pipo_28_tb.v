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
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    reset = 0;
    di = 4'b0000;

    // Apply reset
    reset = 1;
    #10; // Wait for 10ns
    reset = 0;

    // Test case 1: Load data into the register
    di = 4'b1010; // Input data
    #10; // Wait for 10ns
    if (do !== 4'b1010) begin
        $display("FAIL: Expected do = 1010, got do = %b", do);
        $finish;
    end

    // Test case 2: Reset the register
    reset = 1;
    #10; // Wait for 10ns
    reset = 0;
    if (do !== 4'b0000) begin
        $display("FAIL: Expected do = 0000 after reset, got do = %b", do);
        $finish;
    end

    // Test case 3: Load another data into the register
    di = 4'b1111; // New input data
    #10; // Wait for 10ns
    if (do !== 4'b1111) begin
        $display("FAIL: Expected do = 1111, got do = %b", do);
        $finish;
    end

    // Test case 4: Load zero data
    di = 4'b0000; // Input data
    #10; // Wait for 10ns
    if (do !== 4'b0000) begin
        $display("FAIL: Expected do = 0000, got do = %b", do);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule