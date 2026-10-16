`timescale 1ns/1ps

module tb_not1;

    // Inputs
    reg a;

    // Outputs
    wire p;

    // Instantiate the Unit Under Test (UUT)
    not1 uut (
        .a(a),
        .p(p)
    );

    initial begin
        // Test case 1: a = 0, expect p = 1
        a = 0;
        #10;
        if (p !== 1) begin
            $display("FAIL: Test case 1 failed, expected p = 1 but got p = %b", p);
            $finish;
        end

        // Test case 2: a = 1, expect p = 0
        a = 1;
        #10;
        if (p !== 0) begin
            $display("FAIL: Test case 2 failed, expected p = 0 but got p = %b", p);
            $finish;
        end

        // Test case 3: a = 0, expect p = 1
        a = 0;
        #10;
        if (p !== 1) begin
            $display("FAIL: Test case 3 failed, expected p = 1 but got p = %b", p);
            $finish;
        end

        // Test case 4: a = 1, expect p = 0
        a = 1;
        #10;
        if (p !== 0) begin
            $display("FAIL: Test case 4 failed, expected p = 0 but got p = %b", p);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule