`timescale 1ns/1ps

module tb_mux_4_1_dataflow;

    // Inputs
    reg a_in;
    reg b_in;
    reg c_in;
    reg d_in;
    reg [1:0] sel_in;

    // Output
    wire d_out;

    // Instantiate the Unit Under Test (UUT)
    mux_4_1_dataflow uut (
        .a_in(a_in),
        .b_in(b_in),
        .c_in(c_in),
        .d_in(d_in),
        .sel_in(sel_in),
        .d_out(d_out)
    );

    initial begin
        // Test case 1: Select a_in
        a_in = 1'b1; b_in = 1'b0; c_in = 1'b0; d_in = 1'b0; sel_in = 2'b00;
        #10;
        if (d_out !== a_in) $display("FAIL: Test case 1 failed, expected %b, got %b", a_in, d_out);

        // Test case 2: Select b_in
        a_in = 1'b0; b_in = 1'b1; c_in = 1'b0; d_in = 1'b0; sel_in = 2'b01;
        #10;
        if (d_out !== b_in) $display("FAIL: Test case 2 failed, expected %b, got %b", b_in, d_out);

        // Test case 3: Select c_in
        a_in = 1'b0; b_in = 1'b0; c_in = 1'b1; d_in = 1'b0; sel_in = 2'b10;
        #10;
        if (d_out !== c_in) $display("FAIL: Test case 3 failed, expected %b, got %b", c_in, d_out);

        // Test case 4: Select d_in
        a_in = 1'b0; b_in = 1'b0; c_in = 1'b0; d_in = 1'b1; sel_in = 2'b11;
        #10;
        if (d_out !== d_in) $display("FAIL: Test case 4 failed, expected %b, got %b", d_in, d_out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule