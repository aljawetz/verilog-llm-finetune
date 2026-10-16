`timescale 1ns/1ps

module tb_incomp_case;

    // Inputs
    reg i0;
    reg i1;
    reg i2;
    reg [1:0] sel;

    // Output
    wire y;

    // Instantiate the Unit Under Test (UUT)
    incomp_case uut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Initialize Inputs
        i0 = 0; i1 = 0; i2 = 0; sel = 2'b00;

        // Test Case 1: sel = 00, expect y = i0
        #10;
        i0 = 1; i1 = 0; i2 = 0; sel = 2'b00;
        #10;
        if (y !== i0) begin
            $display("FAIL: Test Case 1 failed, expected y = %b, got y = %b", i0, y);
            $finish;
        end

        // Test Case 2: sel = 01, expect y = i1
        #10;
        i0 = 0; i1 = 1; i2 = 0; sel = 2'b01;
        #10;
        if (y !== i1) begin
            $display("FAIL: Test Case 2 failed, expected y = %b, got y = %b", i1, y);
            $finish;
        end

        // Test Case 3: sel = 10, expect y unchanged (previous value)
        #10;
        sel = 2'b10; // y should remain as i1
        #10;
        if (y !== i1) begin
            $display("FAIL: Test Case 3 failed, expected y = %b, got y = %b", i1, y);
            $finish;
        end

        // Test Case 4: sel = 11, expect y unchanged (previous value)
        #10;
        sel = 2'b11; // y should remain as i1
        #10;
        if (y !== i1) begin
            $display("FAIL: Test Case 4 failed, expected y = %b, got y = %b", i1, y);
            $finish;
        end

        // Test Case 5: sel = 00 again, expect y = i0
        #10;
        i0 = 1; i1 = 0; i2 = 0; sel = 2'b00;
        #10;
        if (y !== i0) begin
            $display("FAIL: Test Case 5 failed, expected y = %b, got y = %b", i0, y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule