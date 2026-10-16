`timescale 1ns/1ps

module tb_reg4_32bit;

    reg clk;
    reg [31:0] in0, in1, in2, in3;
    wire [31:0] out0, out1, out2, out3;

    // Instantiate the module under test (uut)
    reg4_32bit uut (
        .clk(clk),
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
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        in0 = 32'hA5A5A5A5;
        in1 = 32'h5A5A5A5A;
        in2 = 32'hFFFFFFFF;
        in3 = 32'h00000000;

        // Wait for the first clock edge
        #10;
        if (out0 !== 32'hA5A5A5A5 || out1 !== 32'h5A5A5A5A || out2 !== 32'hFFFFFFFF || out3 !== 32'h00000000) begin
            $display("FAIL: Outputs do not match expected values after first clock edge");
            $finish;
        end

        // Change inputs
        in0 = 32'h12345678;
        in1 = 32'h87654321;
        in2 = 32'hDEADBEEF;
        in3 = 32'hCAFEBABE;

        // Wait for the second clock edge
        #10;
        if (out0 !== 32'h12345678 || out1 !== 32'h87654321 || out2 !== 32'hDEADBEEF || out3 !== 32'hCAFEBABE) begin
            $display("FAIL: Outputs do not match expected values after second clock edge");
            $finish;
        end

        // Change inputs again
        in0 = 32'hFFFFFFFF;
        in1 = 32'h00000000;
        in2 = 32'hAAAAAAAA;
        in3 = 32'h55555555;

        // Wait for the third clock edge
        #10;
        if (out0 !== 32'hFFFFFFFF || out1 !== 32'h00000000 || out2 !== 32'hAAAAAAAA || out3 !== 32'h55555555) begin
            $display("FAIL: Outputs do not match expected values after third clock edge");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule