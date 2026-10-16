`timescale 1ns/1ps

module tb_ring_counter;

reg clk;
reg init;
wire [7:0] count;

// Instantiate the ring counter module
ring_counter uut (
    .clk(clk),
    .init(init),
    .count(count)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    init = 0;

    // Test initialization
    init = 1; // Set init high to initialize the counter
    #10; // Wait for one clock cycle
    init = 0; // Set init low

    // Check initial value
    if (count !== 8'b10000000) begin
        $display("FAIL: Initial count is not 10000000");
        $finish;
    end

    // Wait for a few clock cycles and check the output
    #10; // Wait for 1 clock cycle
    if (count !== 8'b00000001) begin
        $display("FAIL: Count after 1 cycle is not 00000001");
        $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 8'b00000010) begin
        $display("FAIL: Count after 2 cycles is not 00000010");
        $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 8'b00000100) begin
        $display("FAIL: Count after 3 cycles is not 00000100");
        $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 8'b00001000) begin
        $display("FAIL: Count after 4 cycles is not 00001000");
        $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 8'b00010000) begin
        $display("FAIL: Count after 5 cycles is not 00010000");
        $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 8'b00100000) begin
        $display("FAIL: Count after 6 cycles is not 00100000");
        $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 8'b01000000) begin
        $display("FAIL: Count after 7 cycles is not 01000000");
        $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 8'b10000000) begin
        $display("FAIL: Count after 8 cycles is not 10000000");
        $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule