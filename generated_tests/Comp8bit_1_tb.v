`timescale 1ns/1ps

module tb_Comp8bit;

    // Inputs
    reg [7:0] in1;
    reg [7:0] in2;

    // Outputs
    wire le;
    wire eq;
    wire gr;

    // Instantiate the Unit Under Test (UUT)
    Comp8bit uut (
        .in1(in1),
        .in2(in2),
        .le(le),
        .eq(eq),
        .gr(gr)
    );

    initial begin
        // Test case 1: in1 < in2
        in1 = 8'd5; in2 = 8'd10; #10;
        if (le !== 1'b1 || eq !== 1'b0 || gr !== 1'b0) 
            $display("FAIL: Test case 1 failed (in1 < in2)");

        // Test case 2: in1 > in2
        in1 = 8'd15; in2 = 8'd10; #10;
        if (le !== 1'b0 || eq !== 1'b0 || gr !== 1'b1) 
            $display("FAIL: Test case 2 failed (in1 > in2)");

        // Test case 3: in1 == in2
        in1 = 8'd10; in2 = 8'd10; #10;
        if (le !== 1'b0 || eq !== 1'b1 || gr !== 1'b0) 
            $display("FAIL: Test case 3 failed (in1 == in2)");

        // Test case 4: in1 < in2 (boundary case)
        in1 = 8'd0; in2 = 8'd1; #10;
        if (le !== 1'b1 || eq !== 1'b0 || gr !== 1'b0) 
            $display("FAIL: Test case 4 failed (in1 < in2 boundary)");

        // Test case 5: in1 > in2 (boundary case)
        in1 = 8'd255; in2 = 8'd254; #10;
        if (le !== 1'b0 || eq !== 1'b0 || gr !== 1'b1) 
            $display("FAIL: Test case 5 failed (in1 > in2 boundary)");

        // Test case 6: in1 == in2 (boundary case)
        in1 = 8'd128; in2 = 8'd128; #10;
        if (le !== 1'b0 || eq !== 1'b1 || gr !== 1'b0) 
            $display("FAIL: Test case 6 failed (in1 == in2 boundary)");

        $display("PASS");
        $finish;
    end

endmodule