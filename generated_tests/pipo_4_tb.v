`timescale 1ns/1ps

module tb_pipo;

    reg clk;
    reg rst;
    reg [3:0] d;
    wire [3:0] q;

    // Instantiate the module under test (uut)
    pipo uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
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
        d = 4'b0000;

        // Wait for a clock edge
        #10;

        // Test reset functionality
        if (q !== 4'b0000) begin
            $display("FAIL: q should be 0 when rst is high");
            $finish;
        end

        // Release reset
        rst = 0;
        #10;

        // Load value into q
        d = 4'b1010; // Test value
        #10;

        if (q !== 4'b1010) begin
            $display("FAIL: q should be 1010 after loading d");
            $finish;
        end

        // Change input value
        d = 4'b1111; // New test value
        #10;

        if (q !== 4'b1111) begin
            $display("FAIL: q should be 1111 after loading new d");
            $finish;
        end

        // Test reset again
        rst = 1;
        #10;

        if (q !== 4'b0000) begin
            $display("FAIL: q should be 0 when rst is high again");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule