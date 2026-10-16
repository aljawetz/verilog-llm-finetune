`timescale 1ns/1ps

module tb_mux_2_1;

    // Inputs
    reg i1;
    reg i2;
    reg s0;

    // Output
    wire y;

    // Instantiate the Unit Under Test (UUT)
    mux_2_1 uut (
        .i1(i1),
        .i2(i2),
        .s0(s0),
        .y(y)
    );

    initial begin
        // Test case 1: s0 = 0, expect y = i1
        i1 = 1'b0; i2 = 1'b1; s0 = 1'b0;
        #10;
        if (y !== i1) begin
            $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", i1, y);
            $finish;
        end

        // Test case 2: s0 = 1, expect y = i2
        i1 = 1'b0; i2 = 1'b1; s0 = 1'b1;
        #10;
        if (y !== i2) begin
            $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", i2, y);
            $finish;
        end

        // Test case 3: s0 = 0, expect y = i1
        i1 = 1'b1; i2 = 1'b0; s0 = 1'b0;
        #10;
        if (y !== i1) begin
            $display("FAIL: Test case 3 failed, expected y = %b, got y = %b", i1, y);
            $finish;
        end

        // Test case 4: s0 = 1, expect y = i2
        i1 = 1'b1; i2 = 1'b0; s0 = 1'b1;
        #10;
        if (y !== i2) begin
            $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", i2, y);
            $finish;
        end

        // Test case 5: s0 = 0, expect y = i1
        i1 = 1'bx; i2 = 1'b1; s0 = 1'b0; // Testing with unknown value
        #10;
        if (y !== i1) begin
            $display("FAIL: Test case 5 failed, expected y = %b, got y = %b", i1, y);
            $finish;
        end

        // Test case 6: s0 = 1, expect y = i2
        i1 = 1'b0; i2 = 1'bx; s0 = 1'b1; // Testing with unknown value
        #10;
        if (y !== i2) begin
            $display("FAIL: Test case 6 failed, expected y = %b, got y = %b", i2, y);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule