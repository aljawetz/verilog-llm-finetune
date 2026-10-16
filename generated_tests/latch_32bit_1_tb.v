`timescale 1ns/1ps

module tb_latch_32bit;

    reg clk;
    reg active;
    reg [31:0] in0, in1, in2, in3;
    wire [31:0] out0, out1, out2, out3;

    // Instantiate the module under test
    latch_32bit uut (
        .clk(clk),
        .active(active),
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .out0(out0),
        .out1(out1),
        .out2(out2),
        .out3(out3)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize inputs
        active = 0;
        in0 = 32'hA5A5A5A5;
        in1 = 32'h5A5A5A5A;
        in2 = 32'hFFFFFFFF;
        in3 = 32'h00000000;

        // Wait for a clock cycle
        #10;

        // Test 1: Latch values when active is high
        active = 1;
        #10; // Wait for clock edge
        if (out0 !== in0 || out1 !== in1 || out2 !== in2 || out3 !== in3) begin
            $display("FAIL: Outputs do not match inputs when active is high");
            $finish;
        end

        // Test 2: Ensure outputs do not change when active is low
        active = 0;
        in0 = 32'hDEADBEEF;
        in1 = 32'hBEEFDEAD;
        in2 = 32'h12345678;
        in3 = 32'h87654321;
        #10; // Wait for clock edge
        if (out0 !== 32'hA5A5A5A5 || out1 !== 32'h5A5A5A5A || out2 !== 32'hFFFFFFFF || out3 !== 32'h00000000) begin
            $display("FAIL: Outputs changed when active is low");
            $finish;
        end

        // Test 3: Latch new values when active goes high again
        active = 1;
        #10; // Wait for clock edge
        if (out0 !== in0 || out1 !== in1 || out2 !== in2 || out3 !== in3) begin
            $display("FAIL: Outputs do not match new inputs when active is high again");
            $finish;
        end

        // Final check: Ensure outputs are latched correctly
        if (out0 !== 32'hDEADBEEF || out1 !== 32'hBEEFDEAD || out2 !== 32'h12345678 || out3 !== 32'h87654321) begin
            $display("FAIL: Outputs do not match expected latched values");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule