`timescale 1ns/1ps

module tb_comp_case;

    // Inputs
    reg i0;
    reg i1;
    reg i2;
    reg [1:0] sel;

    // Output
    wire y;

    // Instantiate the Unit Under Test (UUT)
    comp_case uut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Test case 1: sel = 00, expect y = i0
        i0 = 1'b0; i1 = 1'b1; i2 = 1'b0; sel = 2'b00;
        #10;
        if (y !== i0) begin
            $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", i0, y);
            $finish;
        end

        // Test case 2: sel = 01, expect y = i1
        sel = 2'b01;
        #10;
        if (y !== i1) begin
            $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", i1, y);
            $finish;
        end

        // Test case 3: sel = 10, expect y = i2
        sel = 2'b10;
        #10;
        if (y !== i2) begin
            $display("FAIL: Test case 3 failed, expected y = %b, got y = %b", i2, y);
            $finish;
        end

        // Test case 4: sel = 11, expect y = i2 (default case)
        sel = 2'b11;
        #10;
        if (y !== i2) begin
            $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", i2, y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule