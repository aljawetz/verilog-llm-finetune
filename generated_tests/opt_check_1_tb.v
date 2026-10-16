`timescale 1ns/1ps

module tb_opt_check;

    reg a;
    reg b;
    wire y;

    // Instantiate the module under test
    opt_check uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Test case 1: a is 0, b is 1
        a = 0; b = 1;
        #10;
        if (y !== 0) begin
            $display("FAIL: Test case 1 failed, expected y=0 but got y=%b", y);
            $finish;
        end

        // Test case 2: a is 0, b is 0
        a = 0; b = 0;
        #10;
        if (y !== 0) begin
            $display("FAIL: Test case 2 failed, expected y=0 but got y=%b", y);
            $finish;
        end

        // Test case 3: a is 1, b is 1
        a = 1; b = 1;
        #10;
        if (y !== 1) begin
            $display("FAIL: Test case 3 failed, expected y=1 but got y=%b", y);
            $finish;
        end

        // Test case 4: a is 1, b is 0
        a = 1; b = 0;
        #10;
        if (y !== 0) begin
            $display("FAIL: Test case 4 failed, expected y=0 but got y=%b", y);
            $finish;
        end

        // Test case 5: a is toggled
        a = 1; b = 1;
        #10;
        a = 0; 
        #10;
        if (y !== 0) begin
            $display("FAIL: Test case 5 failed, expected y=0 but got y=%b", y);
            $finish;
        end

        // Test case 6: a is toggled back
        a = 1; b = 1;
        #10;
        if (y !== 1) begin
            $display("FAIL: Test case 6 failed, expected y=1 but got y=%b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule