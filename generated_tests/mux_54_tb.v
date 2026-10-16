`timescale 1ns/1ps

module tb_mux;

    // Inputs
    reg a;
    reg b;
    reg sel;

    // Output
    wire y;

    // Instantiate the Unit Under Test (UUT)
    mux uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Test case 1: sel = 0, a = 1, b = 0
        a = 1; b = 0; sel = 0;
        #10;
        if (y !== 1) begin
            $display("FAIL: Test case 1 failed, expected y = 1, got y = %b", y);
            $finish;
        end

        // Test case 2: sel = 0, a = 0, b = 1
        a = 0; b = 1; sel = 0;
        #10;
        if (y !== 0) begin
            $display("FAIL: Test case 2 failed, expected y = 0, got y = %b", y);
            $finish;
        end

        // Test case 3: sel = 1, a = 1, b = 0
        a = 1; b = 0; sel = 1;
        #10;
        if (y !== 0) begin
            $display("FAIL: Test case 3 failed, expected y = 0, got y = %b", y);
            $finish;
        end

        // Test case 4: sel = 1, a = 0, b = 1
        a = 0; b = 1; sel = 1;
        #10;
        if (y !== 1) begin
            $display("FAIL: Test case 4 failed, expected y = 1, got y = %b", y);
            $finish;
        end

        // Test case 5: sel = 0, a = 1, b = 1
        a = 1; b = 1; sel = 0;
        #10;
        if (y !== 1) begin
            $display("FAIL: Test case 5 failed, expected y = 1, got y = %b", y);
            $finish;
        end

        // Test case 6: sel = 1, a = 0, b = 0
        a = 0; b = 0; sel = 1;
        #10;
        if (y !== 0) begin
            $display("FAIL: Test case 6 failed, expected y = 0, got y = %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule