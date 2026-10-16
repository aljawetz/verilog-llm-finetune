`timescale 1ns/1ps

module tb_piso_des;

reg [3:0] po;
reg clk;
wire si;

// Instantiate the module under test
piso_des uut (
    .clk(clk),
    .po(po),
    .si(si)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    po = 4'b0000;

    // Wait for the first clock edge
    #10;

    // Test case 1: Load 4'b1010
    po = 4'b1010;
    #10; // Wait for one clock cycle
    if (si !== 0) $display("FAIL: Expected si=0, got si=%b", si);

    // Test case 2: Load 4'b1010 again
    #10; // Wait for one clock cycle
    if (si !== 1) $display("FAIL: Expected si=1, got si=%b", si);

    // Test case 3: Load 4'b1100
    po = 4'b1100;
    #10; // Wait for one clock cycle
    if (si !== 0) $display("FAIL: Expected si=0, got si=%b", si);

    // Test case 4: Load 4'b1100 again
    #10; // Wait for one clock cycle
    if (si !== 1) $display("FAIL: Expected si=1, got si=%b", si);

    // Test case 5: Load 4'b0001
    po = 4'b0001;
    #10; // Wait for one clock cycle
    if (si !== 0) $display("FAIL: Expected si=0, got si=%b", si);

    // Test case 6: Load 4'b0001 again
    #10; // Wait for one clock cycle
    if (si !== 1) $display("FAIL: Expected si=1, got si=%b", si);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule