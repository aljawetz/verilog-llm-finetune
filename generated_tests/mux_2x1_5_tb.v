`timescale 1ns/1ps

module tb_mux_2x1;
    parameter BITS = 4;

    reg [BITS - 1 : 0] in0;
    reg [BITS - 1 : 0] in1;
    reg sel;
    wire [BITS - 1 : 0] out;

    // Instantiate the module under test (uut)
    mux_2x1 #(BITS) uut (
        .in0(in0),
        .in1(in1),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test case 1: sel = 0, expect out = in0
        in0 = 4'b1010; 
        in1 = 4'b0101; 
        sel = 0; 
        #10;
        if (out !== in0) begin
            $display("FAIL: Test case 1 failed, expected out = %b, got out = %b", in0, out);
            $finish;
        end

        // Test case 2: sel = 1, expect out = in1
        sel = 1; 
        #10;
        if (out !== in1) begin
            $display("FAIL: Test case 2 failed, expected out = %b, got out = %b", in1, out);
            $finish;
        end

        // Test case 3: Change inputs and test again
        in0 = 4'b1111; 
        in1 = 4'b0000; 
        sel = 0; 
        #10;
        if (out !== in0) begin
            $display("FAIL: Test case 3 failed, expected out = %b, got out = %b", in0, out);
            $finish;
        end

        sel = 1; 
        #10;
        if (out !== in1) begin
            $display("FAIL: Test case 4 failed, expected out = %b, got out = %b", in1, out);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end
endmodule