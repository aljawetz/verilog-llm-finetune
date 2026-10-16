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
    #10; // Wait for 10ns

    // Test reset functionality
    if (p_out !== 4'b0000) begin
        $display("FAIL: Output not zero after reset");
        $finish;
    end

    // Release reset
    rst = 0;
    #10; // Wait for 10ns

    // Test input assignment
    p_in = 4'b1010; // Set input to 10
    #10; // Wait for 10ns
    if (p_out !== 4'b1010) begin
        $display("FAIL: Output not equal to input after clock edge");
        $finish;
    end

    // Test another input value
    p_in = 4'b1100; // Set input to 12
    #10; // Wait for 10ns
    if (p_out !== 4'b1100) begin
        $display("FAIL: Output not equal to input after clock edge");
        $finish;
    end

    // Test reset again
    rst = 1;
    #10; // Wait for 10ns
    if (p_out !== 4'b0000) begin
        $display("FAIL: Output not zero after reset");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule