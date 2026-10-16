`timescale 1ns/1ps

module tb_mux;

    reg [7:0] a_i;
    reg [7:0] b_i;
    reg sel;
    wire [7:0] y_o;

    // Instantiate the module under test (uut)
    mux uut (
        .a_i(a_i),
        .b_i(b_i),
        .sel(sel),
        .y_o(y_o)
    );

    initial begin
        // Test case 1: sel = 0, expect y_o = b_i
        a_i = 8'hAA; // 10101010
        b_i = 8'h55; // 01010101
        sel = 0;
        #10;
        if (y_o !== b_i) begin
            $display("FAIL: Test case 1 failed, expected %h but got %h", b_i, y_o);
            $finish;
        end

        // Test case 2: sel = 1, expect y_o = a_i
        sel = 1;
        #10;
        if (y_o !== a_i) begin
            $display("FAIL: Test case 2 failed, expected %h but got %h", a_i, y_o);
            $finish;
        end

        // Test case 3: Change inputs and check again
        a_i = 8'hFF; // 11111111
        b_i = 8'h00; // 00000000
        sel = 0;
        #10;
        if (y_o !== b_i) begin
            $display("FAIL: Test case 3 failed, expected %h but got %h", b_i, y_o);
            $finish;
        end

        sel = 1;
        #10;
        if (y_o !== a_i) begin
            $display("FAIL: Test case 4 failed, expected %h but got %h", a_i, y_o);
            $finish;
        end

        // Test case 5: Random values
        a_i = 8'h1C; // 00011100
        b_i = 8'hE3; // 11100011
        sel = 0;
        #10;
        if (y_o !== b_i) begin
            $display("FAIL: Test case 5 failed, expected %h but got %h", b_i, y_o);
            $finish;
        end

        sel = 1;
        #10;
        if (y_o !== a_i) begin
            $display("FAIL: Test case 6 failed, expected %h but got %h", a_i, y_o);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule