`timescale 1ns/1ps

module tb_mux_4x1_parallel;

    // Inputs
    reg a_in;
    reg b_in;
    reg c_in;
    reg d_in;
    reg [1:0] sel_in;

    // Output
    wire y_out;

    // Instantiate the Unit Under Test (UUT)
    mux_4x1_parallel uut (
        .a_in(a_in),
        .b_in(b_in),
        .c_in(c_in),
        .d_in(d_in),
        .sel_in(sel_in),
        .y_out(y_out)
    );

    initial begin
        // Initialize inputs
        a_in = 0; b_in = 0; c_in = 0; d_in = 0; sel_in = 2'b00;

        // Test case 1: Select a_in
        a_in = 1; b_in = 0; c_in = 0; d_in = 0; sel_in = 2'b00;
        #10;
        if (y_out !== 1) begin
            $display("FAIL: Test case 1 failed, expected y_out = 1, got %b", y_out);
            $finish;
        end

        // Test case 2: Select b_in
        a_in = 0; b_in = 1; c_in = 0; d_in = 0; sel_in = 2'b01;
        #10;
        if (y_out !== 1) begin
            $display("FAIL: Test case 2 failed, expected y_out = 1, got %b", y_out);
            $finish;
        end

        // Test case 3: Select c_in
        a_in = 0; b_in = 0; c_in = 1; d_in = 0; sel_in = 2'b10;
        #10;
        if (y_out !== 1) begin
            $display("FAIL: Test case 3 failed, expected y_out = 1, got %b", y_out);
            $finish;
        end

        // Test case 4: Select d_in
        a_in = 0; b_in = 0; c_in = 0; d_in = 1; sel_in = 2'b11;
        #10;
        if (y_out !== 1) begin
            $display("FAIL: Test case 4 failed, expected y_out = 1, got %b", y_out);
            $finish;
        end

        // Test case 5: All inputs low
        a_in = 0; b_in = 0; c_in = 0; d_in = 0; sel_in = 2'b00;
        #10;
        if (y_out !== 0) begin
            $display("FAIL: Test case 5 failed, expected y_out = 0, got %b", y_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule