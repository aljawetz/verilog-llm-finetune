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
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    p_in = 4'b0000;

    // Test reset functionality
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (p_out !== 4'b0000) begin
        $display("FAIL: Reset did not set p_out to 0");
        $finish;
    end

    rst = 0; // Deassert reset
    #10; // Wait for one clock cycle

    // Test input assignment
    p_in = 4'b1010; // Set input
    #10; // Wait for one clock cycle
    if (p_out !== 4'b1010) begin
        $display("FAIL: p_out did not match p_in after clock edge");
        $finish;
    end

    p_in = 4'b1100; // Change input
    #10; // Wait for one clock cycle
    if (p_out !== 4'b1100) begin
        $display("FAIL: p_out did not match p_in after clock edge");
        $finish;
    end

    // Test reset again
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (p_out !== 4'b0000) begin
        $display("FAIL: Reset did not set p_out to 0");
        $finish;
    end

    // Finalize the simulation
    $display("PASS");
    $finish;
end

endmodule