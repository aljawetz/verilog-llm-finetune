`timescale 1ns/1ps

module tb_SignDetector;

    // Inputs
    reg A_msb;
    reg B_msb;

    // Output
    wire Sign;

    // Instantiate the Unit Under Test (UUT)
    SignDetector uut (
        .A_msb(A_msb),
        .B_msb(B_msb),
        .Sign(Sign)
    );

    initial begin
        // Test case 1: A_msb = 0, B_msb = 0
        A_msb = 0; B_msb = 0;
        #10;
        if (Sign !== 0) begin
            $display("FAIL: Test case 1 failed, expected Sign = 0, got Sign = %b", Sign);
            $finish;
        end

        // Test case 2: A_msb = 0, B_msb = 1
        A_msb = 0; B_msb = 1;
        #10;
        if (Sign !== 1) begin
            $display("FAIL: Test case 2 failed, expected Sign = 1, got Sign = %b", Sign);
            $finish;
        end

        // Test case 3: A_msb = 1, B_msb = 0
        A_msb = 1; B_msb = 0;
        #10;
        if (Sign !== 1) begin
            $display("FAIL: Test case 3 failed, expected Sign = 1, got Sign = %b", Sign);
            $finish;
        end

        // Test case 4: A_msb = 1, B_msb = 1
        A_msb = 1; B_msb = 1;
        #10;
        if (Sign !== 0) begin
            $display("FAIL: Test case 4 failed, expected Sign = 0, got Sign = %b", Sign);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule