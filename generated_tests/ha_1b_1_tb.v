`timescale 1ns/1ps

module tb_ha_1b;

    // Inputs
    reg IN0;
    reg IN1;

    // Outputs
    wire SUM;
    wire CARRY_OUT;

    // Instantiate the Unit Under Test (UUT)
    ha_1b uut (
        .IN0(IN0),
        .IN1(IN1),
        .SUM(SUM),
        .CARRY_OUT(CARRY_OUT)
    );

    initial begin
        // Test case 1: IN0 = 0, IN1 = 0
        IN0 = 0; IN1 = 0;
        #10;
        if (SUM !== 0 || CARRY_OUT !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: IN0 = 0, IN1 = 1
        IN0 = 0; IN1 = 1;
        #10;
        if (SUM !== 1 || CARRY_OUT !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: IN0 = 1, IN1 = 0
        IN0 = 1; IN1 = 0;
        #10;
        if (SUM !== 1 || CARRY_OUT !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: IN0 = 1, IN1 = 1
        IN0 = 1; IN1 = 1;
        #10;
        if (SUM !== 0 || CARRY_OUT !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule