`timescale 1ns/1ps

module tb_UC4b;

reg clk;
reg rst;
wire [4:0] cnt;

// Instantiate the module under test (uut)
UC4b uut (
    .clk(clk),
    .rst(rst),
    .cnt(cnt)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns period
end

initial begin
    // Initialize signals
    clk = 0;
    rst = 0;

    // Test case 1: Reset the counter
    rst = 1; // Assert reset
    #10;     // Wait for 10ns
    if (cnt !== 5'b00000) begin
        $display("FAIL: Counter did not reset to zero");
        $finish;
    end

    // Test case 2: Release reset and count
    rst = 0; // Deassert reset
    #10;     // Wait for 10ns
    if (cnt !== 5'b00001) begin
        $display("FAIL: Counter did not increment to 1");
        $finish;
    end

    // Count up to 5
    #50;     // Wait for 50ns (5 clock cycles)
    if (cnt !== 5'b00110) begin
        $display("FAIL: Counter did not increment to 6");
        $finish;
    end

    // Test case 3: Reset again
    rst = 1; // Assert reset
    #10;     // Wait for 10ns
    if (cnt !== 5'b00000) begin
        $display("FAIL: Counter did not reset to zero after second reset");
        $finish;
    end

    // Test case 4: Count after reset
    rst = 0; // Deassert reset
    #10;     // Wait for 10ns
    if (cnt !== 5'b00001) begin
        $display("FAIL: Counter did not increment to 1 after reset");
        $finish;
    end

    // Count up to 15
    #100;    // Wait for 100ns (10 clock cycles)
    if (cnt !== 5'b01011) begin
        $display("FAIL: Counter did not increment to 11");
        $finish;
    end

    // End of test
    $display("PASS");
    $finish;
end

endmodule