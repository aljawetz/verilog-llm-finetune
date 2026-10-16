`timescale 1ns/1ps

module tb_top_module;

    // Inputs
    reg cpu_overheated;
    reg arrived;
    reg gas_tank_empty;

    // Outputs
    wire shut_off_computer;
    wire keep_driving;

    // Instantiate the Unit Under Test (UUT)
    top_module uut (
        .cpu_overheated(cpu_overheated),
        .shut_off_computer(shut_off_computer),
        .arrived(arrived),
        .gas_tank_empty(gas_tank_empty),
        .keep_driving(keep_driving)
    );

    initial begin
        // Initialize Inputs
        cpu_overheated = 0;
        arrived = 0;
        gas_tank_empty = 0;

        // Test Case 1: Normal operation, not overheated, not arrived, gas tank not empty
        #10;
        if (shut_off_computer !== 0 || keep_driving !== 1) begin
            $display("FAIL: Test Case 1 failed");
            $finish;
        end

        // Test Case 2: CPU overheated
        cpu_overheated = 1;
        #10;
        if (shut_off_computer !== 1 || keep_driving !== 1) begin
            $display("FAIL: Test Case 2 failed");
            $finish;
        end

        // Test Case 3: Arrived at destination
        arrived = 1;
        #10;
        if (shut_off_computer !== 1 || keep_driving !== 0) begin
            $display("FAIL: Test Case 3 failed");
            $finish;
        end

        // Test Case 4: Gas tank empty, not arrived
        arrived = 0;
        gas_tank_empty = 1;
        #10;
        if (shut_off_computer !== 1 || keep_driving !== 0) begin
            $display("FAIL: Test Case 4 failed");
            $finish;
        end

        // Test Case 5: Gas tank not empty, not arrived
        gas_tank_empty = 0;
        #10;
        if (shut_off_computer !== 1 || keep_driving !== 1) begin
            $display("FAIL: Test Case 5 failed");
            $finish;
        end

        // Test Case 6: CPU not overheated, arrived, gas tank empty
        cpu_overheated = 0;
        arrived = 1;
        gas_tank_empty = 1;
        #10;
        if (shut_off_computer !== 0 || keep_driving !== 0) begin
            $display("FAIL: Test Case 6 failed");
            $finish;
        end

        // Test Case 7: CPU not overheated, arrived, gas tank not empty
        gas_tank_empty = 0;
        #10;
        if (shut_off_computer !== 0 || keep_driving !== 0) begin
            $display("FAIL: Test Case 7 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule