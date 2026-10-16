`timescale 1ns/1ps

module tb_pipo;

    reg clk;
    reg rst;
    reg [3:0] x;
    reg load;
    wire [3:0] q;

    // Instantiate the module under test (uut)
    pipo uut (
        .clk(clk),
        .rst(rst),
        .x(x),
        .q(q),
        .load(load)
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
        load = 0;
        x = 4'b0000;

        // Wait for a clock edge
        #10;

        // Release reset
        rst = 0;

        // Test loading value into q
        x = 4'b1010; // Load 1010
        load = 1;   // Set load high
        #10;        // Wait for clock edge
        load = 0;   // Set load low

        // Check if q is loaded correctly
        if (q !== 4'b1010) begin
            $display("FAIL: q should be 1010 after loading");
            $finish;
        end

        // Test shifting right
        #10; // Wait for clock edge
        if (q !== 4'b0101) begin
            $display("FAIL: q should be 0101 after shifting");
            $finish;
        end

        // Test reset functionality
        rst = 1; // Assert reset
        #10;     // Wait for clock edge
        if (q !== 4'b0000) begin
            $display("FAIL: q should be 0000 after reset");
            $finish;
        end

        // Test loading another value
        rst = 0; // Deassert reset
        x = 4'b1111; // Load 1111
        load = 1;   // Set load high
        #10;        // Wait for clock edge
        load = 0;   // Set load low

        // Check if q is loaded correctly
        if (q !== 4'b1111) begin
            $display("FAIL: q should be 1111 after loading");
            $finish;
        end

        // Test shifting right again
        #10; // Wait for clock edge
        if (q !== 4'b0111) begin
            $display("FAIL: q should be 0111 after shifting");
            $finish;
        end

        // Final check for multiple shifts
        #10; // Wait for clock edge
        if (q !== 4'b0011) begin
            $display("FAIL: q should be 0011 after shifting");
            $finish;
        end

        #10; // Wait for clock edge
        if (q !== 4'b0001) begin
            $display("FAIL: q should be 0001 after shifting");
            $finish;
        end

        #10; // Wait for clock edge
        if (q !== 4'b0000) begin
            $display("FAIL: q should be 0000 after shifting");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule