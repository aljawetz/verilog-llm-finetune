`timescale 1ns/1ps

module tb_enabler_32bit;

    reg en;
    reg [31:0] in0;
    wire [31:0] out0;

    // Instantiate the module under test (uut)
    enabler_32bit uut (
        .en(en),
        .in0(in0),
        .out0(out0)
    );

    initial begin
        // Test case 1: Enable is high, expect output to match input
        en = 1;
        in0 = 32'hA5A5A5A5; // Test input
        #10; // Wait for 10 time units
        if (out0 !== in0) begin
            $display("FAIL: Test case 1 failed. Expected %h, got %h", in0, out0);
            $finish;
        end

        // Test case 2: Enable is low, expect output to be zero
        en = 0;
        in0 = 32'hA5A5A5A5; // Test input
        #10; // Wait for 10 time units
        if (out0 !== 32'd0) begin
            $display("FAIL: Test case 2 failed. Expected 0, got %h", out0);
            $finish;
        end

        // Test case 3: Enable is high, different input
        en = 1;
        in0 = 32'hFFFFFFFF; // Test input
        #10; // Wait for 10 time units
        if (out0 !== in0) begin
            $display("FAIL: Test case 3 failed. Expected %h, got %h", in0, out0);
            $finish;
        end

        // Test case 4: Enable is low, different input
        en = 0;
        in0 = 32'hFFFFFFFF; // Test input
        #10; // Wait for 10 time units
        if (out0 !== 32'd0) begin
            $display("FAIL: Test case 4 failed. Expected 0, got %h", out0);
            $finish;
        end

        // Test case 5: Enable is high, zero input
        en = 1;
        in0 = 32'd0; // Test input
        #10; // Wait for 10 time units
        if (out0 !== in0) begin
            $display("FAIL: Test case 5 failed. Expected %h, got %h", in0, out0);
            $finish;
        end

        // Test case 6: Enable is low, zero input
        en = 0;
        in0 = 32'd0; // Test input
        #10; // Wait for 10 time units
        if (out0 !== 32'd0) begin
            $display("FAIL: Test case 6 failed. Expected 0, got %h", out0);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule