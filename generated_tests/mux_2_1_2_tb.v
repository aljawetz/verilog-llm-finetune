`timescale 1ns/1ps

module tb_mux_2_1;

    // Inputs
    reg [1:0] i;
    reg select;

    // Output
    wire y_out;

    // Instantiate the Unit Under Test (UUT)
    mux_2_1 uut (
        .i(i),
        .select(select),
        .y_out(y_out)
    );

    initial begin
        // Test Case 1: Select input 0
        i = 2'b01; // i[0] = 1, i[1] = 0
        select = 1'b0; // Select i[0]
        #10; // Wait for 10 time units
        if (y_out !== 1'b1) begin
            $display("FAIL: Test Case 1 failed, expected y_out = 1, got y_out = %b", y_out);
            $finish;
        end

        // Test Case 2: Select input 1
        i = 2'b10; // i[0] = 0, i[1] = 1
        select = 1'b1; // Select i[1]
        #10; // Wait for 10 time units
        if (y_out !== 1'b1) begin
            $display("FAIL: Test Case 2 failed, expected y_out = 1, got y_out = %b", y_out);
            $finish;
        end

        // Test Case 3: Select input 0 again
        i = 2'b11; // i[0] = 1, i[1] = 1
        select = 1'b0; // Select i[0]
        #10; // Wait for 10 time units
        if (y_out !== 1'b1) begin
            $display("FAIL: Test Case 3 failed, expected y_out = 1, got y_out = %b", y_out);
            $finish;
        end

        // Test Case 4: Select input 1 again
        i = 2'b00; // i[0] = 0, i[1] = 0
        select = 1'b1; // Select i[1]
        #10; // Wait for 10 time units
        if (y_out !== 1'b0) begin
            $display("FAIL: Test Case 4 failed, expected y_out = 0, got y_out = %b", y_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule