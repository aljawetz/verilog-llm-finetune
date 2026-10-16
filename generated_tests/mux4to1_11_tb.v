`timescale 1ns/1ps

module tb_mux4to1;

    reg [7:0] in0;
    reg [7:0] in1;
    reg [7:0] in2;
    reg [7:0] in3;
    reg [1:0] sel;
    wire [7:0] out;

    // Instantiate the module under test (uut)
    mux4to1 uut (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test case 1: Select in0
        in0 = 8'hAA; in1 = 8'hBB; in2 = 8'hCC; in3 = 8'hDD; sel = 2'b00;
        #10;
        if (out !== 8'hAA) $display("FAIL: Test case 1 failed, expected 0xAA, got %h", out);

        // Test case 2: Select in1
        sel = 2'b01;
        #10;
        if (out !== 8'hBB) $display("FAIL: Test case 2 failed, expected 0xBB, got %h", out);

        // Test case 3: Select in2
        sel = 2'b10;
        #10;
        if (out !== 8'hCC) $display("FAIL: Test case 3 failed, expected 0xCC, got %h", out);

        // Test case 4: Select in3
        sel = 2'b11;
        #10;
        if (out !== 8'hDD) $display("FAIL: Test case 4 failed, expected 0xDD, got %h", out);

        // Test case 5: Default case
        sel = 2'bxx; // Invalid select
        #10;
        if (out !== 8'b0) $display("FAIL: Test case 5 failed, expected 0x00, got %h", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule