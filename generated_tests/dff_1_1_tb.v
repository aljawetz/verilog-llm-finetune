`timescale 1ns/1ps

module tb_dff_1;

reg D;
reg clk;
reg rst;
wire Q;
wire Q_not;

// Instantiate the module under test (uut)
dff_1 uut (
    .D(D),
    .clk(clk),
    .rst(rst),
    .Q(Q),
    .Q_not(Q_not)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    D = 0;
    rst = 0;

    // Test reset functionality
    rst = 1; // Assert reset
    #10; // Wait for a clock edge
    if (Q !== 1'b0 || Q_not !== 1'b1) begin
        $display("FAIL: Reset did not set Q to 0 and Q_not to 1");
        $finish;
    end

    rst = 0; // Deassert reset
    #10; // Wait for a clock edge

    // Test D flip-flop functionality
    D = 1; // Set D to 1
    #10; // Wait for a clock edge
    if (Q !== 1'b1 || Q_not !== 1'b0) begin
        $display("FAIL: Q did not follow D when D is 1");
        $finish;
    end

    D = 0; // Set D to 0
    #10; // Wait for a clock edge
    if (Q !== 1'b0 || Q_not !== 1'b1) begin
        $display("FAIL: Q did not follow D when D is 0");
        $finish;
    end

    // Additional test cases
    D = 1; // Set D to 1
    #10; // Wait for a clock edge
    if (Q !== 1'b1 || Q_not !== 1'b0) begin
        $display("FAIL: Q did not follow D when D is 1 again");
        $finish;
    end

    // End of test
    $display("PASS");
    $finish;
end

endmodule