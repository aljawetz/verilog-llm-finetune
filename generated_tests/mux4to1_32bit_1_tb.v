`timescale 1ns/1ps

module tb_mux4to1_32bit;

    reg [31:0] in0;
    reg [31:0] in1;
    reg [31:0] in2;
    reg [31:0] in3;
    reg [1:0] sel;
    wire [31:0] out0;

    // Instantiate the module under test (uut)
    mux4to1_32bit uut (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .sel(sel),
        .out0(out0)
    );

    initial begin
        // Initialize inputs
        in0 = 32'h00000001;
        in1 = 32'h00000002;
        in2 = 32'h00000003;
        in3 = 32'h00000004;
        sel = 2'b00;

        // Test cases
        #10;
        if (out0 !== in0) begin
            $display("FAIL: Expected %h, got %h for sel = 00", in0, out0);
            $finish;
        end

        sel = 2'b01;
        #10;
        if (out0 !== in1) begin
            $display("FAIL: Expected %h, got %h for sel = 01", in1, out0);
            $finish;
        end

        sel = 2'b10;
        #10;
        if (out0 !== in2) begin
            $display("FAIL: Expected %h, got %h for sel = 10", in2, out0);
            $finish;
        end

        sel = 2'b11;
        #10;
        if (out0 !== in3) begin
            $display("FAIL: Expected %h, got %h for sel = 11", in3, out0);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule