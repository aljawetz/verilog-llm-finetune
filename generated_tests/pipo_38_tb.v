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
    
    // Wait for a clock edge
    #10;
    
    // Release reset
    reset = 0;
    
    // Test case 1: Check output when input is 4'b1010
    di = 4'b1010;
    #10; // Wait for one clock cycle
    if (do !== 4'b1010) begin
        $display("FAIL: Expected output 4'b1010, got %b", do);
        $finish;
    end
    
    // Test case 2: Check output when input is 4'b1111
    di = 4'b1111;
    #10; // Wait for one clock cycle
    if (do !== 4'b1111) begin
        $display("FAIL: Expected output 4'b1111, got %b", do);
        $finish;
    end
    
    // Test case 3: Check output after reset
    reset = 1;
    #10; // Wait for one clock cycle
    if (do !== 4'b0000) begin
        $display("FAIL: Expected output 4'b0000 after reset, got %b", do);
        $finish;
    end
    
    // Test case 4: Check output after releasing reset
    reset = 0;
    di = 4'b0011;
    #10; // Wait for one clock cycle
    if (do !== 4'b0011) begin
        $display("FAIL: Expected output 4'b0011, got %b", do);
        $finish;
    end
    
    // Test case 5: Check output with another input
    di = 4'b0101;
    #10; // Wait for one clock cycle
    if (do !== 4'b0101) begin
        $display("FAIL: Expected output 4'b0101, got %b", do);
        $finish;
    end
    
    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule