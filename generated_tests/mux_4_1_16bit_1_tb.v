`timescale 1ns/1ps

module tb_mux_4_1_16bit;

    // Parameters
    reg [15:0] in0, in1, in2, in3;
    reg [1:0] sel;
    wire [15:0] out0;

    // Instantiate the module under test (uut)
    mux_4_1_16bit uut (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .sel(sel),
        .out0(out0)
    );

    initial begin
        // Test case 1: Select in0
        in0 = 16'hAAAA; in1 = 16'hBBBB; in2 = 16'hCCCC; in3 = 16'hDDDD; sel = 2'b00;
        #10;
        if (out0 !== in0) begin
            $display("FAIL: Test case 1 failed, expected %h but got %h", in0, out0);
            $finish;
        end

        // Test case 2: Select in1
        sel = 2'b01;
        #10;
        if (out0 !== in1) begin
            $display("FAIL: Test case 2 failed, expected %h but got %h", in1, out0);
            $finish;
        end

        // Test case 3: Select in2
        sel = 2'b10;
        #10;
        if (out0 !== in2) begin
            $display("FAIL: Test case 3 failed, expected %h but got %h", in2, out0);
            $finish;
        end

        // Test case 4: Select in3
        sel = 2'b11;
        #10;
        if (out0 !== in3) begin
            $display("FAIL: Test case 4 failed, expected %h but got %h", in3, out0);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule