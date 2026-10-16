`timescale 1ns/1ps

module tb_enabler_12bit;

    reg en;
    reg [11:0] in0;
    wire [11:0] out0;

    // Instantiate the module under test (uut)
    enabler_12bit uut (
        .en(en),
        .in0(in0),
        .out0(out0)
    );

    initial begin
        // Test case 1: Enable is high, input is non-zero
        en = 1;
        in0 = 12'hABC; // Arbitrary non-zero value
        #10; // Wait for 10 time units
        if (out0 !== 12'hABC) begin
            $display("FAIL: Test case 1 failed, expected %h but got %h", 12'hABC, out0);
            $finish;
        end

        // Test case 2: Enable is low, input is non-zero
        en = 0;
        in0 = 12'hDEF; // Another arbitrary non-zero value
        #10; // Wait for 10 time units
        if (out0 !== 12'h000) begin
            $display("FAIL: Test case 2 failed, expected %h but got %h", 12'h000, out0);
            $finish;
        end

        // Test case 3: Enable is high, input is zero
        en = 1;
        in0 = 12'h000; // Zero input
        #10; // Wait for 10 time units
        if (out0 !== 12'h000) begin
            $display("FAIL: Test case 3 failed, expected %h but got %h", 12'h000, out0);
            $finish;
        end

        // Test case 4: Enable is low, input is zero
        en = 0;
        in0 = 12'h000; // Zero input
        #10; // Wait for 10 time units
        if (out0 !== 12'h000) begin
            $display("FAIL: Test case 4 failed, expected %h but got %h", 12'h000, out0);
            $finish;
        end

        // Test case 5: Enable toggles
        en = 1;
        in0 = 12'h123; // Non-zero input
        #10; // Wait for 10 time units
        if (out0 !== 12'h123) begin
            $display("FAIL: Test case 5 failed, expected %h but got %h", 12'h123, out0);
            $finish;
        end
        
        en = 0;
        #10; // Wait for 10 time units
        if (out0 !== 12'h000) begin
            $display("FAIL: Test case 5 failed after disabling, expected %h but got %h", 12'h000, out0);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule