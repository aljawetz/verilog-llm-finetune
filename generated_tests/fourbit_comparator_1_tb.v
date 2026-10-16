`timescale 1ns/1ps

module tb_fourbit_comparator;

    reg [3:0] a_in;
    reg [3:0] b_in;
    wire [2:0] d_out;

    // Instantiate the module under test (uut)
    fourbit_comparator uut (
        .a_in(a_in),
        .b_in(b_in),
        .d_out(d_out)
    );

    initial begin
        // Test case 1: a_in > b_in
        a_in = 4'b1010; // 10
        b_in = 4'b0111; // 7
        #10;
        if (d_out !== 3'b001) begin
            $display("FAIL: Test case 1 failed, expected 3'b001, got %b", d_out);
            $finish;
        end

        // Test case 2: a_in < b_in
        a_in = 4'b0011; // 3
        b_in = 4'b0101; // 5
        #10;
        if (d_out !== 3'b010) begin
            $display("FAIL: Test case 2 failed, expected 3'b010, got %b", d_out);
            $finish;
        end

        // Test case 3: a_in == b_in
        a_in = 4'b1001; // 9
        b_in = 4'b1001; // 9
        #10;
        if (d_out !== 3'b100) begin
            $display("FAIL: Test case 3 failed, expected 3'b100, got %b", d_out);
            $finish;
        end

        // Test case 4: a_in < b_in (edge case)
        a_in = 4'b0000; // 0
        b_in = 4'b0001; // 1
        #10;
        if (d_out !== 3'b010) begin
            $display("FAIL: Test case 4 failed, expected 3'b010, got %b", d_out);
            $finish;
        end

        // Test case 5: a_in > b_in (edge case)
        a_in = 4'b1111; // 15
        b_in = 4'b1110; // 14
        #10;
        if (d_out !== 3'b001) begin
            $display("FAIL: Test case 5 failed, expected 3'b001, got %b", d_out);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule