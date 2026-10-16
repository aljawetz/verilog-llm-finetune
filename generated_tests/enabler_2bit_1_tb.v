`timescale 1ns/1ps

module tb_enabler_2bit;

    reg en;
    reg rst;
    reg [1:0] in0;
    wire [1:0] out0;

    // Instantiate the module under test (uut)
    enabler_2bit uut (
        .en(en),
        .rst(rst),
        .in0(in0),
        .out0(out0)
    );

    initial begin
        // Initialize signals
        en = 0;
        rst = 0;
        in0 = 2'b00;

        // Test 1: Reset functionality
        rst = 1; #10;
        if (out0 !== 2'b00) begin
            $display("FAIL: Reset did not set output to 00");
            $finish;
        end

        // Test 2: Enable with input
        rst = 0; 
        en = 1; 
        in0 = 2'b11; #10;
        if (out0 !== 2'b11) begin
            $display("FAIL: Output did not update to in0 when enabled");
            $finish;
        end

        // Test 3: Disable functionality
        en = 0; #10;
        if (out0 !== 2'b11) begin
            $display("FAIL: Output changed when disabled");
            $finish;
        end

        // Test 4: Reset again
        rst = 1; #10;
        if (out0 !== 2'b00) begin
            $display("FAIL: Reset did not set output to 00 again");
            $finish;
        end

        // Test 5: Enable with new input after reset
        rst = 0; 
        en = 1; 
        in0 = 2'b10; #10;
        if (out0 !== 2'b10) begin
            $display("FAIL: Output did not update to new in0 when enabled");
            $finish;
        end

        // Test 6: Check output holds when disabled
        en = 0; #10;
        if (out0 !== 2'b10) begin
            $display("FAIL: Output changed when disabled after enabling");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule