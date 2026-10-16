`timescale 1ns/1ps

module tb_mux_4_1_3bit;

    // Testbench signals
    reg [2:0] in0, in1, in2, in3;
    reg [1:0] sel;
    wire [2:0] out0;

    // Instantiate the module under test (uut)
    mux_4_1_3bit uut (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .sel(sel),
        .out0(out0)
    );

    initial begin
        // Test case 1: Select in0
        in0 = 3'b000; in1 = 3'b001; in2 = 3'b010; in3 = 3'b011; sel = 2'b00;
        #10;
        if (out0 !== 3'b000) $display("FAIL: Test case 1 failed, expected 000, got %b", out0);

        // Test case 2: Select in1
        sel = 2'b01;
        #10;
        if (out0 !== 3'b001) $display("FAIL: Test case 2 failed, expected 001, got %b", out0);

        // Test case 3: Select in2
        sel = 2'b10;
        #10;
        if (out0 !== 3'b010) $display("FAIL: Test case 3 failed, expected 010, got %b", out0);

        // Test case 4: Select in3
        sel = 2'b11;
        #10;
        if (out0 !== 3'b011) $display("FAIL: Test case 4 failed, expected 011, got %b", out0);

        // Test case 5: Select in0 with different values
        in0 = 3'b101; in1 = 3'b110; in2 = 3'b111; in3 = 3'b000; sel = 2'b00;
        #10;
        if (out0 !== 3'b101) $display("FAIL: Test case 5 failed, expected 101, got %b", out0);

        // Test case 6: Select in1 with different values
        sel = 2'b01;
        #10;
        if (out0 !== 3'b110) $display("FAIL: Test case 6 failed, expected 110, got %b", out0);

        // Test case 7: Select in2 with different values
        sel = 2'b10;
        #10;
        if (out0 !== 3'b111) $display("FAIL: Test case 7 failed, expected 111, got %b", out0);

        // Test case 8: Select in3 with different values
        sel = 2'b11;
        #10;
        if (out0 !== 3'b000) $display("FAIL: Test case 8 failed, expected 000, got %b", out0);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule