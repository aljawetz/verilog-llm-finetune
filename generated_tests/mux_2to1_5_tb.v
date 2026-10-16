`timescale 1ns/1ps

module tb_mux_2to1;

    // Inputs
    reg a_in;
    reg b_in;
    reg sel_in;

    // Output
    wire out;

    // Instantiate the Unit Under Test (UUT)
    mux_2to1 uut (
        .a_in(a_in),
        .b_in(b_in),
        .sel_in(sel_in),
        .out(out)
    );

    initial begin
        // Test Case 1: sel_in = 1, expect out = a_in
        a_in = 1'b1; 
        b_in = 1'b0; 
        sel_in = 1'b1; 
        #10;
        if (out !== a_in) begin
            $display("FAIL: Test Case 1 failed, expected out = %b, got out = %b", a_in, out);
            $finish;
        end

        // Test Case 2: sel_in = 0, expect out = b_in
        a_in = 1'b0; 
        b_in = 1'b1; 
        sel_in = 1'b0; 
        #10;
        if (out !== b_in) begin
            $display("FAIL: Test Case 2 failed, expected out = %b, got out = %b", b_in, out);
            $finish;
        end

        // Test Case 3: sel_in = 1, a_in = 0, expect out = 0
        a_in = 1'b0; 
        b_in = 1'b1; 
        sel_in = 1'b1; 
        #10;
        if (out !== a_in) begin
            $display("FAIL: Test Case 3 failed, expected out = %b, got out = %b", a_in, out);
            $finish;
        end

        // Test Case 4: sel_in = 0, a_in = 1, expect out = 1
        a_in = 1'b1; 
        b_in = 1'b0; 
        sel_in = 1'b0; 
        #10;
        if (out !== b_in) begin
            $display("FAIL: Test Case 4 failed, expected out = %b, got out = %b", b_in, out);
            $finish;
        end

        // Test Case 5: sel_in = 1, a_in = 1, expect out = 1
        a_in = 1'b1; 
        b_in = 1'b0; 
        sel_in = 1'b1; 
        #10;
        if (out !== a_in) begin
            $display("FAIL: Test Case 5 failed, expected out = %b, got out = %b", a_in, out);
            $finish;
        end

        // Test Case 6: sel_in = 0, a_in = 0, expect out = 0
        a_in = 1'b0; 
        b_in = 1'b1; 
        sel_in = 1'b0; 
        #10;
        if (out !== b_in) begin
            $display("FAIL: Test Case 6 failed, expected out = %b, got out = %b", b_in, out);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule