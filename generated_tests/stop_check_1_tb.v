`timescale 1ns/1ps

module tb_stop_check;

    reg stop_check_enable;
    reg sampled_data;
    wire stop_err;

    // Instantiate the module under test (uut)
    stop_check uut (
        .stop_check_enable(stop_check_enable),
        .sampled_data(sampled_data),
        .stop_err(stop_err)
    );

    initial begin
        // Test case 1: Check when stop_check_enable is low
        stop_check_enable = 0;
        sampled_data = 0; // arbitrary value
        #10;
        if (stop_err !== 1) begin
            $display("FAIL: Expected stop_err to be 1 when stop_check_enable is low");
            $finish;
        end

        // Test case 2: Check when stop_check_enable is high and sampled_data equals STOP_BIT
        stop_check_enable = 1;
        sampled_data = 1; // STOP_BIT is 1
        #10;
        if (stop_err !== 0) begin
            $display("FAIL: Expected stop_err to be 0 when sampled_data equals STOP_BIT");
            $finish;
        end

        // Test case 3: Check when stop_check_enable is high and sampled_data does not equal STOP_BIT
        sampled_data = 0; // different from STOP_BIT
        #10;
        if (stop_err !== 1) begin
            $display("FAIL: Expected stop_err to be 1 when sampled_data does not equal STOP_BIT");
            $finish;
        end

        // Test case 4: Check when stop_check_enable is high and sampled_data equals STOP_BIT again
        sampled_data = 1; // back to STOP_BIT
        #10;
        if (stop_err !== 0) begin
            $display("FAIL: Expected stop_err to be 0 when sampled_data equals STOP_BIT again");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule