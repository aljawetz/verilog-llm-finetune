`timescale 1ns/1ps

module tb_two2one_MUX;

    // Inputs
    reg [7:0] a_i;
    reg [7:0] b_i;
    reg sel_i;

    // Output
    wire [7:0] y_o;

    // Instantiate the Unit Under Test (UUT)
    two2one_MUX uut (
        .a_i(a_i),
        .b_i(b_i),
        .sel_i(sel_i),
        .y_o(y_o)
    );

    initial begin
        // Test Case 1: sel_i = 1, expect y_o = a_i
        a_i = 8'hAA; // 10101010
        b_i = 8'h55; // 01010101
        sel_i = 1'b1;
        #10;
        if (y_o !== a_i) begin
            $display("FAIL: Test Case 1 failed, expected %h but got %h", a_i, y_o);
            $finish;
        end

        // Test Case 2: sel_i = 0, expect y_o = b_i
        sel_i = 1'b0;
        #10;
        if (y_o !== b_i) begin
            $display("FAIL: Test Case 2 failed, expected %h but got %h", b_i, y_o);
            $finish;
        end

        // Test Case 3: sel_i = 1, different values
        a_i = 8'hFF; // 11111111
        b_i = 8'h00; // 00000000
        sel_i = 1'b1;
        #10;
        if (y_o !== a_i) begin
            $display("FAIL: Test Case 3 failed, expected %h but got %h", a_i, y_o);
            $finish;
        end

        // Test Case 4: sel_i = 0, different values
        sel_i = 1'b0;
        #10;
        if (y_o !== b_i) begin
            $display("FAIL: Test Case 4 failed, expected %h but got %h", b_i, y_o);
            $finish;
        end

        // Test Case 5: sel_i = 1, random values
        a_i = 8'h7E; // 01111110
        b_i = 8'h81; // 10000001
        sel_i = 1'b1;
        #10;
        if (y_o !== a_i) begin
            $display("FAIL: Test Case 5 failed, expected %h but got %h", a_i, y_o);
            $finish;
        end

        // Test Case 6: sel_i = 0, random values
        sel_i = 1'b0;
        #10;
        if (y_o !== b_i) begin
            $display("FAIL: Test Case 6 failed, expected %h but got %h", b_i, y_o);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule