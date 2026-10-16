`timescale 1ns/1ps

module tb_register32out;

    reg [31:0] Parallel_in;
    reg clk;
    reg rst;
    reg enable;
    wire [31:0] parallel_out;

    // Instantiate the module under test (uut)
    register32out uut (
        .Parallel_in(Parallel_in),
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .parallel_out(parallel_out)
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
        enable = 0;
        Parallel_in = 32'h00000000;

        // Wait for a clock cycle
        #10;

        // Release reset
        rst = 0;

        // Test case 1: Check output on reset
        #10;
        if (parallel_out !== 32'bz) begin
            $display("FAIL: Output should be high-impedance on reset");
            $finish;
        end

        // Test case 2: Enable and load value
        enable = 1;
        Parallel_in = 32'hA5A5A5A5;
        #10; // Wait for clock edge
        if (parallel_out !== 32'hA5A5A5A5) begin
            $display("FAIL: Output should be A5A5A5A5 after loading");
            $finish;
        end

        // Test case 3: Disable and check output
        enable = 0;
        Parallel_in = 32'h5A5A5A5A;
        #10; // Wait for clock edge
        if (parallel_out !== 32'hA5A5A5A5) begin
            $display("FAIL: Output should remain A5A5A5A5 when disabled");
            $finish;
        end

        // Test case 4: Enable again and load new value
        enable = 1;
        Parallel_in = 32'hFFFFFFFF;
        #10; // Wait for clock edge
        if (parallel_out !== 32'hFFFFFFFF) begin
            $display("FAIL: Output should be FFFFFFFF after loading new value");
            $finish;
        end

        // Test case 5: Reset again
        rst = 1;
        #10; // Wait for clock edge
        if (parallel_out !== 32'bz) begin
            $display("FAIL: Output should be high-impedance on reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule