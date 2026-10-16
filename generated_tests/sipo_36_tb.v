`timescale 1ns/1ps

module tb_sipo;

reg clk;
reg reset;
reg di;
wire [3:0] do;

sipo uut (
    .reset(reset),
    .clk(clk),
    .di(di),
    .do(do)
);

initial begin
    // Initialize signals
    clk = 0;
    reset = 0;
    di = 0;

    // Apply reset
    reset = 1;
    #5;
    reset = 0;
    #5;

    // Test sequence
    // Shift in 4 bits: 1011
    di = 1; #10; // Shift in 1
    if (do !== 4'b0001) $display("FAIL: Expected do = 0001, got do = %b", do);
    di = 0; #10; // Shift in 0
    if (do !== 4'b0001) $display("FAIL: Expected do = 0001, got do = %b", do);
    di = 1; #10; // Shift in 1
    if (do !== 4'b1001) $display("FAIL: Expected do = 1001, got do = %b", do);
    di = 1; #10; // Shift in 1
    if (do !== 4'b1101) $display("FAIL: Expected do = 1101, got do = %b", do);
    
    // Reset the module
    reset = 1; #5;
    reset = 0; #5;

    // Check after reset
    if (do !== 4'b0000) $display("FAIL: Expected do = 0000 after reset, got do = %b", do);

    // Shift in 4 bits: 0110
    di = 0; #10; // Shift in 0
    if (do !== 4'b0000) $display("FAIL: Expected do = 0000, got do = %b", do);
    di = 1; #10; // Shift in 1
    if (do !== 4'b0001) $display("FAIL: Expected do = 0001, got do = %b", do);
    di = 1; #10; // Shift in 1
    if (do !== 4'b0011) $display("FAIL: Expected do = 0011, got do = %b", do);
    di = 0; #10; // Shift in 0
    if (do !== 4'b0111) $display("FAIL: Expected do = 0111, got do = %b", do);

    // If all checks pass
    $display("PASS");
    $finish;
end

always #5 clk = ~clk; // Clock generation

endmodule