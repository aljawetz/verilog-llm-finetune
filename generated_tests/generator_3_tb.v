`timescale 1ns/1ps

module tb_generator;

reg clk;
reg reset;
wire signal;

// Instantiate the module under test
generator uut (
    .clk(clk),
    .reset(reset),
    .signal(signal)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    reset = 0;

    // Test sequence
    // Test 1: Reset the counter
    reset = 1;
    #10; // Wait for 10ns
    if (uut.counter !== 3'b000) begin
        $display("FAIL: Counter should be reset to 0");
        $finish;
    end

    // Test 2: Count up to 4
    reset = 0;
    #10; // Wait for 10ns
    if (uut.counter !== 3'b001) begin
        $display("FAIL: Counter should be 1 after 1 clock cycle");
        $finish;
    end

    #10; // Wait for 10ns
    if (uut.counter !== 3'b010) begin
        $display("FAIL: Counter should be 2 after 2 clock cycles");
        $finish;
    end

    #10; // Wait for 10ns
    if (uut.counter !== 3'b011) begin
        $display("FAIL: Counter should be 3 after 3 clock cycles");
        $finish;
    end

    #10; // Wait for 10ns
    if (uut.counter !== 3'b100) begin
        $display("FAIL: Counter should be 4 after 4 clock cycles");
        $finish;
    end

    // Test 3: Check signal output when counter is 4
    if (signal !== 1'b1) begin
        $display("FAIL: Signal should be 1 when counter is 4");
        $finish;
    end

    // Test 4: Check reset behavior after reaching 4
    #10; // Wait for 10ns
    if (uut.counter !== 3'b000) begin
        $display("FAIL: Counter should reset to 0 after reaching 4");
        $finish;
    end

    // Test 5: Check signal output after reset
    if (signal !== 1'b0) begin
        $display("FAIL: Signal should be 0 after reset");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule