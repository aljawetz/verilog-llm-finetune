`timescale 1ns/1ps

module tb_mux_4_1_1bit;

    // Testbench signals
    reg in0, in1, in2, in3;
    reg [1:0] sel;
    wire out0;

    // Instantiate the module under test (uut)
    mux_4_1_1bit uut (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .sel(sel),
        .out0(out0)
    );

    initial begin
        // Test case 1: Select in0
        in0 = 1'b0; in1 = 1'b1; in2 = 1'b0; in3 = 1'b1; sel = 2'b00;
        #10;
        if (out0 !== in0) $display("FAIL: Test case 1 failed, expected %b but got %b", in0, out0);

        // Test case 2: Select in1
        sel = 2'b01;
        #10;
        if (out0 !== in1) $display("FAIL: Test case 2 failed, expected %b but got %b", in1, out0);

        // Test case 3: Select in2
        sel = 2'b10;
        #10;
        if (out0 !== in2) $display("FAIL: Test case 3 failed, expected %b but got %b", in2, out0);

        // Test case 4: Select in3
        sel = 2'b11;
        #10;
        if (out0 !== in3) $display("FAIL: Test case 4 failed, expected %b but got %b", in3, out0);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule