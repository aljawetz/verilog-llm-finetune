`timescale 1ns/1ps

module tb_barrel_shifter;

    reg [3:0] data_in;
    reg [1:0] shift;
    reg dir;
    wire [3:0] data_out;

    // Instantiate the barrel shifter module
    barrel_shifter uut (
        .data_in(data_in),
        .shift(shift),
        .dir(dir),
        .data_out(data_out)
    );

    initial begin
        // Test Case 1: No shift left
        data_in = 4'b1010; shift = 2'b00; dir = 1'b0; #10;
        if (data_out !== 4'b1010) $display("FAIL: Test Case 1 failed");

        // Test Case 2: Shift left by 1
        data_in = 4'b1010; shift = 2'b01; dir = 1'b0; #10;
        if (data_out !== 4'b0100) $display("FAIL: Test Case 2 failed");

        // Test Case 3: Shift left by 2
        data_in = 4'b1010; shift = 2'b10; dir = 1'b0; #10;
        if (data_out !== 4'b1000) $display("FAIL: Test Case 3 failed");

        // Test Case 4: Shift left by 3
        data_in = 4'b1010; shift = 2'b11; dir = 1'b0; #10;
        if (data_out !== 4'b0000) $display("FAIL: Test Case 4 failed");

        // Test Case 5: No shift right
        data_in = 4'b1010; shift = 2'b00; dir = 1'b1; #10;
        if (data_out !== 4'b1010) $display("FAIL: Test Case 5 failed");

        // Test Case 6: Shift right by 1
        data_in = 4'b1010; shift = 2'b01; dir = 1'b1; #10;
        if (data_out !== 4'b0101) $display("FAIL: Test Case 6 failed");

        // Test Case 7: Shift right by 2
        data_in = 4'b1010; shift = 2'b10; dir = 1'b1; #10;
        if (data_out !== 4'b0010) $display("FAIL: Test Case 7 failed");

        // Test Case 8: Shift right by 3
        data_in = 4'b1010; shift = 2'b11; dir = 1'b1; #10;
        if (data_out !== 4'b0001) $display("FAIL: Test Case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule