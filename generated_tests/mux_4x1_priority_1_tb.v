`timescale 1ns/1ps

module tb_mux_4x1_priority;

    reg a_in, b_in, c_in, d_in;
    reg [1:0] sel_in;
    wire y_out;

    // Instantiate the module under test
    mux_4x1_priority uut (
        .a_in(a_in),
        .b_in(b_in),
        .c_in(c_in),
        .d_in(d_in),
        .sel_in(sel_in),
        .y_out(y_out)
    );

    initial begin
        // Test case 1: sel_in = 11, expect y_out = d_in
        a_in = 0; b_in = 0; c_in = 0; d_in = 1; sel_in = 2'b11;
        #10;
        if (y_out !== d_in) begin
            $display("FAIL: Test case 1 failed, expected %b, got %b", d_in, y_out);
            $finish;
        end

        // Test case 2: sel_in = 10, expect y_out = c_in
        a_in = 0; b_in = 0; c_in = 1; d_in = 0; sel_in = 2'b10;
        #10;
        if (y_out !== c_in) begin
            $display("FAIL: Test case 2 failed, expected %b, got %b", c_in, y_out);
            $finish;
        end

        // Test case 3: sel_in = 01, expect y_out = b_in
        a_in = 0; b_in = 1; c_in = 0; d_in = 0; sel_in = 2'b01;
        #10;
        if (y_out !== b_in) begin
            $display("FAIL: Test case 3 failed, expected %b, got %b", b_in, y_out);
            $finish;
        end

        // Test case 4: sel_in = 00, expect y_out = a_in
        a_in = 1; b_in = 0; c_in = 0; d_in = 0; sel_in = 2'b00;
        #10;
        if (y_out !== a_in) begin
            $display("FAIL: Test case 4 failed, expected %b, got %b", a_in, y_out);
            $finish;
        end

        // Test case 5: sel_in = 11 with different d_in
        a_in = 0; b_in = 0; c_in = 0; d_in = 0; sel_in = 2'b11;
        #10;
        if (y_out !== d_in) begin
            $display("FAIL: Test case 5 failed, expected %b, got %b", d_in, y_out);
            $finish;
        end

        // Test case 6: sel_in = 10 with different c_in
        a_in = 0; b_in = 0; c_in = 0; d_in = 1; sel_in = 2'b10;
        #10;
        if (y_out !== c_in) begin
            $display("FAIL: Test case 6 failed, expected %b, got %b", c_in, y_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule