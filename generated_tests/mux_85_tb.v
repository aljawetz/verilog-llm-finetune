`timescale 1ns/1ps

module tb_mux;

    parameter WIDTH = 8;

    reg [WIDTH-1:0] a_in;
    reg [WIDTH-1:0] b_in;
    reg choose_b;
    wire [WIDTH-1:0] c_out;

    // Instantiate the module under test (uut)
    mux #(.WIDTH(WIDTH)) uut (
        .a_in(a_in),
        .b_in(b_in),
        .choose_b(choose_b),
        .c_out(c_out)
    );

    initial begin
        // Test case 1: choose_b = 0, expect c_out = a_in
        a_in = 8'hAA; // 10101010
        b_in = 8'h55; // 01010101
        choose_b = 0;
        #10;
        if (c_out !== a_in) begin
            $display("FAIL: Test case 1 failed, expected c_out = %h, got %h", a_in, c_out);
            $finish;
        end

        // Test case 2: choose_b = 1, expect c_out = b_in
        choose_b = 1;
        #10;
        if (c_out !== b_in) begin
            $display("FAIL: Test case 2 failed, expected c_out = %h, got %h", b_in, c_out);
            $finish;
        end

        // Test case 3: change inputs and choose_b
        a_in = 8'hFF; // 11111111
        b_in = 8'h00; // 00000000
        choose_b = 0;
        #10;
        if (c_out !== a_in) begin
            $display("FAIL: Test case 3 failed, expected c_out = %h, got %h", a_in, c_out);
            $finish;
        end
        
        choose_b = 1;
        #10;
        if (c_out !== b_in) begin
            $display("FAIL: Test case 4 failed, expected c_out = %h, got %h", b_in, c_out);
            $finish;
        end

        // Test case 5: Random values
        a_in = 8'h7E; // 01111110
        b_in = 8'h1C; // 00011100
        choose_b = 0;
        #10;
        if (c_out !== a_in) begin
            $display("FAIL: Test case 5 failed, expected c_out = %h, got %h", a_in, c_out);
            $finish;
        end
        
        choose_b = 1;
        #10;
        if (c_out !== b_in) begin
            $display("FAIL: Test case 6 failed, expected c_out = %h, got %h", b_in, c_out);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule