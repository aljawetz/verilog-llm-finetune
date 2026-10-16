`timescale 1ns/1ps

module tb_pipo_behav;

reg clk;
reg rst;
reg [3:0] p_in;
wire [3:0] p_out;

// Instantiate the module under test (uut)
pipo_behav uut (
    .clk(clk),
    .rst(rst),
    .p_in(p_in),
    .p_out(p_out)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    rst = 1;
    p_in = 4'b0000;
    
    // Wait for a few clock cycles
    #10;
    
    // Release reset
    rst = 0;
    #10;

    // Test case 1: Check output after loading input
    p_in = 4'b1010; // Load input
    #10; // Wait for one clock cycle
    if (p_out !== 4'b1010) begin
        $display("FAIL: Expected p_out = 4'b1010, got p_out = %b", p_out);
        $finish;
    end

    // Test case 2: Check reset functionality
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (p_out !== 4'b0000) begin
        $display("FAIL: Expected p_out = 4'b0000 after reset, got p_out = %b", p_out);
        $finish;
    end

    // Test case 3: Check output after reset is released
    rst = 0; // Release reset
    p_in = 4'b1111; // Load new input
    #10; // Wait for one clock cycle
    if (p_out !== 4'b1111) begin
        $display("FAIL: Expected p_out = 4'b1111, got p_out = %b", p_out);
        $finish;
    end

    // Test case 4: Check multiple inputs
    p_in = 4'b0001; #10; // Load input
    if (p_out !== 4'b0001) begin
        $display("FAIL: Expected p_out = 4'b0001, got p_out = %b", p_out);
        $finish;
    end

    p_in = 4'b0010; #10; // Load input
    if (p_out !== 4'b0010) begin
        $display("FAIL: Expected p_out = 4'b0010, got p_out = %b", p_out);
        $finish;
    end

    // Final check for reset
    rst = 1; #10; // Assert reset
    if (p_out !== 4'b0000) begin
        $display("FAIL: Expected p_out = 4'b0000 after final reset, got p_out = %b", p_out);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule